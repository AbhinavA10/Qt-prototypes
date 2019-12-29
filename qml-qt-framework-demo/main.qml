import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3
import QtQuick.Dialogs 1.2

// follow along for https://www.youtube.com/watch?v=MwmlNflt8G0
ApplicationWindow {
    visible: true
    width: 500
    height: 600
    title: qsTr("Hello Qt")

    // open a file using JSk
    function openFile(fileURL){
        var request = new XMLHttpRequest()
        request.open("GET", fileURL, false)
        request.send(null)
        return request.responseText
    }
    header:ToolBar{
        RowLayout{
            anchors.fill:parent
            ToolButton{
                text: "Open"
                onClicked: fileDialog.open()
            }
        }
    }
    FileDialog{ // a windows file dialog
        id:fileDialog
        title: "Please choose a file"
        folder: shortcuts.home // default folder
        onAccepted: textEdit.text = openFile(fileDialog.fileUrl)
    }
    TextArea{
        id:textEdit
        anchors.fill: parent
    }
}
