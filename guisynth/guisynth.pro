#------------------------
#
# Sonivox EAS Synthesizer
#
#------------------------

include(../global.pri)

QT += core gui

greaterThan(QT_MAJOR_VERSION, 4): QT += widgets

TARGET = guisynth
TEMPLATE = app

SOURCES += main.cpp\
           mainwindow.cpp 

HEADERS  += mainwindow.h 

FORMS    += mainwindow.ui

RESOURCES += guisynth.qrc

DEPENDPATH += ../libsvoxeas
INCLUDEPATH += ../libsvoxeas \
               ../sonivox/host_src

QMAKE_LFLAGS += -L../libsvoxeas
LIBS += -lsvoxeas

QMAKE_RPATHDIR = $$OUT_PWD/../libsvoxeas

_DRUMSTICKLIBS=$$(DRUMSTICKLIBS)
isEmpty( _DRUMSTICKLIBS ) {
    CONFIG += link_pkgconfig
    PKGCONFIG += drumstick-alsa
} else {
    INCLUDEPATH += $$(DRUMSTICKINCLUDES)
    LIBS += -L$$(DRUMSTICKLIBS) -ldrumstick-alsa
}
