#ifndef RENDERAREA_H
#define RENDERAREA_H

#include <QWidget>
#include <QPaintEvent>
#include <QColor>

class RenderArea : public QWidget
{
    Q_OBJECT

public:
    explicit RenderArea(QWidget *parent = nullptr);
    QSize minimumSizeHint() const Q_DECL_OVERRIDE;
    QSize sizeHint() const Q_DECL_OVERRIDE;

    enum ShapeType{ // enum for different shapes, to change drawing logic
        Astroid,
        Cycloid,
        HuygensCycloid,
        HypoCycloid
    };

    void setBackgroundColor(QColor color){mBackgroundColor=color;}
    QColor getBackgroundColor() const {return mBackgroundColor;}

    void setShape(ShapeType shape){mShape=shape;}
    ShapeType getShape() const {return mShape;}

    void setShapeColor(QColor color){mShapeColor=color;}
    QColor getShapeColor() const {return mShapeColor;}

protected:
    void paintEvent(QPaintEvent *event) Q_DECL_OVERRIDE; // need to override this to be able to paint

signals:

private:
    QColor mBackgroundColor; // storing color here so we can change it outside
    QColor mShapeColor;
    ShapeType mShape;
};

#endif // RENDERAREA_H
