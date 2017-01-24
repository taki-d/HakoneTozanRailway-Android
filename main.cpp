#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQuickItem>

#include <vector>

int main(int argc, char *argv[])
{
    //Support High DPI Device
    QGuiApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
    QGuiApplication app(argc, argv);

    //if you want to register class to QtQuick, please write like this!
//    qmlRegisterType<std::vector>("vector",1,0,"vector");

    QQmlApplicationEngine engine;
    engine.load(QUrl(QStringLiteral("qrc:/main.qml")));

    return app.exec();

}
