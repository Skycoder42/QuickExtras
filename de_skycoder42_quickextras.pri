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
	
QPM_TRANSLATIONS += $$PWD/quickextras_de.ts \
	$$PWD/quickextras_template.ts

INCLUDEPATH += $$PWD
