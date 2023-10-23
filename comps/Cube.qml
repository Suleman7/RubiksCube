import QtQuick 2.15
import QtQuick3D


Model {
    source: "../assets/meshes/cube.mesh"
    scale: Qt.vector3d(2.4, 2.4, 2.4)

    property alias aAnim : angleAnim
    property int animationDuration: 100
    property var lastRotation: Qt.quaternion(1, 0, 0, 0)
    property var nextRotation: Qt.quaternion(0, 0, 0, 0)

    property alias top_color: top_material.baseColor
    property alias right_color: right_material.baseColor
    property alias front_color: front_material.baseColor
    property alias bottom_color: bottom_material.baseColor
    property alias back_color: back_material.baseColor
    property alias left_color: left_material.baseColor

    PrincipledMaterial {
        id: bottom_material
        baseColor: "white"
        cullMode: Material.NoCulling
        lighting: PrincipledMaterial.NoLighting
    }

    PrincipledMaterial {
        id: back_material
        baseColor: "green"
        cullMode: Material.NoCulling
        lighting: PrincipledMaterial.NoLighting
    }

    PrincipledMaterial {
        id: left_material
        baseColor: "orange"
        cullMode: Material.NoCulling
        lighting: PrincipledMaterial.NoLighting
    }

    PrincipledMaterial {
        id: top_material
        baseColor: "yellow"
        cullMode: Material.NoCulling
        lighting: PrincipledMaterial.NoLighting
    }

    PrincipledMaterial {
        id: right_material
        baseColor: "red"
        cullMode: Material.NoCulling
        lighting: PrincipledMaterial.NoLighting
    }

    PrincipledMaterial {
        id: front_material
        baseColor: "blue"
        cullMode: Material.NoCulling
        lighting: PrincipledMaterial.NoLighting
    }

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



    materials: [
        bottom_material,
        left_material,
        back_material,
        right_material,
        top_material,
        front_material
    ]
}
