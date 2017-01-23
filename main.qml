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

    header: ToolBar {

        Material.foreground: "white"

        RowLayout {

            spacing: 20
            anchors.fill: parent

            ToolButton {

                contentItem: Image {
                    id: drawerImage
                    horizontalAlignment: Image.AlignHCenter
                    verticalAlignment: Image.AlignVCenter
                    sourceSize.height: parent.height / 1.5
                    sourceSize.width: parent.height
                    source: "./open-iconic/svg/menu.svg"
                }
                onClicked: {
                    if(stackView.depth > 1 ){
                        stackView.pop()
                        listView.currentIndex = -1
                    } else {
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


        ListView {
            id: listView
            currentIndex: -1
            anchors.fill: parent

            delegate: ItemDelegate {

                    width: parent.width
                    text: model.title
                    highlighted: ListView.currentIndex
                    onClicked: {
                      if(listView.currentIndex != index){
                            listView.currentIndex = index
                            stackView.push(model.source)
                       }
                       drawer.close()
                    }
            }

            model: ListModel{

                ListElement { title: "Attendance"; source: "Login.qml" }
                ListElement { title: "Login"; source: "/path/to/qml" }
                ListElement { title: "Logout"; source: "/path/to/qml" }

            }

            ScrollIndicator.vertical: ScrollIndicator { }

        }
    }

    StackView {
        id: stackView
        anchors.fill: parent

        initialItem: Pane {
            id: pane

            Image {
                id: logo

                sourceSize.width: pane.availableWidth / 2
                sourceSize.height: pane.availableHeight / 2
                fillMode: Image.PreserveAspectFit
                anchors.centerIn: parent
                anchors.verticalCenterOffset: -50
                source: "./resource/bread.svg"

            }
            Label {
                id: httBreadLabel

                text: "HTT Bread makes your life better"
                anchors.margins: 20
                anchors.top: logo.bottom
                anchors.left: parent.left
                anchors.right: parent.right

                horizontalAlignment: Label.AlignHCenter
                verticalAlignment: Label.AlignHCenter
                wrapMode: Label.Wrap

                font.pixelSize: 22

            }

            Button {
                anchors.margins: 40
                anchors.top: httBreadLabel.bottom
                anchors.left: parent.left
                anchors.right: parent.right

                width: parent.width / 4

                font.pixelSize: 30

                text: "Let's Get Started"

                onClicked: {
                    console.log("clicked start button")
                    stackView.push("/path/to/qml")
                }

            }

        }

    }

}

