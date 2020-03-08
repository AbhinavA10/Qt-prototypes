import QtQuick 2.9
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 600
    height: 200
    title: qsTr("Window")

    Text {
        y: 50
        x: 50
        text: {
            switch(camInfo.type){
            case 0: // DSLR
                apertureData.sensorReading
                break
            case 1: //MOBILE
                sensor0Data.sensorReading
                break
            case 2: //PointandShoot
                sensor0Data.sensorReading
            }
        }
    }

    Text {
        visible: camInfo.type==2 // Point and Shoot
        y: 90
        x: 90
        text: {
            switch(camInfo.type){
            case 0: // DSLR
            case 1: //MOBILE
                "N/A"
                break
            case 2: //PointandShoot
                microphoneData.sensorReading
            }
        }
    }
}
