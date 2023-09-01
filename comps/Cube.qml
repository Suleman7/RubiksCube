import QtQuick 2.15
import QtQuick3D

Model {
    source: "assets/meshes/cube.mesh"
    eulerRotation: Qt.vector3d(0, 0, 0)
    scale: Qt.vector3d(2, 2, 2)

    property alias front_t: frontTop_material.baseColor
    property alias front_b: frontBottom_material.baseColor
    property alias left: leftSide_material.baseColor
    property alias right: rightSide_material.baseColor
    property alias bottom_back: bottomSide_material.baseColor
    property alias backSide: backSide_material.baseColor

    PrincipledMaterial {
        id: frontTop_material
        baseColor: "red"
        cullMode: Material.NoCulling
        lighting: PrincipledMaterial.NoLighting
    }

    PrincipledMaterial {
        id: frontBottom_material
        baseColor: "green"
        cullMode: Material.NoCulling
        lighting: PrincipledMaterial.NoLighting
    }

    PrincipledMaterial {
        id: leftSide_material
        baseColor: "blue"
        cullMode: Material.NoCulling
        lighting: PrincipledMaterial.NoLighting
    }

    PrincipledMaterial {
        id: rightSide_material
        baseColor: "pink"
        cullMode: Material.NoCulling
        lighting: PrincipledMaterial.NoLighting
    }

    PrincipledMaterial {
        id: backSide_material
        baseColor: "orange"
        cullMode: Material.NoCulling
        lighting: PrincipledMaterial.NoLighting
    }

    PrincipledMaterial {
        id: bottomSide_material
        baseColor: "navy"
        cullMode: Material.NoCulling
        lighting: PrincipledMaterial.NoLighting
    }



    materials: [
        frontTop_material,
        frontBottom_material,
        leftSide_material,
        backSide_material,
        rightSide_material,
        bottomSide_material
    ]
}
