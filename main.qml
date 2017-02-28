import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Controls 2.0
import QtQuick.Controls.Material 2.0
import QtQuick.Controls.Universal 2.0

ApplicationWindow {

    id: window
    visible: true
    width: 640
    height: 480
    title: qsTr("HTT Bread")

    Material.theme: Material.Light

    Component.onCompleted: {
        changeScreen("qrc:pages/Firstview.qml")
    }


    Loader {
        active: true
        visible: true
        id: loader
        anchors.fill: parent
        focus: true
    }

    function changeScreen(src){
        loader.source = src
    }


//    header: ToolBar {

//        visible: false

//        Material.foreground: Material.Lime
//        Material.background: Material.Green

//        RowLayout {

//            spacing: 20
//            anchors.fill: parent

//            ToolButton {
//                visible: false
//                contentItem: Image {
//                    id: drawerImage
//                    horizontalAlignment: Image.AlignHCenter
//                    verticalAlignment: Image.AlignVCenter
//                    sourceSize.height: parent.height / 2.0
//                    sourceSize.width: parent.height
//                    source: "./open-iconic/svg/menu.svg"
//                }

//                onClicked: {
//                    if(stackView.depth > 1 ){
////                        stackView.pop()
////                        listView.currentIndex = -1
//                        drawer.open()
//                    } else {
//                        drawer.open()
//                    }
//                }



//            }

//        }

//    }



//    Drawer {

//        id: drawer
//        visible: false
//        y: header.height
//        width: window.width * 0.6
//        height: window.height - header.height


//        ListView {
//            id: listView
//            currentIndex: -1
//            anchors.fill: parent

//            delegate: ItemDelegate {

//                width: parent.width
//                text: model.title
//                highlighted: ListView.currentIndex
//                onClicked: {
//                    if(listView.currentIndex != index){
//                        listView.currentIndex = index
//                        stackView.push(model.source)
//                    }
//                    drawer.close()
//                }

//                ScrollIndicator.vertical: ScrollIndicator { }

//            }

//            model: listModel

//            ListModel{
//                id: listModel

//                ListElement {
//                    title: "Attendance"
//                    iconSource: ""
//                    source: "/path/to/qml"
//                }
//                ListElement {
//                    title: "Login"
//                    iconSource: ""
//                    source: "qrc:pages/Login.qml"
//                }
//                ListElement {
//                    title: "Logout"
//                    iconSource: ""
//                    source: "/path/to/qml"
//                }

//            }

//        }

//    }

//    StackView {
//        id: stackView
//        anchors.fill: parent

//        initialItem:
//        Pane {
//            id: pane
//            anchors.fill: parent

//            Image {
//                id: logo

//                sourceSize.width: parent.availableWidth
//                sourceSize.height: parent.availableWidth
////                fillMode: Image.PreserveAspectFit
//                anchors.centerIn: parent
//                anchors.verticalCenterOffset: -50
//                source: "./resource/bread.svg"

//            }
//            Label {
//                id: httBreadLabel

//                text: "HTT Bread makes your life better"
//                anchors.margins: 20
//                anchors.top: logo.bottom
//                anchors.left: parent.left
//                anchors.right: parent.right

//                horizontalAlignment: Label.AlignHCenter
//                verticalAlignment: Label.AlignHCenter
//                wrapMode: Label.Wrap

//                font.pixelSize: 20

//            }

//            Button {
//                anchors.margins: 40
//                anchors.top: httBreadLabel.bottom
//                anchors.left: parent.left
//                anchors.right: parent.right

//                width: parent.width / 4

//                font.pixelSize: 25

//                text: "Let's Get Started"

//                Material.background: Material.LightGreen
//                Material.foreground: "white"

//                onClicked: {
////                    console.log("clicked start button")
////                    stackView.push("qrc:pages/Login.qml")
//                    console.log("hogehoge")
//                    loader.source = "qrc:pages/Login.qml"
//                }

//            }

//        }

    Connections{
        target: loader.item
        onChangeScreen: {
            changeScreen(src)
        }
    }

}



//}

