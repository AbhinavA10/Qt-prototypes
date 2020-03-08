#include "sensordata.h"
#include <QDebug>

SensorData::SensorData(QObject *parent) :
    QObject(parent)
{
    // for simulating sensor data
    srand( (unsigned)time(NULL) );
    m_timer.setInterval(100);
    m_timer.setSingleShot(false);
    QObject::connect(&m_timer, &QTimer::timeout, this, &SensorData::slot_updateReading);
    m_timer.start();
}

void SensorData::slot_updateReading(){
    static int n=0;
    // simulate my sensor data
    m_sensorReading = modf(rand() /  100000.0, &temp);
    m_sensorReading += rand() % 6 + 1;
    qDebug()<<"Reading number: "<<n++;
    emit sensorReadingChanged();
}
