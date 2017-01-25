#include "qmlsingleton.h"
#include "quickextras.h"
#include <QGuiApplication>
#include <QScreen>

QmlSingleton::QmlSingleton(QObject *parent) :
	QObject(parent)
{}

double QmlSingleton::scaleFactor() const
{
	return QGuiApplication::primaryScreen()->devicePixelRatio();
}

void QmlSingleton::showToast(const QString &message, bool showLong)
{
	QuickExtras::showToast(message, showLong);
}

void QmlSingleton::hapticFeedback()
{
	QuickExtras::hapticFeedback();
}
