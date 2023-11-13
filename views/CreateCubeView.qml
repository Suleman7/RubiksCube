import QtQuick 2.15
import Qt3D.Core 2.15
import Qt3D.Render 2.15
//import QtQuick.Controls 2.15
import QtQuick.Scene3D 2.15
//import QtQuick3D
import Qt3D.Input 2.15
import Qt3D.Extras 2.6

import CustomEntities 1.0  // Assuming ClickableEntity is in a module named CustomEntities

import "../comps"
import "../controls"
import "../views"
import "../logic/logic.js" as Logic

Item {
    Scene3D {
        anchors.fill: parent
        aspects: ["render", "logic", "input"]


        Entity {
            id: clickableEntity


            // Add a cube
            components: [
                CuboidMesh {
                    id: cubeMesh
                    xExtent: 1.0
                    yExtent: 1.0
                    zExtent: 1.0


                },
                ObjectPicker {
                    onClicked: {
                        cubeMaterial.ambient = Qt.rgba(1, 0, 0, 1)
                        console.log("ClickableEntity Clicked!")
                    }

                },

                Transform {
                    translation: Qt.vector3d(0, 0, 0) // Set the position of the cube
                },

                PhongMaterial {
                    id: cubeMaterial
                    ambient: Qt.rgba(245, 40, 145, 1) // Set the ambient color of the cube
                },
                // Other components if needed
                RenderSettings {
                    activeFrameGraph: ForwardRenderer {
                        camera: cameraEntity
                        clearColor: "lightblue" // Set the background color
                    }
                },
                InputSettings {
                    // Add the InputSettings component for handling user input
                    MouseDevice { }
                }
            ]
            Camera {
                id: cameraEntity
                projectionType: CameraLens.PerspectiveProjection
                fieldOfView: 45
                nearPlane : 0.1
                farPlane : 100.0
                position: Qt.vector3d(0, 0, 5)
                viewCenter: Qt.vector3d(0, 0, 0) // Make the camera look at the cube
                upVector: Qt.vector3d(0, 1, 0)
            }
        }
    }
}
