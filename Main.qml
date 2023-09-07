// main.qml

import QtQuick
import QtQuick3D
import QtQuick3D.Particles3D
import QtQuick.Controls 2.15
import QtQuick.Timeline
import QtQuick.Layouts

import "comps"
import "controls"

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

    function rotateLeft() {
        for (var i = 0; i<cubeModel.count; i++) {
            const x = cubeModel.get(i).x
            const y = cubeModel.get(i).y
            const z = cubeModel.get(i).z
            const xr = cubeModel.get(i).xr

            if (x === 0) {
                if (y === 0 && z === 0) {
                    cubeModel.setProperty(i, "y", 10)
                    cubeModel.setProperty(i, "z", 0)
                } else if (y === 5 && z === 0) {
                    cubeModel.setProperty(i, "y", 10)
                    cubeModel.setProperty(i, "z", 5)
                } else if (y === 10 && z === 0) {
                    cubeModel.setProperty(i, "y", 10)
                    cubeModel.setProperty(i, "z", 10)
                } else if (y === 0 && z === 5) {
                    cubeModel.setProperty(i, "y", 5)
                    cubeModel.setProperty(i, "z", 0)
                } else if (y === 10 && z === 5) {
                    cubeModel.setProperty(i, "y", 5)
                    cubeModel.setProperty(i, "z", 10)
                } else if (y === 0 && z === 10) {
                    cubeModel.setProperty(i, "y", 0)
                    cubeModel.setProperty(i, "z", 0)
                } else if (y === 5 && z === 10) {
                    cubeModel.setProperty(i, "y", 0)
                    cubeModel.setProperty(i, "z", 5)
                } else if (y === 10 && z === 10) {
                    cubeModel.setProperty(i, "y", 0)
                    cubeModel.setProperty(i, "z", 10)
                }

                if (xr === 360) {
                    cubeModel.setProperty(i, "xr", 90)
                } else {
                    cubeModel.setProperty(i, "xr", xr + 90)
                }
            }


        }
    }

    function rotateTop() {


        var count = 0

        for (var i = 0; i < cubeModel.count; i++) {
            const x = cubeModel.get(i).x
            const y = cubeModel.get(i).y
            const z = cubeModel.get(i).z
            const yr = cubeModel.get(i).yr


            if (y === 10) {
                if (x === 0 && z === 0) {
                    cubeModel.setProperty(i, "x", 10)
                    cubeModel.setProperty(i, "z", 0)
                } else if (x === 5 && z === 0) {
                    cubeModel.setProperty(i, "x", 10)
                    cubeModel.setProperty(i, "z", 5)
                } else if (x === 10 && z === 0) {
                    cubeModel.setProperty(i, "x", 10)
                    cubeModel.setProperty(i, "z", 10)
                } else if (x === 0 && z === 5) {
                    cubeModel.setProperty(i, "x", 5)
                    cubeModel.setProperty(i, "z", 0)
                } else if (x === 10 && z === 5) {
                    cubeModel.setProperty(i, "x", 5)
                    cubeModel.setProperty(i, "z", 10)
                } else if (x === 0 && z === 10) {
                    cubeModel.setProperty(i, "x", 0)
                    cubeModel.setProperty(i, "z", 0)
                } else if (x === 5 && z === 10) {
                    cubeModel.setProperty(i, "x", 0)
                    cubeModel.setProperty(i, "z", 5)
                } else if (x === 10 && z === 10) {
                    cubeModel.setProperty(i, "x", 0)
                    cubeModel.setProperty(i, "z", 10)
                }

                if (yr === 0) {
                    cubeModel.setProperty(i, "yr", 270)
                } else {
                    cubeModel.setProperty(i, "yr", yr - 90)
                }
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

            pivot: Qt.vector3d(0, 0 , 0)
            position: Qt.vector3d(0, 0 , 0)

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

                    Behavior on x {
                        NumberAnimation {
                            duration: 1000
                        }
                    }

                    Behavior on y {
                        NumberAnimation {
                            duration: 1000
                        }
                    }

                    Behavior on z {
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

        Column {
            Rectangle {
                //anchors.bottom: parent.bottom
                height: 50
                width: height

                Text {
                    text: "R"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        rotateLeft()
                    }
                }
            }

            Rectangle {
                //anchors.bottom: parent.bottom
                height: 50
                width: height

                Text {
                    text: "T"
                }

                MouseArea {
                    anchors.fill: parent
                    onClicked: {
                        rotateTop()
                    }
                }
            }
        }

        OrientationGrid {
            anchors.bottom: parent.bottom
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
                x: -50
                y: 20
                z: 60
                lookAtNode: cubeRepeater
            }

//            OrbitCameraController {
//                camera: pCam
//            }
        }


        environment: SceneEnvironment {
            clearColor: "darkGray"
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
                console.log("new ")
                var dx = mouseX - mouseArea.lastMouseX;
                var dy = mouseY - mouseArea.lastMouseY;
                cubeRepeater.eulerRotation.x += dy;
                cubeRepeater.eulerRotation.y += dx;
                mouseArea.lastMouseX = mouseX;
                mouseArea.lastMouseY = mouseY;
            }
        }*/
    }


}
