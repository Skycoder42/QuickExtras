#ifndef QTANDROIDSTUFF_H
#define QTANDROIDSTUFF_H

#include <QQmlEngine>
#include <functional>

namespace QuickExtras
{
void setupEngine(QQmlEngine *engine);

void setHapticFeedbackProvider(const std::function<void()> &triggerFeedback);
}

#endif // QTANDROIDSTUFF_H
