#include "qmlsingleton.h"
#include "qtandroidstuff.h"

QmlSingleton::QmlSingleton(QObject *parent) :
	QObject(parent)
{}

void QmlSingleton::showToast(const QString &message, bool showLong)
{
	QtAndroidStuff::showToast(message, showLong);
}

void QmlSingleton::hapticFeedback()
{
	QtAndroidStuff::hapticFeedback();
}
