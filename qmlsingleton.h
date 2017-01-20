#ifndef QMLSINGLETON_H
#define QMLSINGLETON_H

#include <QObject>

class QmlSingleton : public QObject
{
	Q_OBJECT
public:
	explicit QmlSingleton(QObject *parent = nullptr);

public slots:
	void showToast(const QString &message, bool showLong = false);
	void hapticFeedback();
};

#endif // QMLSINGLETON_H
