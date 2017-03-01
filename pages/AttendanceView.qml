import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import Qt.labs.calendar 1.0


Page {

    signal changeScreen(string src)

    id: page

    header: TabBar {
        id: tabbar
        currentIndex: swipeview.currentIndex

        TabButton {
            text: "Profile"
        }
        TabButton {
            text: "Calendar"
        }
    }

    Component.onCompleted: {
        console.log(swipeview.height)
    }

    SwipeView {

        id: swipeview
        width: parent.width
        height: parent.height
        currentIndex: tabbar.currentIndex

        Pane {
            width: swipeview.width
            height: swipeview.height

            //            MonthGrid {
            //                width: parent.width
            //                height: parent.width

            //                month: Calendar.December
            //                year: 2017
            //            }

            Component {
                id: delegate
                Label {
                    text: model.text
                    font.pixelSize: 50
                }
            }

            ListModel{
                id: model
                ListElement {
                    text: "1"
                }
                ListElement {
                    text: "2"
                }
                ListElement {
                    text: "3"
                }
                ListElement {
                    text: "4"
                }
                ListElement {
                    text: "5"
                }
                ListElement {
                    text: "6"
                }
                ListElement {
                    text: "7"
                }
                ListElement {
                    text: "8"
                }
                ListElement {
                    text: "9"
                }
                ListElement {
                    text: "0"
                }
            }

            PathView {
                id: pathview
                anchors.fill: parent
                model: model
                delegate: delegate
                path: Path {


                               startX: swipeview.width / 2; startY: (swipeview.height / 2) + (swipeview.width - 200) / 2
                               PathArc {
                                   x: swipeview.width / 2; y: (swipeview.height / 2) - (swipeview.width - 200) / 2
                                   radiusX: (swipeview.width - 200) / 2; radiusY:(swipeview.width - 200) / 2
                                   useLargeArc: false
                               }
                               PathArc {
                                   x: swipeview.width / 2; y: (swipeview.height / 2 ) + (swipeview.width - 200) / 2
                                   radiusX: (swipeview.width - 200) / 2; radiusY: (swipeview.width - 200) / 2
                                   useLargeArc: false
                               }
                 }

                    //                    startX: 100; startY: swipeview.height / 2
//                    PathArc {
//                        x: swipeview.width - 100; y: swipeview.height / 2
//                        radiusX: (swipeview.width - 100) / 2; radiusY: (swipeview.width - 100 )/ 2
//                        useLargeArc: false

//                    }
//                    PathArc {
//                        x: swipeview.width - 50; y: swipeview.height / 2
//                        radiusX: (swipeview.width - 100) / 2; radiusY: (swipeview.width - 100) / 2
//                        useLargeArc: false
//                    }

                focus: true
//                Keys.onLeftPressed: decrementCurrentIndex()
//                Keys.onRightPressed: incrementCurrentIndex()

//                MouseArea {
//                    anchors.fill: swipeview

//                    onClicked: {
//                        console.log("clicked")
//                        pathview.decrementCurrentIndex()
//                    }
//                }
                Timer {
                    running: true
                    repeat: true
                    interval: 2000
                    onTriggered: {
                        pathview.decrementCurrentIndex()
                    }
                }

            }




        }

        Pane {

            width: swipeview.width
            height: swipeview.height

            Text {
                id: textt
                text: "fuga"
            }
        }

    }


}
