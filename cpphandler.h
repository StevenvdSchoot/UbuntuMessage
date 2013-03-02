#ifndef CPPHANDLER_H
#define CPPHANDLER_H

#include <QObject>

#define UNUSED(x) UNUSED_ ## x __attribute__((unused))

class CppHandler : public QObject
{
    Q_OBJECT
public:
    explicit CppHandler(QObject* UNUSED(parent) = 0)
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
