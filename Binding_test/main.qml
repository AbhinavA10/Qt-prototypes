import QtQuick 2.9
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 300
    height: 200
    title: qsTr("Window")

    Rectangle{
        width:198
        height:151
        anchors.centerIn: parent
        color:"red"

        Text {
            id: element1
            anchors.horizontalCenter: parent.horizontalCenter
            y: 8
            width: 93
            height: 39
            text: qsTr("Reading")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 30
        }
        Text {
            id: element
            anchors.horizontalCenter: parent.horizontalCenter
            y: 76
            width: 85
            height: 67
            text: sensorData.sensorReading
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
        }

    }
}
