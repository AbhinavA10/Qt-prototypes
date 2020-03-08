#ifndef SENSORDATA_H
#define SENSORDATA_H
#include <QObject>
#include <QTimer>

class CameraInfo : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(double sensorReading MEMBER m_sensorReading NOTIFY sensorReadingChanged)
    Q_PROPERTY(double type MEMBER m_type NOTIFY sensorReadingChanged)
    int m_type =0;
    explicit CameraInfo(QObject *parent = nullptr);
    ~CameraInfo() {}

private:
    double m_sensorReading;
    double temp;
    QTimer m_timer;

signals:
    void sensorReadingChanged();

public slots:
    void slot_updateReading();

};

#endif // SENSORDATA_H
