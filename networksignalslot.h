#ifndef NETWORKSIGNALSLOT_H
#define NETWORKSIGNALSLOT_H

#include <QObject>

class NetworkSignalSlot : public QObject
{

    Q_OBJECT

public:
    NetworkSignalSlot();

signals:
    void signalTest(int test);

public slots:
    void slotTest();
};

#endif // NETWORKSIGNALSLOT_H
