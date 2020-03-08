#include "camerainfo.h"
#include <QDebug>

CameraInfo::CameraInfo(QObject *parent) :
    QObject(parent)
{
    // for simulating sensor data
    srand( (unsigned)time(NULL) );
    m_timer.setInterval(1000);
    m_timer.setSingleShot(false);
    QObject::connect(&m_timer, &QTimer::timeout, this, &CameraInfo::slot_updateReading);
    m_timer.start();
}

// simulate my sensor data
void CameraInfo::slot_updateReading(){
    m_sensorReading = modf(rand() /  100000.0, &temp);
    m_sensorReading += rand() % 6 + 1;
    emit sensorReadingChanged(); // emit for QML binding to update
}
