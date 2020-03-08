#ifndef BACKEND_H
#define BACKEND_H
#include "camerainfo.h"
#include <QObject>
#include <QQmlApplicationEngine>

class Backend: public QObject
{
    Q_OBJECT
public:
    Backend(QQmlApplicationEngine* engine, QObject *parent = nullptr);
    CameraInfo* sensor0Data = new CameraInfo();
    CameraInfo* sensor1Data = new CameraInfo();
    CameraInfo* sensor2Data = new CameraInfo();
    CameraInfo* sensor3Data = new CameraInfo();
    CameraInfo* deviceInfo = new CameraInfo();
    CameraInfo* batteryData = new CameraInfo();
    CameraInfo* battery0Data = new CameraInfo();
    CameraInfo* battery1Data = new CameraInfo();
    CameraInfo* battery2Data = new CameraInfo();
    CameraInfo* microphoneData = new CameraInfo();
    CameraInfo* videoFeedData = new CameraInfo();
    CameraInfo* apertureData = new CameraInfo();
};

#endif // BACKEND_H
