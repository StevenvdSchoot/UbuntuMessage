#ifndef CPPHANDLER_H
#define CPPHANDLER_H

#include <QObject>

class CppHandler : public QObject
{
    Q_OBJECT
public:
    explicit CppHandler(QObject *parent = 0)
    {
        ;
    }
    
signals:

public slots:
    void test()
    {
        qDebug("Trigger!");
    }
    
};

#endif // CPPHANDLER_H
