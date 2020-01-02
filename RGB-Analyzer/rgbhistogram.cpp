#include "rgbhistogram.h"
#include "rgbhistogrammodel.h"
#include <QImage>
#include <QClipboard>
#include <QGuiApplication>
#include<QDebug>

RgbHistogram::RgbHistogram(QObject *parent) :
    QObject(parent), m_binCount(1), m_maxValue(1)
{ }

void RgbHistogram::compute()
{
    QImage img(m_imageSource.toLocalFile());
    if (img.isNull())
        return;

    m_bins.clear();
    m_bins.resize(m_binCount);
    // when changing bincount in histogram viewing mode, app crashes in below aray lines

    for (int i = 0; i < img.height(); ++i) {
        const QRgb *pixels = reinterpret_cast<const QRgb *>(img.constScanLine(i));
        for (int j = 0; j < img.width(); ++j) {
            if (binForValue(qRed(*pixels))>=m_bins.size()){
                qInfo("RedBin: %d", binForValue(qRed(*pixels)));
                qInfo("Bins: %d", m_bins.size());
            }
            if (binForValue(qGreen(*pixels))>=m_bins.size()){
                qInfo("GreenBin: %d", binForValue(qGreen(*pixels)));
                qInfo("Bins: %d", m_bins.size());
            }if (binForValue(qBlue(*pixels))>=m_bins.size()){
                qInfo("BlueBin: %d", binForValue(qBlue(*pixels)));
                qInfo("Bins: %d", m_bins.size());
            }
            m_bins[binForValue(qRed(*pixels))].red++;
            m_bins[binForValue(qGreen(*pixels))].green++;
            m_bins[binForValue(qBlue(*pixels))].blue++;
            ++pixels;
        }
    }

    m_maxValue = 0;
    foreach (const RgbBin &bin, m_bins) {
        if (bin.red > m_maxValue)
            m_maxValue = bin.red;
        if (bin.green > m_maxValue)
            m_maxValue = bin.green;
        if (bin.blue > m_maxValue)
            m_maxValue = bin.blue;
    }
    emit maxValueChanged(m_maxValue);

    emit histogramUpdated();
}

int RgbHistogram::redCount(int bin) const
{
    return m_bins[bin].red;
}

int RgbHistogram::greenCount(int bin) const
{
    return m_bins[bin].green;
}

int RgbHistogram::blueCount(int bin) const
{
    return m_bins[bin].blue;
}
