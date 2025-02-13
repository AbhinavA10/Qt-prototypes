#ifndef MAINWINDOW_H
#define MAINWINDOW_H

#include <QMainWindow>

QT_BEGIN_NAMESPACE
namespace Ui { class MainWindow; }
QT_END_NAMESPACE

class MainWindow : public QMainWindow
{
    Q_OBJECT

public:
    MainWindow(QWidget *parent = nullptr);
    ~MainWindow();

private slots:
    void on_btnAstroid_clicked();

    void on_btnCycloid_clicked();

    void on_btnHuygens_clicked();

    void on_btnHypo_clicked();

    void on_spinScale_valueChanged(double arg1);
    void on_spinInterval_valueChanged(double arg1);

    void on_spinCount_valueChanged(int arg1);

private:
    Ui::MainWindow *ui; // will use this pointer to access the ui elements from the code we write.
    void update_ui();
};
#endif // MAINWINDOW_H
