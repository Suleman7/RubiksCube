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
        spacing: 8
        Repeater {
            model: ["T", "T'", "L", "L'", "R", "R'", "F", "F'"]
            Button {
                width: 40
                height: 40

                text: modelData

                onClicked: buttonClicked(modelData)
            }
        }
    }
}
