#include <QObject>
#include <iostream>

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

