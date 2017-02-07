#include <QObject>
#include <QNetworkCookieJar>
#include <QNetworkCookie>
#include <QString>

#include <iostream>
#include <tuple>

#include "networksignalslot.h"

NetworkSignalSlot::NetworkSignalSlot()
{

}

void NetworkSignalSlot::slotTest()
{
    std::cout << "signaltest" << std::endl;

    //emit singal
    emit signalTest(3);
}

void NetworkSignalSlot::login()
{
    std::cout << "login process started" << std::endl;
}

void NetworkSignalSlot::restoreCookie()
{

}

QNetworkCookie NetworkSignalSlot::loadCookie()
{
    QNetworkCookie hogehoge;
    return hogehoge;
}


