#include "qmlsingleton.h"
#include "qsortfilterproxymodelqmlextension.h"
#include "quickextras.h"
#include "svgimageprovider.h"

#include <QQmlFileSelector>
#include <QFileSelector>
#include <QGuiApplication>
#include <QScreen>

static void registerInQml();
static QObject *createQmlSingleton(QQmlEngine *qmlEngine, QJSEngine *jsEngine);

Q_COREAPP_STARTUP_FUNCTION(registerInQml)

void QuickExtras::setupEngine(QQmlEngine *engine)
{
	auto dpi = QGuiApplication::primaryScreen()->devicePixelRatio();
	QQmlFileSelector *selector = QQmlFileSelector::get(engine);
	if(dpi >= 4.0)
		selector->setExtraSelectors({"xxxhdpi"});
	else if(dpi >= 3.0)
		selector->setExtraSelectors({"xxhdpi"});
	else if(dpi >= 2.0)
		selector->setExtraSelectors({"xhdpi"});
	else if(dpi >= 1.5)
		selector->setExtraSelectors({"hdpi"});
	else if(dpi >= 1.0)
		selector->setExtraSelectors({"mdpi"});
	else
		selector->setExtraSelectors({"ldpi"});

	engine->addImageProvider(QStringLiteral("svg"), new SvgImageProvider());
}

static void registerInQml()
{
	qmlRegisterSingletonType<QmlSingleton>("de.skycoder42.quickextras", 2, 0, "QuickExtras", createQmlSingleton);
	qmlRegisterExtendedType<QSortFilterProxyModel, QSortFilterProxyModelQmlExtension>("de.skycoder42.quickextras", 2, 0, "SortFilterProxyModel");
	//qmlProtectModule("de.skycoder42.quickextras", 2);
}

static QObject *createQmlSingleton(QQmlEngine *qmlEngine, QJSEngine *jsEngine)
{
	Q_UNUSED(qmlEngine)
	Q_UNUSED(jsEngine)
	return new QmlSingleton();
}

void QuickExtras::setHapticFeedbackProvider(const std::function<void ()> &triggerFeedback)
{
	QmlSingleton::hapticFeedbackProvider = triggerFeedback;
}
