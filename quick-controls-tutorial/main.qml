import QtQuick 2.12
import QtQuick.Window 2.12
import QtQuick.Controls 2.5 // imported controls module
import QtQuick.Layouts 1.3 // imported

ApplicationWindow { // changed from Window to ApplicationWindow
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    //Action is a reusable component that can be used in the menu and ToolBar
    Action{
        id: actionNew
        text: qsTr("&New")
        shortcut:  StandardKey.New // the key combo that would activate this action
        icon.name: "document-new" // name of the icon to use, loaded from the OS theme
        onTriggered: area.placeholderText = "To do - save" // placeholder to show something happening when this action occurs
    }

    Action{
        id: actionOpen
        text: qsTr("&Open")
        shortcut:  StandardKey.Open
        icon.name: "document-open"
        onTriggered: area.placeholderText = "To do - open"
    }
    Action{
        id: actionSave
        text: qsTr("&Save")
        shortcut:  StandardKey.Save
        icon.name: "document-save"
        onTriggered: area.placeholderText = "To do - save"
    }



    menuBar: MenuBar{ // added a menubar
        Menu{
            title: "File"
            // Menu items
            MenuItem {action: actionNew}
            MenuItem {action: actionOpen}
            MenuItem {action: actionSave}
        }
    }
    header: ToolBar{ // adding a toolbar
        RowLayout{
            ToolButton {action: actionNew}
            ToolButton {action: actionOpen}
            ToolButton {action: actionSave}
        }
    }
    TextArea{
        id: area
        anchors.fill: parent
    }
}
