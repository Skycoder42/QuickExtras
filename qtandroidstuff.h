#ifndef QTANDROIDSTUFF_H
#define QTANDROIDSTUFF_H

#include <QQmlEngine>


namespace QtAndroidStuff
{
void registerQmlSingleton();
void setupEngine(QQmlEngine *engine);

void showToast(const QString &message, bool showLong = false);
void hapticFeedback();
}

#endif // QTANDROIDSTUFF_H
