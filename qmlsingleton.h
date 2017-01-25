#ifndef QMLSINGLETON_H
#define QMLSINGLETON_H

#include <QObject>

class QmlSingleton : public QObject
{
	Q_OBJECT

	Q_PROPERTY(double scaleFactor READ scaleFactor CONSTANT)

public:
	explicit QmlSingleton(QObject *parent = nullptr);

	double scaleFactor() const;

public slots:
	void showToast(const QString &message, bool showLong = false);
	void hapticFeedback();
};

#endif // QMLSINGLETON_H
