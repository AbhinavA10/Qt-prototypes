import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3 // for layouts and alignment
import QtQuick.Dialogs 1.2

ApplicationWindow {
    title: qsTr("Histogram")
    width: 800
    height: 480

    Action{ // create an action object to be able to use it in MenuItem and ToolButton
        id: fileOpenAction
        text: "Open"
        onTriggered: fileDialog.open()
        iconSource: "qrc:/document-open.png" // load from our own resource images

    }

    FileDialog{
        id: fileDialog
        folder:shortcuts.home
        onAccepted: imageView.source = fileUrl
    }

    menuBar: MenuBar {
        Menu {
            title: qsTr("File")
            MenuItem{
                action: fileOpenAction
            }

            MenuItem {
                text: qsTr("Exit")
                onTriggered: Qt.quit();
            }
        }
    }

    toolBar: ToolBar{ // application windows have a 'toolBar' field that we can populate
        RowLayout{ // ading a row layout will align the below elements side by side
            ToolButton{
                action: fileOpenAction
            }
            Slider{
                minimumValue: 1
                maximumValue: 6
                value: 6
                tickmarksEnabled: true
                stepSize: 1
            }
        }
    }

    SplitView{
        anchors.fill: parent
        Image{
            id: imageView
            Layout.minimumWidth: 200
            fillMode: Image.PreserveAspectFit
        }
        Item{ // wrap the tab view in an item
            Layout.minimumWidth: 200
            TabView{
                anchors.fill:parent
                anchors.margins: Qt.platform.os==="osx"?12:2 // put bigger margins if app is running on mac
                Tab{
                    title:"Table" // the two different tabs for the right side
                }
                Tab{
                    title:"Histogram"
                }
            }
        }
    }

}
