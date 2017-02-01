#include "qmlsingleton.h"
#include "qsortfilterproxymodelqmlextension.h"
#include "quickextras.h"
#include "svgimageprovider.h"

#include <QQmlFileSelector>
#include <QFileSelector>
#include <QGuiApplication>
#include <QScreen>
#include <QDebug>
#ifdef Q_OS_ANDROID
#include <QtAndroidExtras>
#endif

static void registerInQml();
static QObject *createQmlSingleton(QQmlEngine *qmlEngine, QJSEngine *jsEngine);

Q_COREAPP_STARTUP_FUNCTION(registerInQml)

void QuickExtras::setupEngine(QQmlEngine *engine)
{
	auto dpi = QGuiApplication::primaryScreen()->devicePixelRatio();
	qDebug() << "Application DPI factor is:" << dpi;
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

void QuickExtras::showToast(const QString &message, bool showLong)
{
#ifdef Q_OS_ANDROID
	QtAndroid::runOnAndroidThread([=](){
		auto context = QtAndroid::androidContext();
		const auto LENGTH_LONG = QAndroidJniObject::getStaticField<jint>("android/widget/Toast", "LENGTH_LONG");
		const auto LENGTH_SHORT = QAndroidJniObject::getStaticField<jint>("android/widget/Toast", "LENGTH_SHORT");
		auto toast = QAndroidJniObject::callStaticObjectMethod("android/widget/Toast",
															   "makeText",
															   "(Landroid/content/Context;Ljava/lang/CharSequence;I)Landroid/widget/Toast;",
															   context.object(),
															   QAndroidJniObject::fromString(message).object(),
															   showLong ? LENGTH_LONG : LENGTH_SHORT);
		toast.callMethod<void>("show");
	});
#else
	Q_UNUSED(showLong)
	qInfo() << message;
#endif
}

void QuickExtras::hapticFeedback()
{
#ifdef Q_OS_ANDROID
	QtAndroid::runOnAndroidThread([=](){
		const auto android_R_id_content = QAndroidJniObject::getStaticField<jint>("android/R$id", "content");
		const auto LONG_PRESS = QAndroidJniObject::getStaticField<jint>("android/view/HapticFeedbackConstants", "LONG_PRESS");
		auto activity = QtAndroid::androidActivity();
		auto view = activity.callObjectMethod("findViewById",
											  "(I)Landroid/view/View;",
											  android_R_id_content);
		view.callMethod<jboolean>("performHapticFeedback",
								  "(I)Z",
								  LONG_PRESS);
	});
#endif
}

static void registerInQml()
{
	qmlRegisterSingletonType<QmlSingleton>("de.skycoder42.quickextras", 1, 0, "QuickExtras", createQmlSingleton);
	qmlRegisterType(QStringLiteral("qrc:/quickextras/qml/TintIcon.qml"), "de.skycoder42.quickextras", 1, 0, "TintIcon");
	qmlRegisterType(QStringLiteral("qrc:/quickextras/qml/AppBarButton.qml"), "de.skycoder42.quickextras", 1, 0, "AppBarButton");
	qmlRegisterType(QStringLiteral("qrc:/quickextras/qml/FloatingActionButton.qml"), "de.skycoder42.quickextras", 1, 0, "FloatingActionButton");
	qmlRegisterType(QStringLiteral("qrc:/quickextras/qml/ActionBar.qml"), "de.skycoder42.quickextras", 1, 0, "ActionBar");
	qmlRegisterType(QStringLiteral("qrc:/quickextras/qml/AlertDialog.qml"), "de.skycoder42.quickextras", 1, 0, "AlertDialog");
	qmlRegisterType(QStringLiteral("qrc:/quickextras/qml/DoubleSpinBox.qml"), "de.skycoder42.quickextras", 1, 0, "DoubleSpinBox");
	qmlRegisterExtendedType<QSortFilterProxyModel, QSortFilterProxyModelQmlExtension>("de.skycoder42.quickextras", 1, 0, "SortFilterProxyModel");
	qmlProtectModule("de.skycoder42.quickextras", 1);
}

static QObject *createQmlSingleton(QQmlEngine *qmlEngine, QJSEngine *jsEngine)
{
	Q_UNUSED(qmlEngine)
	Q_UNUSED(jsEngine)
	return new QmlSingleton();
}
