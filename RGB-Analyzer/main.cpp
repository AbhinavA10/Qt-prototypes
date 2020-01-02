#include "qtquick2controlsapplicationviewer.h"
#include <QtQml>
#include "rgbhistogram.h"
#include "rgbhistogrammodel.h"
//  Starter code github source: https://github.com/drgvond/RGB-Analyzer

int main(int argc, char *argv[])
{
    Application app(argc, argv);

    qmlRegisterType<RgbHistogram>("com.abhi.imageanalysis", 1, 0, "RgbHistogram");
    qmlRegisterType<RgbHistogramModel>("com.abhi.imageanalysis", 1, 0, "RgbHistogramModel");
    QtQuick2ControlsApplicationViewer viewer;
    viewer.setMainQmlFile(QStringLiteral("qml/RGB-Analyzer/main.qml"));
    viewer.show();

    return app.exec();
}
