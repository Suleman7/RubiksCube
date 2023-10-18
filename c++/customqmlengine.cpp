#include "customqmlengine.h"

CustomQmlEngine::CustomQmlEngine(QObject *parent)
    :QQmlApplicationEngine(parent)
{

}

void CustomQmlEngine::clearCache()
{
    this->trimComponentCache();
    this->clearComponentCache();
    this->trimComponentCache();
}
