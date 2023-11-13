// CustomEntities/ClickableEntity/ClickableEntity.cpp
#include "clickableentity.h"
#include <Qt3DInput/QMouseDevice>
#include <Qt3DInput/QMouseEvent>


ClickableEntity::ClickableEntity(Qt3DCore::QNode* parent)
    : Qt3DCore::QEntity(parent)
{
    installEventFilter(this);
}

ClickableEntity::~ClickableEntity()
{
}

bool ClickableEntity::eventFilter(QObject* obj, QEvent* event)
{
    if (event->type() == QEvent::MouseButtonPress) {
        QMouseEvent* mouseEvent = static_cast<QMouseEvent*>(event);
        if (mouseEvent->button() == Qt::LeftButton) {
            emit clicked();
            return true;
        }
    }
    return false;
}

