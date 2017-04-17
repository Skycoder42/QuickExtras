#include "qmlsingleton.h"
#include <QGuiApplication>
#include <QScreen>
#include <QQuickStyle>

QmlSingleton::QmlSingleton(QObject *parent) :
	QObject(parent)
{}

double QmlSingleton::scaleFactor() const
{
	return QGuiApplication::primaryScreen()->devicePixelRatio();
}

QString QmlSingleton::currentStyle() const
{
	return QQuickStyle::name();
}
