import QtQuick 2.9 //graphical primitives such as Item, Rectangle, Text, and so on.
import QtQuick.Controls 2.0 // provides access to ApplicationWindow

ApplicationWindow {
    //ApplicationWindow is a Window with some added convenience for creating a header and a footer.
    //It also provides the foundation for popups and supports some basic styling, such as the background color.
    visible: true
    width: 640
    height: 480
    Page {
        anchors.fill: parent
        header: Label {
            //Label extends the primitive Text item from the Qt Quick module by adding styling and font inheritance.
            // This means that a Label can look different depending on which style is in use,
            // and can also propagate its pixel size to its children.
            padding: 10 // allocates extra space on each side of the label, within its bounds.
            text: qsTr("Contacts")
            font.pixelSize: 20
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
        }
    }
}
