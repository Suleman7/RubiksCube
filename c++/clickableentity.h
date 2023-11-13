// CustomEntities/ClickableEntity/ClickableEntity.h

#ifndef CLICKABLEENTITY_H
#define CLICKABLEENTITY_H

#include <Qt3DCore/QEntity>
#include <Qt3DRender/QMesh>


class ClickableEntity : public Qt3DCore::QEntity
{
    Q_OBJECT

public:
    ClickableEntity(Qt3DCore::QNode* parent = nullptr);
    virtual ~ClickableEntity();

signals:
    void clicked();

private:
    bool eventFilter(QObject* obj, QEvent* event) override;
};

#endif
