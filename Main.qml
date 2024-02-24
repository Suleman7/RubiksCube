import QtQuick
import "logic/logic.js" as Logic


import QtQuick 2.15
//import Qt3D.Core 2.15
//import Qt3D.Render 2.15
//import Qt3D.Extras 2.15
//import Qt3D.Input 2.15
import QtQuick.Window 2.15
import QtQuick.Scene3D 2.15

/*Window {
    visible: true
    width: 800
    height: 600

    Scene3D {
        id: scene3d
        anchors.fill: parent

        aspects: ["input", "logic", "render"]

        Entity {
            id: sceneRoot

            components: [
                RenderSettings {
                    activeFrameGraph: ForwardRenderer {
                        clearColor: Qt.rgba(0, 0, 0, 1)
                        camera: camera
                    }
                }
            ]

            Camera {
                id: camera
                projectionType: CameraLens.PerspectiveProjection
                fieldOfView: 45
                aspectRatio: 16/9
                nearPlane : 0.1
                farPlane : 1000.0
                position: Qt.vector3d(0, 0, 10)
                upVector: Qt.vector3d(0, 1, 0)
                viewCenter: Qt.vector3d(0, 0, 0)
            }

            DirectionalLight {
                id: mainLight
                color: "white"
                intensity: 1.0
                worldDirection: Qt.vector3d(0, 0, -1)
            }

            CubeEntity { }
        }
    }
}*/






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
            loader.source = "CreateCubeView.qml"//"MainView.qml"
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
