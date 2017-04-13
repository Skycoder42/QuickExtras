#ifndef QTANDROIDSTUFF_H
#define QTANDROIDSTUFF_H

#include <QQmlEngine>

namespace QuickExtras
{
void setupEngine(QQmlEngine *engine);

//Android specific
void setStatusBarColor(const QColor &color);
void showToast(const QString &message, bool showLong = false);
void hapticFeedback();
}

#endif // QTANDROIDSTUFF_H
