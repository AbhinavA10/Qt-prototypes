import QtQuick 2.12
import QtQuick.Controls 2.5

Page {
    width: 600
    height: 400
    property alias label1: label1
    property alias progressBar: progressBar
    property alias dial: dial
    property alias button: button
    property alias comboBox: comboBox
    property alias textField: textField

    header: Label {
        text: qsTr("Page 3")
        font.pixelSize: Qt.application.font.pixelSize * 2
        padding: 10
    }

    Row {
        id: row
        spacing: 25
        anchors.fill: parent

        Column {
            id: column
            width: 200
            height: row.height
            spacing: 25

            Label {
                id: label
                text: qsTr("Enter a name")
            }
            TextField {
                id: textField
                text: qsTr("Text Field")
            }
            ComboBox {
                id: comboBox
            }

            Button {
                id: button
                text: qsTr("Order")
            }
        }

        Column {
            id: column1
            width: 200
            height: row.height
            spacing: 10

            Dial {
                id: dial
                to: 20
                from: 1
                value: 1
            }

            ProgressBar {
                id: progressBar
                to: 20
                from: 1
                value: 1
            }

            Label {
                id: label1
                text: qsTr("1 Year Old")
            }
        }
    }
}

/*##^##
Designer {
    D{i:2;anchors_height:400;anchors_width:200;anchors_x:88;anchors_y:6}
}
##^##*/

