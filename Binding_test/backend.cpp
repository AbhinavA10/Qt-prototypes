#include "backend.h"
#include <QQmlContext>
Backend::Backend(QQmlApplicationEngine* engine, QObject *parent) :
    QObject(parent)
{
    sensorData = new SensorData();
     QQmlContext* ctxt(engine->rootContext());

     qmlRegisterUncreatableType<SensorData>("io.sensordata  ", 1, 0, "sensor", "BackEnd");

    // Connecting back end object instances to front end
    ctxt->setContextProperty("sensorData", sensorData);
}
