// main.qml
import QtQuick

import "logic/logic.js" as Logic

Window
{
    visible: true
    width: Screen.width * 0.5
    height: Screen.height * 0.5
    color: "#000000"


    property real cubeRotation: 0

    property var cubeModel: ListModel {}
    property var cubeEModel: ListModel {}

    property real scalarVal : 0.0

    property real xr_0 : 0.0
    property real yr_0 : 0.0
    property real zr_0 : 0.0

    Shortcut {
        sequence: StandardKey.Save
        onActivated: {
            loader.source = ""
            _qmlEngine.clearCache()
            loader.source = "MainView.qml"
        }
    }

    Loader {
        id: loader
        anchors.fill: parent
        source: "MainView.qml"

    }

    Component.onCompleted: {
        Logic.fillModel()
    }


}
