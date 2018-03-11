﻿#ifndef LOGOWIDGET_H
#define LOGOWIDGET_H

#include <QObject>
#include <QString>
#include <QColor>
#include <QImage>
#include <QRectF>
#include <QWidget>
#include <QOpenGLWidget>
#include <QSize>

class LogoDrawer : public QObject
{
    Q_OBJECT
public:
    explicit LogoDrawer(QObject *parent = nullptr);
    ~LogoDrawer();

    void setLogoUrl(const QString &filename);
    void setLogoBackground(const QColor &color);
    void resizeGL(int w, int h);
    void paintGL(QOpenGLWidget *widget);

signals:
    void logoSize(QSize size);

private:
    void regenerateTexture();

private:
    QRectF logoLocation;
    QImage logo;
    QString logoUrl;
    QColor logoBackground;
};

class LogoWidget : public QOpenGLWidget
{
    Q_OBJECT
public:
    explicit LogoWidget(QWidget *parent = nullptr);
    ~LogoWidget();

    void setLogo(const QString &filename);
    void setLogoBackground(const QColor &color);

protected:
    void initializeGL();
    void paintGL();
    void resizeGL(int w, int h);

private:
    LogoDrawer *logoDrawer = nullptr;
    QString logoUrl;
    QColor logoBackground;
};

#endif // LOGOWIDGET_H
