QT += core gui widgets svg winextras network
TEMPLATE = app
CONFIG += qt c++11

ROOTDIR = $$PWD/../..

contains(QT_ARCH, x86_64) {
    LIBDIR = $${ROOTDIR}/lib64
    CONFIG(debug, debug|release) {
        TARGET = SPlayer64d
        DESTDIR = $${ROOTDIR}/bin64/Debug
    } else {
        TARGET = SPlayer64
        DESTDIR = $${ROOTDIR}/bin64/Release
    }
} else {
    LIBDIR = $${ROOTDIR}/lib
    CONFIG(debug, debug|release) {
        TARGET = SPlayerd
        DESTDIR = $${ROOTDIR}/bin/Debug
    } else {
        TARGET = SPlayer
        DESTDIR = $${ROOTDIR}/bin/Release
    }
}

LIBS += -lUser32 -lShell32 -lKernel32 \
    -L$${LIBDIR} -llibmpv -lWinSparkle

exists($${ROOTDIR}/ci_version.h) {
    DEFINES += CI
}
include($${ROOTDIR}/version.pri)

QMAKE_TARGET_COMPANY = wangwenx190
QMAKE_TARGET_DESCRIPTION = SPlayer
QMAKE_TARGET_COPYRIGHT = GPLv3
QMAKE_TARGET_PRODUCT = SPlayer
RC_ICONS = resources/splayer.ico

QMAKE_POST_LINK += $$quote(windeployqt \"$${DESTDIR}\\$${TARGET}.exe\"$$escape_expand(\\n\\t))
QMAKE_POST_LINK += $$quote(copy /y \"$${ROOTDIR}\\3rdparty\\youtube-dl.exe\" \"$${DESTDIR}\\youtube-dl.exe\"$$escape_expand(\\n\\t))

contains(QT_ARCH, x86_64) {
    QMAKE_POST_LINK += $$quote(copy /y \"$${ROOTDIR}\\3rdparty\\bin64\\*\" \"$${DESTDIR}\"$$escape_expand(\\n\\t))
} else {
    QMAKE_POST_LINK += $$quote(copy /y \"$${ROOTDIR}\\3rdparty\\bin\\*\" \"$${DESTDIR}\"$$escape_expand(\\n\\t))
}

QMAKE_POST_LINK += $$quote(if exist \"$${DESTDIR}\\translations\" rd /s /q \"$${DESTDIR}\\translations\"$$escape_expand(\\n\\t))
QMAKE_POST_LINK += $$quote(md \"$${DESTDIR}\\translations\"$$escape_expand(\\n\\t))
QMAKE_POST_LINK += $$quote(copy /y \"$${PWD}\\translations\\*.qm\" \"$${DESTDIR}\\translations\"$$escape_expand(\\n\\t))

CONFIG(release, debug|release) {
    QMAKE_POST_LINK += $$quote(copy /y \"$${ROOTDIR}\\doc\\ReadMe.txt.deploy\" \"$${DESTDIR}\\ReadMe.txt\"$$escape_expand(\\n\\t))
    QMAKE_POST_LINK += $$quote(copy /y \"$${ROOTDIR}\\doc\\Changelog.txt.deploy\" \"$${DESTDIR}\\Changelog.txt\"$$escape_expand(\\n\\t))
    QMAKE_POST_LINK += $$quote(copy /y \"$${ROOTDIR}\\doc\\License.txt.deploy\" \"$${DESTDIR}\\License.txt\"$$escape_expand(\\n\\t))
    QMAKE_POST_LINK += $$quote(copy /y \"$${ROOTDIR}\\doc\\Contributors.txt.deploy\" \"$${DESTDIR}\\Contributors.txt\"$$escape_expand(\\n\\t))
    QMAKE_POST_LINK += $$quote(if exist \"$${DESTDIR}\\licenses\" rd /s /q \"$${DESTDIR}\\licenses\"$$escape_expand(\\n\\t))
    QMAKE_POST_LINK += $$quote(xcopy /e /i /r /y \"$${ROOTDIR}\\doc\\licenses\" \"$${DESTDIR}\\licenses\"$$escape_expand(\\n\\t))
}

#QMAKE_CXXFLAGS_RELEASE = $$QMAKE_CFLAGS_RELEASE_WITH_DEBUGINFO
#QMAKE_LFLAGS_RELEASE = $$QMAKE_LFLAGS_RELEASE_WITH_DEBUGINFO

# The following define makes your compiler emit warnings if you use
# any feature of Qt which as been marked as deprecated (the exact warnings
# depend on your compiler). Please consult the documentation of the
# deprecated API in order to know how to port your code away from it.
DEFINES += QT_DEPRECATED_WARNINGS

# You can also make your code fail to compile if you use deprecated APIs.
# In order to do so, uncomment the following line.
# You can also select to disable deprecated APIs only up to a certain version of Qt.
#DEFINES += QT_DISABLE_DEPRECATED_BEFORE=0x060000    # disables all the APIs deprecated before Qt 6.0.0

INCLUDEPATH += $${ROOTDIR}/include
DEPENDPATH += $${ROOTDIR}/include

RESOURCES += resources.qrc

TRANSLATIONS += translations/splayer_zh_CN.ts

HEADERS += \
    bakaengine.h \
    mpvhandler.h \
    mpvtypes.h \
    overlayhandler.h \
    overlay.h \
    util.h \
    widgets/customlabel.h \
    widgets/customlineedit.h \
    widgets/customslider.h \
    widgets/customsplitter.h \
    widgets/dimdialog.h \
    widgets/indexbutton.h \
    widgets/openbutton.h \
    widgets/playlistwidget.h \
    widgets/seekbar.h \
    widgets/logowidget.h \
    ui/aboutdialog.h \
    ui/inputdialog.h \
    ui/jumpdialog.h \
    ui/locationdialog.h \
    ui/mainwindow.h \
    ui/preferencesdialog.h \
    ui/screenshotdialog.h \
    ui/keydialog.h \
    recent.h \
    fileassoc.h \
    widgets/sprogressindicatorbar.h \
    qtlocalpeer.h \
    qtsingleapplication.h \
    qtlockedfile.h

SOURCES += \
    main.cpp \
    bakaengine.cpp \
    bakacommands.cpp \
    mpvhandler.cpp \
    overlayhandler.cpp \
    util.cpp \
    widgets/customlabel.cpp \
    widgets/customlineedit.cpp \
    widgets/customslider.cpp \
    widgets/customsplitter.cpp \
    widgets/dimdialog.cpp \
    widgets/indexbutton.cpp \
    widgets/openbutton.cpp \
    widgets/playlistwidget.cpp \
    widgets/seekbar.cpp \
    widgets/logowidget.cpp \
    ui/aboutdialog.cpp \
    ui/inputdialog.cpp \
    ui/jumpdialog.cpp \
    ui/locationdialog.cpp \
    ui/mainwindow.cpp \
    ui/preferencesdialog.cpp \
    ui/screenshotdialog.cpp \
    ui/keydialog.cpp \
    overlay.cpp \
    configmanager.cpp \
    fileassoc.cpp \
    widgets/sprogressindicatorbar.cpp \
    qtlocalpeer.cpp \
    qtsingleapplication.cpp \
    qtlockedfile_win.cpp \
    qtlockedfile.cpp

FORMS += \
    ui/aboutdialog.ui \
    ui/inputdialog.ui \
    ui/jumpdialog.ui \
    ui/locationdialog.ui \
    ui/mainwindow.ui \
    ui/preferencesdialog.ui \
    ui/screenshotdialog.ui \
    ui/keydialog.ui
