import QtQuick
import QtQuick3D
import QtQuick.Controls 2.15

import "../logic/logic.js" as Logic

Item {
    anchors.bottom: parent.bottom
    width: parent.width
    height: parent.height * 0.3

    signal resetCube

    Row {
        anchors.horizontalCenter: parent.horizontalCenter
        padding: 10
        spacing: 10
        OrientationGrid {
            id: orientationGrid

            onTopClicked: cubeRepeater.cubeXR += 90
            onDownClicked: cubeRepeater.cubeXR -= 90
            onLeftClicked: cubeRepeater.cubeYR += 90
            onRightClicked: cubeRepeater.cubeYR -= 90
            onReorientClicked: {cubeRepeater.cubeXR = 0; cubeRepeater.cubeYR = 0;
                cubeRepeater.eulerRotation = Qt.vector3d(0, 0, 0)
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
                    Logic.fillModel()
                }
            }

            Button {
                text: "Shuffle"
                anchors.horizontalCenter: parent.horizontalCenter

                height: 40
                onClicked: shuffleTimer.running ?
                           shuffleTimer.stop() : shuffleTimer.start()
            }
        }

        CubeControls {
            id: cubeControls
            enabled: !shuffleTimer.running
            onButtonClicked: (name) => Logic.moveCube(name)
        }

    }
}
