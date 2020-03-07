#include "sensordata.h"
#include <QDebug>

SensorData::SensorData(QObject *parent) :
    QObject(parent)
{
    m_timer.setInterval(100);
    m_timer.setSingleShot(false);
    QObject::connect(&m_timer, &QTimer::timeout, this, &SensorData::slot_updateReading);
    m_timer.start();
}

void SensorData::slot_updateReading(){
    m_sensorReading = 5;
    //TODO: randomize
    qDebug()<<"new reading";
    emit sensorReadingChanged();
}
