// main.qml

import QtQuick
import QtQuick3D
import QtQuick3D.Particles3D
import QtQuick.Controls
import QtQuick.Timeline
import QtQuick.Layouts
import Qt3D.Extras 2.15
import "comps"

Window
{
    visible: true
    width: 640
    height: 480
    color: "#000000"


    property real cubeRotation: 0

    property var cubeModel: ListModel {}


    function fillModel () {
        var color1 = "white"
        var color2 = "white"
        var color3 = "white"
        for (var i=0; i<=2; i++) {
            for (var j = 0; j<=2; j++) {
                for (var k = 0; k<=2; k++) {
                    if (k==0) {
                        color3 = "blue"
                    } else {
                        color3 = "white"
                    }

                    cubeModel.append({x: i*5, y: j*5, z: k*5,
                                        color1: color1,
                                        color2: color2,
                                        color3: color3,
                                        xr: 0,
                                        yr: 0,
                                        zr: 0})
                }
            }

        }
    }

    function rotateTop() {
        for (var i = 0; i<9; i++) {
            if (cubeModel.get(i).xr == 90 ) {
                cubeModel.setProperty(i, "xr", 0)
                cubeModel.setProperty(i, "yr", 0)
                cubeModel.setProperty(i, "zr", 0)
            } else {
                cubeModel.setProperty(i, "xr", 90)
                cubeModel.setProperty(i, "yr", 90)
                cubeModel.setProperty(i, "zr", 90)
                }
            }
    }

    Component.onCompleted: {
        fillModel()
    }


    View3D {
        id: view
        anchors.fill: parent



        PointLight {
            color: "red"
            ambientColor: "yellow"
            brightness: 2.0
        }

        Repeater3D {
            id: cubeRepeater
            model: cubeModel

            Cube {
                id: cube
                    x: model.x
                    y: model.y
                    z: model.z
                    property int xr: model.xr
                    property int yr: model.yr
                    property int zr: model.zr
                    eulerRotation: Qt.vector3d(xr, yr, zr)

                    pivot: Qt.vector3d(10, 0, 0)


                    Behavior on xr {
                        NumberAnimation {
                            duration: 1000
                        }
                    }

                    Behavior on yr {
                        NumberAnimation {
                            duration: 1000
                        }
                    }

                    Behavior on zr {
                        NumberAnimation {
                            duration: 1000
                        }
                    }


                    //rotation: 90
//                    front_t: model.color1
//                    front_b: model.color2
//                    left: model.color3


                }

//            SequentialAnimation on eulerRotation.x {
//                id: cubeAnimation1
//                loops: Animation.Infinite
//                running: false
//                    PropertyAnimation {
//                        duration: 5000
//                        from: 0
//                        to: 90
//                    }
//                }

        }

        Rectangle {
            anchors.bottom: parent.bottom
            height: 50
            width: height
            MouseArea {
                anchors.fill: parent
                onClicked: {
                    rotateTop()
                    console.log("clicked")
                }
            }
        }


        Node {
            property real rot: 0.0
            PropertyAnimation on rot {
                from: 0.0
                to: 360.0
                duration: 10000
                loops: Animation.Infinite
                running: false
                //paused: !checkBoxRotateCamera.checked
            }
            eulerRotation: Qt.vector3d(2*rot, rot, rot)
            PerspectiveCamera {
                id: pCam
                x: 50
                y: 20
                z: 20
                lookAtNode: cubeRepeater
            }

            OrbitCameraController {
                //camera: pCam
            }
        }


        environment: SceneEnvironment {
            clearColor: "darkGray"
            backgroundMode: SceneEnvironment.Color
        }


    }


}
