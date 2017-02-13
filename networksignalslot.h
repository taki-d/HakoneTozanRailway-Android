#ifndef NETWORKSIGNALSLOT_H
#define NETWORKSIGNALSLOT_H

#include <QObject>
#include <QNetworkCookieJar>
#include <QNetworkAccessManager>

class NetworkSignalSlot : public QObject
{

    Q_OBJECT

public:
    NetworkSignalSlot();

private:
    QString url = "http://locahost:3001/";
    QNetworkAccessManager *QNAManager;

    void restoreCookie();
    QNetworkCookie loadCookie();


signals:
    void signalTest(int test);
    void loginFinished(bool success);

public slots:
    void slotTest();
    void login();
    void replayFinished(QNetworkReply *reply);
};

#endif // NETWORKSIGNALSLOT_H
