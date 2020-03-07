#ifndef BACKEND_H
#define BACKEND_H
#include "sensordata.h"
#include <QObject>
#include <QQmlApplicationEngine>

class Backend: public QObject
{
    Q_OBJECT
public:
    Backend(QQmlApplicationEngine* engine, QObject *parent = nullptr);
    SensorData* sensorData;
};

#endif // BACKEND_H
