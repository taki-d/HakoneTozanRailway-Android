#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <QQuickStyle>
#include <QQmlContext>

#include <vector>

#include "networksignalslot.h"

int main(int argc, char *argv[])
{
    //Support High DPI Device
#ifdef ANDROID
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
#else
    //hogehoge
#endif

    QGuiApplication app(argc, argv);
    QGuiApplication::setApplicationName("HTT Bread");
    QGuiApplication::setApplicationVersion("beta0.1");

    //if you want to register class to QtQuick, please write like this!
//    qmlRegisterType<std::vector>("vector",1,0,"vector");

    //set qtquickstyles
    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;

//    QObject *root = engine.rootObjects().first();
    NetworkSignalSlot obj;
    engine.rootContext()->setContextProperty("networkSignalSlot",&obj);

    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    return app.exec();

}
