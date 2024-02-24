
#include <Qt3DQuickExtras/qt3dquickwindow.h>
#include <Qt3DQuick/QQmlAspectEngine>
#include <QGuiApplication>
#include <QQmlEngine>
#include <QQmlContext>
#include <QQmlApplicationEngine>

#include "c++/customqmlengine.h"
#include "c++/clickableentity.h"
#include "c++/cubecreator.h"

int main(int argc, char *argv[])
{
    QGuiApplication app(argc, argv);
    //Qt3DExtras::Quick::Qt3DQuickWindow view;


    CustomQmlEngine engine;
    engine.rootContext()->setContextProperty("_qmlEngine", &engine);
    qmlRegisterType<ClickableEntity>("CustomEntities", 1, 0, "ClickableEntity");
    qmlRegisterType<CubeCreator>("CubeCreator", 1, 0, "CubeCreator");

    const QUrl url(u"qrc:/Rubik/Main.qml"_qs);
    QObject::connect(&engine, &QQmlApplicationEngine::objectCreationFailed,
        &app, []() { QCoreApplication::exit(-1); },
        Qt::QueuedConnection);
    engine.load(url);

    return app.exec();
}
