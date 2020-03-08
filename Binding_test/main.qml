import QtQuick 2.9
import QtQuick.Controls 2.0

ApplicationWindow {
    visible: true
    width: 600
    height: 200
    title: qsTr("Window")

    Rectangle{
        id: readingRect
        x: 280
        y: 20
        width:200
        height:150
        color:"red"

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 93
            height: 39
            text: qsTr("Reading")
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 30
        }
        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            y: 76
            width: 85
            height: 67
            text: "off"
            font.pixelSize: 40
            horizontalAlignment: Text.AlignHCenter
            Binding on text {
                // bind text to sensorData.sensorReading
                value: {
                    // surprised to find this runs, regardless of value of controlRect.activated
                    console.log("new value");
                    sensorData.sensorReading.toFixed(1)
                }
                when: controlRect.activated
            }
        }
    }

    Rectangle{
        id: controlRect
        x: 20
        y: 20
        width:200
        height:150
        property bool activated: true
        color:{
            if (controlRect.activated){
                "green"
            }
            else{
                "yellow"
            }
        }

        MouseArea {
            anchors.fill: parent
            onClicked: {
                console.log("State changed to",!parent.activated);
                parent.activated = !parent.activated
            }
        }

        Text {
            anchors.horizontalCenter: parent.horizontalCenter
            width: 93
            height: 39
            text: {
                if (controlRect.activated){
                    "Deactivate\nbinding"
                }
                else{
                    "Activate\nBinding"
                }
            }
            horizontalAlignment: Text.AlignHCenter
            font.pixelSize: 30
        }
    }
}
