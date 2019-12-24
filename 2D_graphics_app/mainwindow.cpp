#include "mainwindow.h"
#include "ui_mainwindow.h"

MainWindow::MainWindow(QWidget *parent)
    : QMainWindow(parent) // call base class constructor
    , ui(new Ui::MainWindow) // initialize ui pointer
    // Ui::MainWindow is generated automatically based on mainwindow.ui
{
    ui->setupUi(this);
}

MainWindow::~MainWindow()
{
    delete ui;
}

