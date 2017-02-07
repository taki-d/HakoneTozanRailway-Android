#ifndef NETWORKSIGNALSLOT_H
#define NETWORKSIGNALSLOT_H

#include <QObject>
#include <QNetworkCookieJar>

class NetworkSignalSlot : public QObject
{

    Q_OBJECT

public:
    NetworkSignalSlot();

private:
    void restoreCookie();
    QNetworkCookie loadCookie();

signals:
    void signalTest(int test);

public slots:
    void slotTest();
    void login();
};

#endif // NETWORKSIGNALSLOT_H
