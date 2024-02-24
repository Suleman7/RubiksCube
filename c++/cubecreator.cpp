#include "cubecreator.h"
#include <Qt3DExtras/QOrbitCameraController>
#include <Qt3DRender/QCamera>
#include <Qt3DRender/QPointLight>
#include <Qt3DCore/QTransform>

CubeCreator::CubeCreator(Qt3DCore::QNode *parent)
    : Qt3DCore::QEntity(parent)
{
    // Create the cube entity
    //m_cubeEntity = new Qt3DCore::QEntity();

    // Add the mesh
    m_cubeEntity = new Qt3DExtras::QCuboidMesh();
    m_cubeEntity->setXExtent(1.0f);
    m_cubeEntity->setYExtent(1.0f);
    m_cubeEntity->setZExtent(1.0f);
    this->addComponent(m_cubeEntity);

    // Add material
    Qt3DExtras::QPhongMaterial *material = new Qt3DExtras::QPhongMaterial();
    material->setAmbient(QColor(QRgb(0x00FF00))); // Set ambient color to green
    material->setDiffuse(QColor(QRgb(0x00FF00)));
    this->addComponent(material);

    // Add transform
    Qt3DCore::QTransform *transform = new Qt3DCore::QTransform();
    this->addComponent(transform);
}

Qt3DExtras::QCuboidMesh *CubeCreator::cubeEntity() const
{
    return m_cubeEntity;
}
