import QtQuick 2.15

Rectangle {

    property string buttonText
    signal buttonClicked

    width: 100
    height: 50
    radius: 16
    border.width: 1
    border.color: "#27685A"
    color: "#163B33"

    Text {
        anchors.centerIn: parent
        color: "white"
        text: buttonText
    }

    MouseArea {
        anchors.fill: parent
        onClicked: buttonClicked()
    }
}
