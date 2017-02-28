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

    SwipeView {

        id: swipeview
        width: parent.width
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
                Text {
                    text: model.text
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
            }

            PathView {
                id: pathview
                anchors.fill: parent
                model: model
                delegate: delegate
                path: Path {
                    startX: swipeview.width / 2; startY: (swipeview.height / 2) + (swipeview.width / 2)
                    PathArc {
                        x: 100; y: (swipeview.height / 2)
                        radiusX: (swipeview.width - 100) / 2; radiusY: (swipeview.width - 100 )/ 2
                        useLargeArc: true

                    }
//                    PathArc {
//                        x: swipeview.width - 50; y: swipeview.height / 2
//                        radiusX: (swipeview.width - 100) / 2; radiusY: (swipeview.width - 100) / 2
//                        useLargeArc: false
//                    }
                }
                focus: true
                Keys.onLeftPressed: decrementCurrentIndex()
                Keys.onRightPressed: incrementCurrentIndex()

                MouseArea {
                    anchors.fill: swipeview

                    onClicked: {
                        console.log("clicked")
                        pathview.decrementCurrentIndex()
                    }
                }
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
