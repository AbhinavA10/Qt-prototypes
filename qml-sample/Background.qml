import QtQuick 2.4

BackgroundForm {
    property Circle target: null
    focus: true // to use keyboard inputs on this
    Keys.onPressed: {
        // javascript code
        if (event.key == Qt.Key_Plus) target.width = target.width +10
        if (event.key == Qt.Key_Minus) target.width = target.width -10
    }
}
