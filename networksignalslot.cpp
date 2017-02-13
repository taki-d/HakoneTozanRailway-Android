#include <QObject>
#include <QNetworkCookieJar>
#include <QNetworkCookie>
#include <QString>
#include <QNetworkReply>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QEventLoop>
#include <QTimer>

#include <iostream>
#include <tuple>

#include "networksignalslot.h"


NetworkSignalSlot::NetworkSignalSlot()
{

    QNAManager = new QNetworkAccessManager(this);
    QNAManager->setCookieJar(new QNetworkCookieJar(QNAManager));

    connect(QNAManager,&QNetworkAccessManager::finished,this,&NetworkSignalSlot::replayFinished);


}

void NetworkSignalSlot::slotTest()
{
    std::cout << "signaltest" << std::endl;
    login();
    //emit singal
    emit signalTest(3);
}

void NetworkSignalSlot::login()
{
    std::cout << "login process started" << std::endl;

    QNetworkRequest req;
    req.setUrl(QUrl("http://localhost:3001/login"));
    QByteArray postData;
    postData.append("username=takahiro&password=takahiro");
    QNAManager->post(req,postData);

//    QNetworkAccessManager manager;
//    QNetworkRequest req(url  /*"login?username=takahiro&password=takahiro"*/);

//    QNetworkReply* replay = manager.get(req);

//    QUrl redirect  = replay->attribute(QNetworkRequest::RedirectionTargetAttribute).toUrl();

//    std::cout << "" << std::endl;

//    std::cout << redirect.url().toUtf8().toStdString() << std::endl;

//    if(url == redirect.url()){
//        std::cout << "redirected" << std::endl;
//    }
}

void NetworkSignalSlot::restoreCookie()
{

}

QNetworkCookie NetworkSignalSlot::loadCookie()
{
    QNetworkCookie hogehoge;
    return hogehoge;
}

void NetworkSignalSlot::replayFinished(QNetworkReply* reply)
{

    std::cout << "reply finished" << std::endl;
//    QString res = QString::fromUtf8(reply->readAll().data());
//    std::cout << res.toUtf8().constData() << std::endl;
//    std::cout << reply->request().url().url().toUtf8().constData() << std::endl;

    QString requestURL = reply->request().url().url();

    if(reply->error() == QNetworkReply::NoError){

        if(requestURL == "http://localhost:3001/"){

            std::cout << "/ " << "accessed" << std::endl;

        }else if(requestURL == "http://localhost:3001/login"){

            int statusCode = reply->attribute(QNetworkRequest::HttpStatusCodeAttribute).toInt();

            std::cout << statusCode << std::endl;

            if(statusCode == 302){
                //すぐにloginが終わりすぎて悲しいのでwait(2000)
                QEventLoop loop;
                QTimer::singleShot(2000,&loop,&QEventLoop::quit);
                loop.exec();

                emit loginFinished(true,0);

//                    QNetworkRequest req;
//                    req.setUrl(QUrl("http://localhost:3001/"));
//                    QNAManager->get(req);

            }else{

                //すぐにLoginが終わりすぎてかなしいのでwait(2000)
                QEventLoop loop;
                QTimer::singleShot(2000,&loop,&QEventLoop::quit);
                loop.exec();

                emit loginFinished(false,1);

            }

            std::cout << "/login " << "accessd"  << std::endl;

        }else{

            std::cout << "unkown location" << std::endl;

        }

    }else{

        std::cout << "erorororrrrrr" << std::endl;

        //すぐにLoginが終わりすぎてかなしいのでwait(2000)
        QEventLoop loop;
        QTimer::singleShot(2000,&loop,&QEventLoop::quit);
        loop.exec();

        emit loginFinished(false,2);

    }
}


