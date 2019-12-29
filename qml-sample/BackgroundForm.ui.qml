import QtQuick 2.4

Item {
    width: 400
    height: 400

    Rectangle {
        id: rectangle
        gradient: Gradient {
            GradientStop {
                position: 0
                color: "#a1c4fd"
            }

            GradientStop {
                position: 1
                color: "#c2e9fb"
            }
        }
        anchors.fill: parent
    }
}

/*##^##
Designer {
    D{i:1;anchors_height:200;anchors_width:200;anchors_x:34;anchors_y:111}
}
##^##*/
