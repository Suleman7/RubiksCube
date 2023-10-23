import QtQuick
import QtQuick3D
import QtQuick3D.Particles3D
import QtQuick.Controls 2.15
import QtQuick.Timeline
import QtQuick.Layouts
import QtQuick3D.Helpers

import "../comps"
import "../controls"
import "../views"
import "../logic/logic.js" as Logic

Item {

    Timer {
        id: shuffleTimer
        interval: 200
        repeat: true
        onTriggered: {
            Logic.shuffleCube()
        }
    }

    View3D {
        id: view
        anchors.top: parent.top
        width: parent.width
        height: parent.height * 0.7

        camera: pCam

        Repeater3D {
            id: cubeRepeater

            property int cubeXR : 0
            property int cubeYR : 0
            property int cubeZR : 0

            model: cubeModel

            pivot: Qt.vector3d(5, 5, 5)
            scale: Qt.vector3d(0.8, 0.8, 0.8)
            eulerRotation: Qt.vector3d(cubeXR, cubeYR, cubeZR)

            Behavior on cubeXR {
                NumberAnimation {
                    duration: 1000
                }
            }

            Behavior on cubeZR {
                NumberAnimation {
                    duration: 1000
                }
            }

            Behavior on cubeYR {
                NumberAnimation {
                    duration: 1000
                }
            }

            Cube {
                id: cube
                x: model.x
                y: model.y
                z: model.z

                top_color: model.top_color
                right_color: model.right_color
                front_color: model.front_color
                bottom_color: model.bottom_color
                back_color: model.back_color
                left_color: model.left_color
            }

            Component.onCompleted: {
                pCam.lookAt(cubeRepeater)
                pCam.position = Qt.vector3d(20, 20, 20)
            }
        }

        Node {
            id: parentNode
            PerspectiveCamera {
                id: pCam
                frustumCullingEnabled: true
            }
        }
        environment: SceneEnvironment {
            clearColor: "#4a4a4a"
            //backgroundMode: SceneEnvironment.Color
            backgroundMode: SceneEnvironment.SkyBox

            lightProbe: Texture {
                textureData: ProceduralSkyTextureData{}
            }
        }
        MouseArea {
             anchors.fill:parent
             property real pressedX
             property real pressedY
             onMouseXChanged: Qt.callLater(update)
             onMouseYChanged: Qt.callLater(update)
             onPressed: {
                 [pressedX,pressedY] = [mouseX,mouseY];
             }
             function update() {
                 let [dx,dy] = [mouseX - pressedX,mouseY - pressedY];
                 [pressedX,pressedY] = [mouseX,mouseY];
                 cubeRepeater.rotate(dx, Qt.vector3d(0, 1, 0), Node.SceneSpace);
                 cubeRepeater.rotate(dy, Qt.vector3d(1, 0, 0), Node.SceneSpace);
             }
             onWheel: {

             }
         }
    }

    ControlsView {}
}
