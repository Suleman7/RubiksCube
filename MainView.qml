import QtQuick
import QtQuick.Controls 2.15

import "views"

Item {
    height: parent.height
    width: parent.width

    StackView {
        id: stack
        initialItem: menuView
        anchors.fill: parent
    }

    Component {
        id: menuView
        GameMenu {}
    }
    Component {
        id: gameView
        CubeView {}
    }
    Component {
        id: createCubeView
        CreateCubeView {}
    }
}
