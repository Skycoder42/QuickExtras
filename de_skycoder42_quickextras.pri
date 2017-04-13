android: QT *= androidextras
QT *= quickcontrols2 svg

HEADERS += \
	$$PWD/qmlsingleton.h \
	$$PWD/svgimageprovider.h \
	$$PWD/quickextras.h \
	$$PWD/qsortfilterproxymodelqmlextension.h

SOURCES += \
	$$PWD/qmlsingleton.cpp \
	$$PWD/svgimageprovider.cpp \
	$$PWD/quickextras.cpp \
	$$PWD/qsortfilterproxymodelqmlextension.cpp

RESOURCES += \
	$$PWD/de_skycoder42_quickextras.qrc

INCLUDEPATH += $$PWD
