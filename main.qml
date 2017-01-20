import QtQuick 2.7
import QtQuick.Controls 2.0

ApplicationWindow {
    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("Hello World")

    header: ToolBar {

    }

    Drawer {
        y: header.height
        width: window.width * 0.6
        height: window.height - header.height
    }

}
