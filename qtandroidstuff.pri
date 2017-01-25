android: QT *= androidextras
QT *= svg

RESOURCES += \
	$$PWD/qtandroidstuff.qrc

HEADERS += \
	$$PWD/qtandroidstuff.h \
	$$PWD/qmlsingleton.h \
	$$PWD/svgimageprovider.h

SOURCES += \
	$$PWD/qtandroidstuff.cpp \
	$$PWD/qmlsingleton.cpp \
	$$PWD/svgimageprovider.cpp

INCLUDEPATH += $$PWD
