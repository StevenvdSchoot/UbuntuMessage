#ifndef QMLFUNCTIONHANDLER_H
#define QMLFUNCTIONHANDLER_H

#include <QObject>
#include <QtDebug>

#include <QQmlContext>
#include <QQmlEngine>
#include <QtQuick/QQuickItem>
#include <QtQuick/QQuickView>

class QmlFunctionHandler : public QObject
{
    Q_OBJECT

public:
    QmlFunctionHandler(QQuickView *m_view)
    {
        this->m_view = m_view;
    }

private:
    QQuickView *m_view;

public slots:

    void init()
    {
        qDebug() << "Mainview ObjectName:";
    }

    void test()
    {
        QObjectList objs =  this->m_view->children();// ->rootContext()->children();
        for(int i = 0;i<objs.size();i++)
        {
            qDebug() << "Object name:" << objs.at(i)->objectName();
        }
    }

};

#endif // QMLFUNCTIONHANDLER_H
