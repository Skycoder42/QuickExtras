#ifndef SVGIMAGEPROVIDER_H
#define SVGIMAGEPROVIDER_H

#include <QQuickImageProvider>

class SvgImageProvider : public QQuickImageProvider
{
public:
	explicit SvgImageProvider();

	QImage requestImage(const QString &id, QSize *size, const QSize &requestedSize) override;
};

#endif // SVGIMAGEPROVIDER_H
