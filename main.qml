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

        Rectangle {
            id: drawerOpenButton
            width: toolbar.height
            height: toolbar.height

            Image {
                id: openIcon
                source: "iconic/"
            }

            MouseArea {
                id: drawerOpen
                anchors.fill: parent

                onClicked: {
                    console.log("clicked")
                    console.log(drawer.width)

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
