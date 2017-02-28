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
    QString url = "http://locahost:3000/";
    QNetworkAccessManager *QNAManager;

    void restoreCookie();
    QNetworkCookie loadCookie();


signals:
    void signalTest(int test);
    void loginFinished(bool success,int status_code);
        /*
         * status_code
         *  0:Success
         *  1:Password or Username is wrong.
         *  2:Check Network Connection with Server
        */


public slots:
    void slotTest();
    void login();
    void replayFinished(QNetworkReply *reply);
};

#endif // NETWORKSIGNALSLOT_H
