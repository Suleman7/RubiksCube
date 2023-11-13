#ifndef MYTESTCLASS_H
#define MYTESTCLASS_H

#include <QObject>

class MyTestClass : public QObject
{
    Q_OBJECT
public:
    explicit MyTestClass(QObject *parent = nullptr);

signals:

};

#endif // MYTESTCLASS_H
