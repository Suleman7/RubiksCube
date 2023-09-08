import QtQuick 2.15
import QtQuick.Controls

Item {

    width: 130
    height: 130

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
        width: 50
        height: 50

        anchors.top: parent.top
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked: topClicked()
    }

    Button {
        width: 50
        height: 50

        anchors.bottom: parent.bottom
        anchors.horizontalCenter: parent.horizontalCenter

        onClicked: downClicked()
    }

    Button {
        width: 50
        height: 50

        anchors.left: parent.left
        anchors.verticalCenter: parent.verticalCenter

        onClicked: leftClicked()
    }

    Button {
        width: 50
        height: 50

        anchors.right: parent.right
        anchors.verticalCenter: parent.verticalCenter

        onClicked: rightClicked()
    }

    Button {
        width: 50
        height: 50

        anchors.centerIn: parent

        onClicked: reorientClicked()
    }

}
