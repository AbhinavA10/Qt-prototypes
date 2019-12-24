#include "renderarea.h"
#include "qpainter.h"

RenderArea::RenderArea(QWidget *parent) : QWidget(parent),
    mBackgroundColor(0,0,255),
    mShapeColor(255,255,255)
{
}

QSize RenderArea::minimumSizeHint() const {
    return QSize(100,100);
}
QSize RenderArea::sizeHint() const {
    return QSize(400,200);
}
void RenderArea::paintEvent(QPaintEvent *event){
    QPainter painter(this);
    painter.setBrush(mBackgroundColor);
    painter.setRenderHint(QPainter::Antialiasing, true);
    painter.setPen(mShapeColor);
    //drawing area
    painter.drawRect(this->rect());
    painter.drawLine(this->rect().topLeft(), this->rect().bottomRight());

} // need to override this to be able to paint
