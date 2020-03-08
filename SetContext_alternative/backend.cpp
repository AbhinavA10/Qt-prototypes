#include "backend.h"
#include <QQmlContext>

enum Model {
    // types of cameras.
    DSLR=0,
    MOBILE_CAMERA,
    POINT_AND_SHOOT
};

Backend::Backend(QQmlApplicationEngine* engine, QObject *parent) :
    QObject(parent)
{
    // Connecting back end object instances to front end
    QQmlContext* ctxt(engine->rootContext());
    ctxt->setContextProperty("camInfo", deviceInfo);
    ctxt->setContextProperty("videoFeedData", videoFeedData); //video.h

    switch(deviceInfo->m_type){
        case DSLR:
            ctxt->setContextProperty("battery0Data", battery0Data); // battery.h
            ctxt->setContextProperty("battery1Data", battery1Data); // battery.h
            ctxt->setContextProperty("battery2Data", battery2Data); // battery.h
            ctxt->setContextProperty("apertureData", apertureData); // aperture.h
            ctxt->setContextProperty("sensor1Data", sensor1Data); // sensor.h
            ctxt->setContextProperty("sensor2Data", sensor2Data); // sensor.h
            ctxt->setContextProperty("sensor3Data", sensor3Data); // sensor.h
            break;
        case MOBILE_CAMERA:
            ctxt->setContextProperty("sensor0Data", sensor0Data); // sensor.h
            ctxt->setContextProperty("batteryData", batteryData); // battery.h
            break;
        case POINT_AND_SHOOT:
            ctxt->setContextProperty("microphoneData", microphoneData);
            ctxt->setContextProperty("sensor0Data", sensor0Data); // sensor.h
            ctxt->setContextProperty("batteryData", batteryData); // battery.h
            break;
    }
}
