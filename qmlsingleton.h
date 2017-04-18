#ifndef QMLSINGLETON_H
#define QMLSINGLETON_H

#include <QObject>
#include <functional>

class QmlSingleton : public QObject
{
	Q_OBJECT

	Q_PROPERTY(double scaleFactor READ scaleFactor CONSTANT)
	Q_PROPERTY(QString currentStyle READ currentStyle CONSTANT)

public:
	static std::function<void()> hapticFeedbackProvider;

	explicit QmlSingleton(QObject *parent = nullptr);

	double scaleFactor() const;
	QString currentStyle() const;

public slots:
	void hapticLongPress();
};

#endif // QMLSINGLETON_H
