#include <QObject>
#include <QNetworkCookieJar>
#include <QNetworkCookie>
#include <QString>
#include <QNetworkReply>
#include <QNetworkAccessManager>
#include <QNetworkRequest>
#include <QEventLoop>
#include <QTimer>
#include <QJsonDocument>
#include <QJsonObject>
#include <QJsonArray>

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
    req.setUrl(QUrl("http://localhost:3000/login"));
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

        if(requestURL == "http://localhost:3000/"){

            std::cout << "/ " << "accessed" << std::endl;

        }else if(requestURL == "http://localhost:3000/login"){

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

    }else if(requestURL == "http://locahost:3000/api/me"){

        QString res = QString::fromUtf8(reply->readAll().data());

        QJsonDocument jsondoc = QJsonDocument::fromJson(reply->readAll().data());
        QJsonObject jsonObj = jsondoc.object();
        QStringList keylist = jsonObj.keys();

        bool isThereData = false;

        for (int b = 0; b < keylist.length(); ++b) {
            if(keylist[b] == "attendance"){
                break;
                isThereData = true;
            }
        }

        if(isThereData){

            QJsonArray attendace = jsonObj.value("attendance").toArray();

            foreach (QJsonValue value, attendace) {
                QJsonObject obj = value.toObject();
            }


        }else{
            emit loadAttendanceDataFinished(false,2,false,false,false,false,false,false,false,false);
        }


    }else{

        std::cout << "erorororrrrrr" << std::endl;

        //すぐにLoginが終わりすぎてかなしいのでwait(2000)
        QEventLoop loop;
        QTimer::singleShot(2000,&loop,&QEventLoop::quit);
        loop.exec();

        std::cout << requestURL.toUtf8().constData() << std::endl;
        if(requestURL == "http://localhost:3000/login"){
            emit loginFinished(false,2);
        }else{
            emit loadAttendanceDataFinished(false,3,false,false,false,false,false,false,false,false);
        }

    }
}

void NetworkSignalSlot::loadAttendanceData(int month, int day)
{
    std::cout << "m:" << month << std::endl;
    std::cout << "d:" << day << std::endl;

    std::string mon = std::to_string(month).length() < 2 ? "0" + std::to_string(month) : std::to_string(day);
    std::string day = std::to_string(day).length() < 2 ? "0" + std::to_string(day) : std::to_string(day);
    
    std::cout << "loadAttendanceDataProcess" << std::endl;

    QNetworkRequest req;
    req.setUrl(QUrl("http://localhost:3000/api/me/" + "2017-" + mon + "-" + day));
    QNAManager->get(req);

    std::cout << "attendance data requested" << std::endl;
}


