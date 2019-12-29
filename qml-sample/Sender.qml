import QtQuick 2.0

Circle {
    id: sendButton
    property int counter: 0
    property Receiver target: null // the component we will send the signal to

    signal send(string value)
    onTargetChanged: send.connect(target.receive)
    MouseArea{ // make the sender clickable
        anchors.fill: parent
        onClicked: {
            counter++
            parent.send(counter)
        }

        onPressed: parent.buttonColor="green" // visual feedback when pressing the button
        onReleased: parent.buttonColor="blue" // visual feedback when pressing the button
    }
}
