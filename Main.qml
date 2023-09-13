// main.qml

import QtQuick
import QtQuick3D
import QtQuick3D.Particles3D
import QtQuick.Controls 2.15
import QtQuick.Timeline
import QtQuick.Layouts
import QtQuick3D.Helpers


import "comps"
import "controls"
import "logic/logic.js" as Logic

Window
{
    visible: true
    width: 640
    height: 480
    color: "#000000"


    property real cubeRotation: 0

    property var cubeModel: ListModel {}

    Component.onCompleted: {
        Logic.fillModel()
    }

    View3D {
        id: view
        //anchors.fill: parent
        anchors.top: parent.top
        width: parent.width
        height: 340



//        PointLight {
//            color: "red"
//            ambientColor: "yellow"
//            brightness: 2.0
//        }

        Repeater3D {
            id: cubeRepeater
            model: cubeModel

            pivot: Qt.vector3d(5, 5 , 5)
            //position: Qt.vector3d(0, 0 , 0)

            property int cubeXR : 0
            property int cubeYR : 0
            property int cubeZR : 0

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
                property int xr: model.xr
                property int yr: model.yr
                property int zr: model.zr
                eulerRotation: Qt.vector3d(xr, yr, zr)

                //pivot: Qt.vector3d(10, 0, 0)
                //position: Qt.vector3d(0, 0, 0)


                Behavior on x {
                    NumberAnimation {
                        duration: 200
                        //easing.type: Easing.OutQuint
                    }
                }

                Behavior on y {
                    NumberAnimation {
                        duration: 200
                    }
                }

                Behavior on z {
                    NumberAnimation {
                        duration: 200
                    }
                }
                Behavior on xr {
                    NumberAnimation {
                        duration: 200
                    }
                }

                Behavior on yr {
                    NumberAnimation {
                        duration: 200
                    }
                }

                Behavior on zr {
                    NumberAnimation {
                        duration: 200
                    }
                }
            }
        }

        Node {
            PerspectiveCamera {
                id: pCam
                x: 20
                y: 20
                z: 20
                lookAtNode: cubeRepeater
            }
        }

        /*DirectionalLight {
            id: light1
            color: "white"//Qt.rgba(1.0, 0.1, 0.1, 1.0)
            ambientColor: Qt.rgba(0.1, 0.1, 0.1, 1.0)
            position: Qt.vector3d(0, 20, 0)
            rotation: Quaternion.fromEulerAngles(0, 0, 0)
            shadowMapQuality: Light.ShadowMapQualityHigh
            visible: true
            castsShadow: true
            brightness: 50
            SequentialAnimation on rotation {
                loops: Animation.Infinite
                QuaternionAnimation {
                    to: Quaternion.fromEulerAngles(-45, -90, 0)
                    duration: 2000
                    easing.type: Easing.InOutQuad
                }
                QuaternionAnimation {
                    to: Quaternion.fromEulerAngles(-135, -90, 0)
                    duration: 2000
                    easing.type: Easing.InOutQuad
                }
            }
        }*/

        environment: SceneEnvironment {
            clearColor: "#4a4a4a"
            backgroundMode: SceneEnvironment.Color
        }


        // Connect mouse events to control rotation
        /*MouseArea {
            id: mouseArea
            anchors.fill: parent
            acceptedButtons: Qt.LeftButton | Qt.RightButton
            //drag.target: view

            property real lastMouseX: 0
            property real lastMouseY: 0

            onPositionChanged: {
                var dx = mouseX - mouseArea.lastMouseX;
                var dy = mouseY - mouseArea.lastMouseY;
                cubeRepeater.cubeXR += dy;
                cubeRepeater.cubeYR += dx;
                mouseArea.lastMouseX = mouseX;
                mouseArea.lastMouseY = mouseY;
            }
        }*/
    }

    OrientationGrid {
        id: orientationGrid
        anchors.bottom: parent.bottom

        onTopClicked: cubeRepeater.cubeXR += 90
        onDownClicked: cubeRepeater.cubeXR -= 90
        onLeftClicked: cubeRepeater.cubeYR += 90
        onRightClicked: cubeRepeater.cubeYR -= 90
        onReorientClicked: {cubeRepeater.cubeXR = 0; cubeRepeater.cubeYR = 0;}
    }

    Button {
        anchors.left: orientationGrid.right
        anchors.bottom: parent.bottom
        onClicked: {
            Logic.shuffleCube()
        }
    }

    CubeControls {
        anchors.bottom: parent.bottom
        anchors.right: parent.right

        onButtonClicked: (name) => {
            switch (name) {
            case "L": {
                Logic.rotateLeft()
                break;
            }

            case "T": {
                Logic.rotateTop()
                break;
            }

            case "R": {
                Logic.rotateRight()
            }
            }
        }
    }

}
