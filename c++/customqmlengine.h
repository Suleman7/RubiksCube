#pragma once

#include <QQmlApplicationEngine>

class CustomQmlEngine : public QQmlApplicationEngine
{
    Q_OBJECT
public:
    explicit CustomQmlEngine(QObject * parent = nullptr);

    Q_INVOKABLE void clearCache();
};
