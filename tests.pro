isEmpty(CXXTEST_PATH) : error("Pass CXXTEST_PATH on command line")

TESTS = *test.h

HEADERS += $$TESTS \
    rectanglevaluetrait.h \
    qstringvaluetrait.h \
    qvariantvaluetrait.h \
    utilities.h \
    programversionvaluetrait.h


CONFIG += c++14

INCLUDEPATH += $$CXXTEST_PATH \
    ../libmolsketch \
    ../molsketch

SOURCES += ../molsketch/programversion.cpp \
    programversionvaluetrait.cpp

QT += widgets printsupport svg testlib

TEMPLATE = app

TARGET = msktests

cxxtest.output = ${QMAKE_FILE_BASE}.cpp
cxxtest.commands = $$CXXTEST_PATH/bin/cxxtestgen --xunit-printer --part ${QMAKE_FILE_NAME} -o ${QMAKE_FILE_OUT}
cxxtest.depency_type = TYPE_C
cxxtest.input = TESTS
cxxtest.variable_out = SOURCES
QMAKE_EXTRA_COMPILERS += cxxtest

changelogSyntax.target = changelogsuccess
changelogSyntax.commands = xmllint --noout $$PWD/../CHANGELOG && touch $$changelogSyntax.target
changelogSyntax.depends = $$PWD/../CHANGELOG
QMAKE_EXTRA_TARGETS += changelogSyntax
POST_TARGETDEPS += $$changelogSyntax.target

cxxrunner.target = cxxrunner.cpp
cxxrunner.commands = $$CXXTEST_PATH/bin/cxxtestgen --have-eh --xunit-printer --root -o cxxrunner.cpp --template $$PWD/runnerTemplate.tpl
cxxrunner.depends = $$PWD/runnerTemplate.tpl
#cxxrunner.output = cxxrunner.cpp
#cxxrunner.variable_out = SOURCES
QMAKE_EXTRA_TARGETS += cxxrunner
SOURCES += $$OUT_PWD/cxxrunner.cpp \
    rectanglevaluetrait.cpp \
    qstringvaluetrait.cpp \
    qvariantvaluetrait.cpp \
    utilities.cpp \
    mocks.cpp

LIBS += -L../lib -lmolsketch-qt5

OTHER_FILES += \
    runnerTemplate.tpl \
    legacy/Carbon-0.2.msk \
    legacy/Carbon-0.2.svg

legacy_files.commands = ${COPY_DIR} $$_PRO_FILE_PWD_/legacy ./legacy
QMAKE_EXTRA_TARGETS += legacy_files
PRE_TARGETDEPS += legacy_files
