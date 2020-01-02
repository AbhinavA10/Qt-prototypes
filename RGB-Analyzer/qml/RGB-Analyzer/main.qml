import QtQuick 2.4
import QtQuick.Controls 1.2
import QtQuick.Layouts 1.3 // for layouts and alignment
import QtQuick.Dialogs 1.2
import com.abhi.imageanalysis 1.0 // import the C++ class

ApplicationWindow {
    title: qsTr("Histogram")
    width: 800
    height: 480

    Action{ // create an action object to be able to use it in MenuItem and ToolButton
        id: fileOpenAction
        text: "Open"
        onTriggered: fileDialog.open() //console.log(Qt.platform.os)
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
            Slider{ // for bin count in histogram
                id: binCountSlider
                minimumValue: 1
                maximumValue: 8
                value: 6
                tickmarksEnabled: true
                stepSize: 1
            }
        }
    }

    RgbHistogram{
        id:hist
        imageSource: imageView.source
        binCount: Math.pow(2.0, binCountSlider.value)
        onImageSourceChanged: compute() // compute is a slot
        onBinCountChanged: compute()

        /*onHistogramUpdated: {
            histModel.clear()
            for(var i=0; i<binCount; i++){ // for the table view
                var o = {
                    "binNumber": i,
                    "redCount": redCount(i),
                    "greenCount": greenCount(i),
                    "blueCount":blueCount(i)
                }
                histModel.append(o);
            }

            //console.log("Victory!", redCount(0), greenCount(0), blueCount(0)) //redCount is not a slot
            // onHistogramUpdated would be a signal
        }*/
    }
    RgbHistogramModel{
        id:histModel
        histogram: hist
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
                anchors.margins: Qt.platform.os==="windows"?12:2 // put bigger margins if app is running on mac
                Tab{
                    title:"Table" // the two different tabs for the right side
                    anchors.margins: Qt.platform.os==="windows"?12:2 // put bigger margins if app is running on mac
                    TableView{
                        model: histModel
                        TableViewColumn{
                            title:"#"
                            width:45
                            role: "binNumber"
                        }TableViewColumn{
                            title:"Red"
                            width:60
                            role:"redCount"
                        }
                        TableViewColumn{
                            title:"Green"
                            width:60
                            role:"greenCount"
                        }
                        TableViewColumn{
                            title:"Blue"
                            width:60
                            role:"blueCount"
                        }
                    }
                }
                Tab{
                    title:"Histogram"
                    anchors.margins: Qt.platform.os==="windows"?12:2 // put bigger margins if app is running on mac
                    RgbHistogramView{
                        histogramModel: histModel
                    }
                }
            }
        }
    }

}
