android: QT *= androidextras
QT *= svg

RESOURCES += \
    $$PWD/quickextras.qrc

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

INCLUDEPATH += $$PWD
