#ifndef COOKIE_H
#define COOKIE_H

#include <QNetworkCookieJar>

class Cookie : public QNetworkCookieJar
{   
public:
    Cookie();

    bool parseCookie();
    bool saveCookie();

};

#endif // COOKIE_H
