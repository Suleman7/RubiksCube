#ifndef CUBECREATOR_H
#define CUBECREATOR_H

#include <QObject>
#include <Qt3DCore/QEntity>
#include <Qt3DExtras/QForwardRenderer>
#include <Qt3DExtras/QPhongMaterial>
#include <Qt3DExtras/QCuboidMesh>

class CubeCreator : public Qt3DCore::QEntity
{
    Q_OBJECT
    Q_PROPERTY(Qt3DExtras::QCuboidMesh* cubeEntity READ cubeEntity NOTIFY cubeEntityChanged)

public:
    explicit CubeCreator(Qt3DCore::QNode *parent = nullptr);
    //Q_INVOKABLE Qt3DCore::QEntity *cubeEntity() const;

    Qt3DExtras::QCuboidMesh* cubeEntity() const;

signals:
    void cubeEntityChanged();

private:
    Qt3DExtras::QCuboidMesh *m_cubeEntity;
};

#endif // CUBECREATOR_H
