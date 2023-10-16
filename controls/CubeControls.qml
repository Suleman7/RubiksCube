import QtQuick 2.15
import QtQuick.Controls

Item {

    width: 200
    height: 130

    signal buttonClicked (var name)

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.7
    }

    Grid {
        anchors.fill: parent
        Repeater {
            model: ["T", "T'", "L", "L'", "R", "R'", "F", "F'"]
            Button {
                width: 50
                height: 50

                text: modelData

                onClicked: buttonClicked(modelData)
            }
        }
    }
}
