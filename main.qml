import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("HTT Bread")

    header: ToolBar {
        id: toolbar
        width: parent.width / 20
        height: parent.height / 20

        Rectangle{
            anchors.fill: parent
            color: "gray"

        }

        Rectangle {
            id: drawerOpenButton
            width: toolbar.height
            height: toolbar.height

            Image {

                id: drawerIcon
                source: "open-iconic/svg/list.svg"
                x: parent.width * 0.15
                y: parent.height * 0.15
                sourceSize.width: parent.width / 1.3
                sourceSize.height: parent.height / 1.3
            }

            MouseArea {
                id: drawerOpen
                anchors.fill: parent

                onClicked: {
                    // console.log("clicked")
                    // console.log(drawer.width)

                    if (drawer.position == 1.0){
                        drawer.close()
                    }else{
                        drawer.open()
                    }
                }

            }

        }

    }

    Drawer {
        id: drawer

        y: header.height
        width: window.width * 0.6
        height: window.height - header.height
    }




}
