android: QT *= androidextras

RESOURCES += \
    $$PWD/qtandroidstuff.qrc

HEADERS += \
    $$PWD/qtandroidstuff.h \
    $$PWD/qmlsingleton.h

SOURCES += \
    $$PWD/qtandroidstuff.cpp \
    $$PWD/qmlsingleton.cpp

INCLUDEPATH += $$PWD
