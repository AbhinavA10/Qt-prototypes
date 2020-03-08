#ifndef SENSORDATA_H
#define SENSORDATA_H
#include <QObject>
#include <QTimer>

class SensorData : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(double sensorReading MEMBER m_sensorReading NOTIFY sensorReadingChanged)

    explicit SensorData(QObject *parent = nullptr);
    ~SensorData() {}

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
