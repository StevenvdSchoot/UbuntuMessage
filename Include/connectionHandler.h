#ifndef CONNECTIONHANDLER_H
#define CONNECTIONHANDLER_H

#include <QtDebug>
#include <QThread>

#include <boost/bind.hpp>
#include <Swiften/Swiften.h>

using namespace Swift;
using namespace boost;

class connectionHandler : public QThread
{
private:
    Client* client;
    ClientXMLTracer* tracer;
    SimpleEventLoop eventLoop;

    void handleConnected()
    {
        qDebug() << "Connected to server!";
    }

    void handleMessageReceived(Message::ref message)
    {
        qDebug() << "Received message:" << "| Type:" << message->getType() << "| Subject:" << message->getSubject() << "| Body:" << message->getBody() << "|";
        message->setTo(message->getFrom());
        message->setFrom(JID());
        client->sendMessage(message);
    }

public:

    connectionHandler()
    {
        BoostNetworkFactories networkFactories = &eventLoop;

        client = new Client("echobot@wonderland.lit", "mypass", &networkFactories);
        client->setAlwaysTrustCertificates();
        client->onConnected.connect(bind(&connectionHandler::handleConnected, this));
        client->onMessageReceived.connect(bind(&connectionHandler::handleMessageReceived, this, _1));
        tracer = new ClientXMLTracer(client);
        client->connect();

        this->start( /* Priority */ );
    }

    ~connectionHandler()
    {
        eventLoop.stop();
        while(this->isRunning());

        client->disconnect();

        delete tracer;
        delete client;
    }


protected:

    void run()
    {
        eventLoop.run();
    }

};

#endif // CONNECTIONHANDLER_H
