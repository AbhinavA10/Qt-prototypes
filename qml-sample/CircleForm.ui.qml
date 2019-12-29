import QtQuick 2.4

// Custom Qt quick component
Item {
    width: 200
    height: 200
    property alias buttonColor: button.color
    property alias displayText: display.text

    Rectangle {
        id: button
        color: "#9d0909"
        radius: width * 0.5
        anchors.fill: parent

        Text {
            id: display
            x: 88
            y: 87
            color: "#ffffff"
            text: qsTr("Text")
            font.bold: true
            font.family: "Arial"
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            font.pixelSize: 30
        }
    }
}

/*##^##
Designer {
    D{i:1;anchors_height:200;anchors_width:200;anchors_x:57;anchors_y:81}
}
##^##*/

