import QtQuick 2.12
import QtQuick.Window 2.12

Window {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    Background {
        id: background
        anchors.fill: parent
        target:sender // when keys are pressed, the sender will change size

        Receiver {
            id: receiver
            x: 354
            y: 140
            displayText: "Receiver"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.right
            anchors.rightMargin: 52
            width: sender.width // property binding for receiver's width to match sender's width
        }

        Sender {
            id: sender
            y: 129
            displayText: "Sender"
            buttonColor: "#2062ec"
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 50
            target: receiver
        }
    }
}

/*##^##
Designer {
    D{i:3;anchors_x:50}D{i:1;anchors_x:110;anchors_y:149}
}
##^##*/
