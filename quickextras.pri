android: QT *= androidextras
QT *= svg

RESOURCES += \
    $$PWD/quickextras.qrc

HEADERS += \
	$$PWD/qmlsingleton.h \
	$$PWD/svgimageprovider.h \
    $$PWD/quickextras.h

SOURCES += \
	$$PWD/qmlsingleton.cpp \
	$$PWD/svgimageprovider.cpp \
    $$PWD/quickextras.cpp

INCLUDEPATH += $$PWD
