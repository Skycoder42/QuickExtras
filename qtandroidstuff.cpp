#include "qtandroidstuff.h"

#include <QQmlFileSelector>
#ifdef Q_OS_ANDROID
#include <QtAndroidExtras>
#endif

double QtAndroidStuff::loadResolution(QQmlEngine *engine)
{
	QQmlFileSelector *selector = QQmlFileSelector::get(engine);
	double dpi = 0.0;
#ifdef Q_OS_ANDROID
	QAndroidJniObject metrics("android/util/DisplayMetrics");
	QAndroidJniObject windowManager = QtAndroid::androidActivity().callObjectMethod("getWindowManager", "()Landroid/view/WindowManager;");
	QAndroidJniObject display = windowManager.callObjectMethod("getDefaultDisplay", "()Landroid/view/Display;");
	display.callMethod<void>("getMetrics", "(Landroid/util/DisplayMetrics;)V", metrics.object());
	dpi = (double) metrics.getField<jfloat>("density");
#else
	dpi = 1.0;//TODO add windows code and move to utils
#endif
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

	return dpi;
}
