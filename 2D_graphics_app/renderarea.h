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
        HypoCycloid,
        FutureCurve
    };

    void setBackgroundColor(QColor color){mBackgroundColor=color;}
    QColor getBackgroundColor() const {return mBackgroundColor;}

    void setShape(ShapeType shape){mShape=shape; on_shape_changed();}
    ShapeType getShape() const {return mShape;}

    void setShapeColor(QColor color){mShapeColor=color;}
    QColor getShapeColor() const {return mShapeColor;}


    void setScale(float scale){mScale = scale; repaint();}
    float getScale() const {return mScale;}
    void setInterval(float interval){mIntervalLength = interval; repaint();}
    float getInterval() const {return mIntervalLength;}
    void setStepCount(int setStepCount){mStepCount  = setStepCount; repaint();}
    int getStepCount() const {return mStepCount;}

protected:
    void paintEvent(QPaintEvent *event) Q_DECL_OVERRIDE; // need to override this to be able to paint

signals:

private:
    QPointF compute(float t);
    QPointF compute_astroid(float t);
    QPointF compute_cycloid(float t);
    QPointF compute_huygens(float t);
    QPointF compute_hypo(float t);
    QPointF compute_future_curve(float t);
    void on_shape_changed();

private:
    QColor mBackgroundColor; // storing color here so we can change it outside
    QColor mShapeColor;
    ShapeType mShape;
    float mIntervalLength;
    float mScale;
    int mStepCount;

};

#endif // RENDERAREA_H
