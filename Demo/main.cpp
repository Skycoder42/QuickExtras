#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <quickextras.h>

int main(int argc, char *argv[])
{
	QCoreApplication::setAttribute(Qt::AA_EnableHighDpiScaling);
	QGuiApplication app(argc, argv);

	QuickExtras::setHapticFeedbackProvider([](){
		qDebug("~~RUMBLE~~");
	});

	QQmlApplicationEngine engine;
	QuickExtras::setupEngine(&engine);
	engine.load(QUrl(QLatin1String("qrc:/main.qml")));

	return app.exec();
}
