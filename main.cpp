#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickItem>
#include <QQuickStyle>

#include <vector>

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

    //qtquickstyles
    QQuickStyle::setStyle("Material");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));


    return app.exec();

}
