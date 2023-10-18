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
import "logic/logic.js" as Logic

Item {
    height: parent.height
    width: parent.width

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
        //anchors.fill: parent
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
                property var lastRotation: Qt.quaternion(1, 0, 0, 0)
                property var nextRotation: Qt.quaternion(0, 0, 0, 0)
                property int animationDuration: 100
                property alias aAnim : angleAnim

                pivot: Qt.vector3d(0, 0, 0)

                top_color: model.top_color
                right_color: model.right_color
                front_color: model.front_color
                bottom_color: model.bottom_color
                back_color: model.back_color
                left_color: model.left_color

                QuaternionAnimation {
                    id: angleAnim
                    from: cube.lastRotation
                    to: cube.nextRotation
                    duration: animationDuration
                    loops: 1
                    target: cube
                    property: "rotation"
                    onFinished: cube.lastRotation = cube.nextRotation
                    alwaysRunToEnd: true
                }

                Behavior on x {
                    NumberAnimation {
                        duration: animationDuration
                    }
                }

                Behavior on y {
                    NumberAnimation {
                        duration: animationDuration
                    }
                }

                Behavior on z {
                    NumberAnimation {
                        duration: animationDuration
                    }
                }
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
            backgroundMode: SceneEnvironment.Color
            //backgroundMode: SceneEnvironment.SkyBox

            lightProbe: Texture {
                textureData: ProceduralSkyTextureData{}
            }
        }
    }

    OrbitCameraController {
        id: orbitController
        origin: parentNode
        camera: pCam
        //enabled: helper.orbitControllerEnabled
    }

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        anchors.top: view.bottom
        padding: 10
        spacing: 10
        OrientationGrid {
            id: orientationGrid

            onTopClicked: cubeRepeater.cubeXR += 90
            onDownClicked: cubeRepeater.cubeXR -= 90
            onLeftClicked: cubeRepeater.cubeYR += 90
            onRightClicked: cubeRepeater.cubeYR -= 90
            onReorientClicked: {cubeRepeater.cubeXR = 0; cubeRepeater.cubeYR = 0;

            parentNode.eulerRotation = Qt.vector3d(0, 0 , 0)
            }
        }

        Column {
            spacing: 8
            Button {
                id: refillButton
                anchors.horizontalCenter: parent.horizontalCenter
                height: 40
                text: "Reset"
                flat: false
                onClicked: {
                    pCam.position = Qt.vector3d(20, 20, 20)
                    //pCam.lookAt(cubeRepeater)
                    //orbitController.
                    Logic.fillModel()
                }
            }

            Button {
                text: "Shuffle"
                anchors.horizontalCenter: parent.horizontalCenter

                height: 40
                onClicked: {
                    if (shuffleTimer.running) {
                        shuffleTimer.stop()
                    } else {
                        shuffleTimer.start()
                    }
                }
            }
        }

        CubeControls {
            id: cubeControls
            enabled: !shuffleTimer.running
            onButtonClicked: (name) => {
                                 switch (name) {
                                     case "R": {
                                         Logic.rotateRight()
                                         break;
                                     }
                                     case "R'": {
                                         Logic.rotateRightA()
                                         break;
                                     }

                                     case "L": {
                                         Logic.rotateLeft()
                                         break;
                                     }
                                     case "L'": {
                                         Logic.rotateLeftA()
                                         break;
                                     }

                                     case "T": {
                                         Logic.rotateTop()
                                         break;
                                     }
                                     case "T'": {
                                         Logic.rotateTopA()
                                         break;
                                     }

                                     case "F": {
                                         Logic.rotateFront()
                                         break;
                                     }

                                     case "F'": {
                                         Logic.rotateFrontA()
                                         break;
                                     }
                                 }
                             }
        }

    }


}
