import QtQuick
import QtQuick3D

Node {
    id: material_006_material

    // Resources
    PrincipledMaterial {
        id: light_light10
        baseColor: "#ffcc0226"
    }
    PrincipledMaterial {
        id: material_005_material4
        baseColor: "#ffcc1800"
    }
    PrincipledMaterial {
        id: material_006_material5
        baseColor: "#ffcc0009"
    }
    PrincipledMaterial {
        id: material_material67
        baseColor: "#ff08cc0a"
    }
    PrincipledMaterial {
        id: material_003_material78
        baseColor: "#ffb8cc03"
    }
    PrincipledMaterial {
        id: material_004_material8
        baseColor: "#ff0805cc"
    }

    // Nodes:
    Node {
        id: material_005_material
        Model {
            id: cube2345
            scale: Qt.vector3d(100, 100, 100)
            source: "meshes/cube.mesh"
            materials: [
                light_light10,
                material_005_material4,
                material_006_material5,
                material_material67,
                material_003_material78,
                material_004_material8
            ]
        }
        PointLight {
            id: light_light1011
            position: Qt.vector3d(407.625, 100.545, 590.386)
            rotation: Qt.quaternion(0.570948, 0.169076, 0.272171, 0.75588)
            scale: Qt.vector3d(100, 100, 100)
            brightness: 1000
            quadraticFade: 0.0022222246043384075
        }
        PerspectiveCamera {
            id: camera_camera1112
            position: Qt.vector3d(735.889, -692.579, 495.831)
            rotation: Qt.quaternion(0.780483, 0.483536, 0.208704, 0.336872)
            scale: Qt.vector3d(100, 100, 100)
            fieldOfView: 39.59775161743164
            fieldOfViewOrientation: PerspectiveCamera.Horizontal
        }
    }

    // Animations:
}
