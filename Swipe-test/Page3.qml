import QtQuick 2.12
import QtQuick.Dialogs 1.2

Page3Form {
    comboBox.model: ['Dog', 'Cat','Fish','Bird']
    button.onClicked: {
        var order = "Ordering "+textField.text+"\r\n"
        order+= "Your "+Math.round(dial.value)+" year old "+comboBox.currentText
        messageDialog.text=order
        messageDialog.open()
    }
    dial.onValueChanged: {
        progressBar.value = dial.value;
        label1.text = Math.round(dial.value)+ "Years Old"
    }

    MessageDialog{
        id: messageDialog
        title: "Hello message"
        text: "nice"
        onAccepted: Qt.quit()
    }
}
