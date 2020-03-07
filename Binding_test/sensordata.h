#ifndef SENSORDATA_H
#define SENSORDATA_H
#include <QObject>
#include <QTimer>

class SensorData : public QObject
{
    Q_OBJECT
public:
    Q_PROPERTY(int sensorReading MEMBER m_sensorReading NOTIFY sensorReadingChanged)

    explicit SensorData(QObject *parent = nullptr);
    ~SensorData() {}

private:
    int m_sensorReading;
    QTimer m_timer;

signals:
    void sensorReadingChanged();

public slots:
    void slot_updateReading();

};

#endif // SENSORDATA_H
