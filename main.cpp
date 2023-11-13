#include <QGuiApplication>
#include <QQmlApplicationEngine>
#include <QQmlContext>

#include "c++/customqmlengine.h"
#include "c++/clickableentity.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);

    CustomQmlEngine engine;
    engine.rootContext()->setContextProperty("_qmlEngine", &engine);
    qmlRegisterType<ClickableEntity>("CustomEntities", 1, 0, "ClickableEntity");

    const QUrl url(u"qrc:/Rubik/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
