import QtQuick 2.4
import com.abhi.imageanalysis 1.0

Rectangle {
    id: histView
    property RgbHistogramModel histogramModel
    readonly property RgbHistogram histogram: histogramModel.histogram
    // after switching to model, histogram has dissapeared

    width: 100
    height: 62
    color: "white"
    border.color: "lightgrey"

    Row {
        Repeater {
            model: histogramModel
            Item {
                width: histView.width / histogram.binCount
                height: histView.height
                opacity: 0.5
                Rectangle { // a verical rectangle for each channel
                    width: parent.width
                    height: redCount / histogram.maxValue * histView.height
                    y: parent.height - height
                    color: "red"
                }
                Rectangle {
                    width: histView.width / histogram.binCount
                    height: greenCount / histogram.maxValue * histView.height
                    y: parent.height - height
                    color: "green"
                }
                Rectangle {
                    width: histView.width / histogram.binCount
                    height: blueCount/ histogram.maxValue * histView.height
                    y: parent.height - height
                    color: "blue"
                }
            }
        }
    }
}
