#include <QLibraryInfo>
#include <QDir>
#include <QProcess>
#include <QDebug>

#include <QtGui/QGuiApplication>
#include <QtGui/QGuiApplication>

#include <QtQml/QQmlContext>
#include <QtQml/QQmlEngine>
#include <QtQml/QQmlComponent>

#include <QtQuick/QQuickItem>
#include <QtQuick/QQuickView>

#include "qtquick2applicationviewer.h"

#include "cpphandler.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    qmlRegisterInterface<CppHandler>("CppHandler");

    QtQuick2ApplicationViewer viewer;
    CppHandler cppHandler;
    viewer.engine()->rootContext()->setContextProperty("CppHandler", &cppHandler);

    viewer.setMainQmlFile(QStringLiteral("qml/main.qml"));
    viewer.showExpanded();

    return app.exec();
}

void doSomeTesting()
{
    printf("HELLO WORLD!\n");
}
