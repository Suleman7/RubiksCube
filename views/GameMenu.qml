import QtQuick
import QtQuick.Controls 2.15
import QtQuick.Shapes 1.6

import "../comps"

Item {
    id: root

    property real gStop1: 0.0
    property real gStop2: 0.33
    property real gStop3: 1.0

    Timer {
        interval: 5000
        running: true
        repeat: true
        onTriggered: {
            var a = Math.random()
            var b = Math.random()
            var c = Math.random()
            gStop1 = Math.min(a, b, c)
            gStop3 = Math.max(a, b, c)
            gStop2 = (gStop1 + gStop3) * 0.5
        }
    }

    Behavior on gStop1 {
        NumberAnimation {
            duration: 4000
        }
    }

    Behavior on gStop2 {
        NumberAnimation {
            duration: 4000
        }
    }
    Behavior on gStop3 {
        NumberAnimation {
            duration: 4000
        }
    }

    Shape {
        anchors.fill: parent
        opacity: 0.5
        ShapePath {
            strokeWidth: 1
            capStyle: ShapePath.FlatCap
            strokeStyle: ShapePath.SolidLine
            strokeColor: "red"
            fillGradient: RadialGradient {
                centerX: parent.width /2 ; centerY: parent.height / 2
                centerRadius: root.width *0.5
                focalX: centerX; focalY: centerY
                GradientStop { position: gStop1; color: "#389480" }
                GradientStop { position: gStop2; color: "#5D9888" }
                GradientStop { position: gStop3; color: "#4E856A" }
            }
            dashPattern: [ 1, 4 ]
            startX: 0; startY: 0
            PathLine { x: 0; y: 0 }
            PathLine { x: root.width; y: 0 }
            PathLine { x: root.width; y: root.height }
            PathLine { x: 0; y: root.height }
        }
    }

    Rectangle {
        anchors.fill: parent
        opacity: 0.5
        gradient: Gradient {
            GradientStop { position: gStop1; color: "#389480" }
            GradientStop { position: gStop2; color: "#5D9888" }
            GradientStop { position: gStop3; color: "#4E856A" }
        }
    }

    Column {
        anchors.centerIn: parent
        spacing: 20
        StyledButton {
            buttonText: "New Game"
            onButtonClicked: {
                stack.push(gameView)
            }
        }

        StyledButton {
            buttonText: "Create Cube"
            onButtonClicked: {
                stack.push(createCubeView)
            }
        }
    }

}
