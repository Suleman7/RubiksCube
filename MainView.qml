import QtQuick
import QtQuick3D
import QtQuick3D.Particles3D
import QtQuick.Controls 2.15
import QtQuick.Timeline
import QtQuick.Layouts
import QtQuick3D.Helpers
import QtQuick3D.AssetUtils

import "comps"
import "controls"
import "views"
import "logic/logic.js" as Logic

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

}
