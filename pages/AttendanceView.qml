import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.1
import Qt.labs.calendar 1.0
import QtQuick.Window 2.0
import QtQuick.Controls.Material 2.1


Page {

    signal changeScreen(string src)
    signal submitDate(int month,int day)


    id: page

    function formatNumber(count, modelData){
        var data = count === 12 ? modelData + 1 : modelData;
        return data.toString().length < 2 ? "0" + data : data;
    }

    function formatMonth(count ,modelData){
        var month = ["January", "February", "March", "April", "May","June", "July", "August", "September", "October","November", "December"];
        if(modelData > 11){
            return "YABAI"
        }

        return month[modelData]
    }

    header: TabBar {
        id: tabbar
        currentIndex: swipeview.currentIndex

        TabButton {
            text: "Attendance"
        }
        TabButton {
            text: "Profile"
        }
    }

    Component.onCompleted: {
        console.log(swipeview.height)
    }

    SwipeView {

        id: swipeview
        anchors.fill: parent
        currentIndex: tabbar.currentIndex

        Pane {

            ColumnLayout{

            Frame{
                anchors.horizontalCenter: parent.horizontalCenter
                width: parent.width
                ColumnLayout {
                    anchors.fill: parent
                    Component {
                        id:delegatee

                        Text {
//                            width: swipeview.width / 2
                            //anchors.centerIn: parent
                            opacity: 1.0 - Math.abs(Tumbler.displacement) / (Tumbler.tumbler.visibleItemCount / 2)
                            horizontalAlignment: Text.AlignHCenter
                            verticalAlignment:  Text.AlignVCenter
                            text: formatNumber(Tumbler.tumbler.count,modelData)
                        }
                    }

                    Component {
                        id: monthdelegate

                        Label {
                            //                                anchors.centerIn: parent
//                            width: swipeview.width / 2
                            text: formatMonth(Tumbler.tumbler.count, modelData)
                        }
                    }
                    RowLayout{
                        spacing: 10

//                        ComboBox {
//                            width: parent.width / 4
//                            model: ["2016","2017","2018","2019","2020"]
//                        }

                        ComboBox {
                            id:month
                            model: ["January", "February", "March", "April", "May","June", "July", "August", "September", "October","November", "December"]
                        }

                        ComboBox {
                            id:day
//                            model: ["January", "February", "March", "April", "May","June", "July", "August", "September", "October","November", "December"]
                            model:["1","2","3","4","5","6","7","8","9","10","11","12","13","14","15","16","17","18","19","20","21","22","23","24","25","26","27","28","29","30","31"]
                        }


                    }

                    Button {
                        text: "View"
                        anchors.horizontalCenter: parent.horizontalCenter

                        onClicked: {
                            console.log(month.currentIndex)
                            console.log(day.currentIndex)
                            console.log("ViewButton Clicked")

//                            submitDate(month.currentIndex + 1,day.currentIndex + 1)
//                        	CppSignalSlot
                            networkSignalSlot.loadAttendanceData(month.currentIndex + 1,day.currentIndex + 1)
                        }
                    }
                }


            }

            Frame{
                anchors.horizontalCenter: parent.horizontalCenter

                ColumnLayout {

                }

            }

            }
            //            MonthGrid {
            //                width: parent.width
            //                height: parent.width

            //                month: Calendar.December
            //                year: 2017
            //            }




            //            PathView {
            //                id: pathview
            //                anchors.fill: parent
            //                model: model
            //                delegate: delegate
            //                path: Path {


            //                    startX: (swipeview.width / 2); startY: (swipeview.height / 2) + (swipeview.width - 30) / 2
            //                    PathArc {
            //                        x: swipeview.width / 2; y: (swipeview.height / 2) - (swipeview.width - 30) / 2
            //                        radiusX: (swipeview.width - 30) / 2; radiusY:(swipeview.width - 30) / 2
            //                        useLargeArc: false
            //                    }
            //                    PathArc {
            //                        x: swipeview.width / 2; y: (swipeview.height / 2 ) + (swipeview.width - 30) / 2
            //                        radiusX: (swipeview.width - 30) / 2; radiusY: (swipeview.width - 30) / 2
            //                        useLargeArc: false
            //                    }
            //                }

            //                Component {
            //                    id: delegate


            //                        Rectangle {
            //                            color: "LightGreen"
            //                            radius: parent.width / 2

            //                            Label {
            //                                text: model.text
            //                                font.pixelSize: 40
            //                            }
            //                        }
            //                }

            //                ListModel{
            //                    id: model
            //                    ListElement {
            //                        text: "1"
            //                    }
            //                    ListElement {
            //                        text: "2"
            //                    }
            //                    ListElement {
            //                        text: "3"
            //                    }
            //                    ListElement {
            //                        text: "4"
            //                    }
            //                    ListElement {
            //                        text: "5"
            //                    }
            //                    ListElement {
            //                        text: "6"
            //                    }
            //                    ListElement {
            //                        text: "7"
            //                    }
            //                    ListElement {
            //                        text: "8"
            //                    }
            //                    ListElement {
            //                        text: "9"
            //                    }
            //                    ListElement {
            //                        text: "0"
            //                    }
            //                }

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

            //                focus: true
            //                Keys.onLeftPressed: decrementCurrentIndex()
            //                Keys.onRightPressed: incrementCurrentIndex()

            //                MouseArea {
            //                    anchors.fill: swipeview

            //                    onClicked: {
            //                        console.log("clicked")
            //                        pathview.decrementCurrentIndex()
            //                    }
            //                }
            //                Timer {
            //                    running: true
            //                    repeat: true
            //                    interval: 2000
            //                    onTriggered: {
            //                        pathview.decrementCurrentIndex()
            //                    }
            //                }






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
