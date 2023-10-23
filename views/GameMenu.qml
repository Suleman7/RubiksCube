import QtQuick
import QtQuick.Controls 2.15

Item {

    Rectangle {
        anchors.fill: parent
        color: "blue"

        Button {
            onClicked: {
                stack.push(gameView)
            }
        }
    }
}
