import QtQuick 2.15
import QtQuick.Controls

Item {

    width: 100
    height: 100

    signal topClicked
    signal leftClicked
    signal rightClicked
    signal downClicked
    signal reorientClicked

    Rectangle {
        anchors.fill: parent
        color: "black"
        opacity: 0.7
    }

    Button {
        width: 30
        height: 30

        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked: topClicked()
    }

    Button {
        width: 30
        height: 30

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked: downClicked()
    }

    Button {
        width: 30
        height: 30

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        onClicked: leftClicked()
    }

    Button {
        width: 30
        height: 30

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        onClicked: rightClicked()
    }

    Button {
        width: 30
        height: 30

        anchors.centerIn: parent

        onClicked: reorientClicked()
    }

}
