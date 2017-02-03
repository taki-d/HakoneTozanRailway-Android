import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0


Item {
    id: page

    Material.background: Material.Green
    Material.accent: Material.LightBlue

//    Column{

//        spacing: 40
//        width: parent.width

        Label {

            id: loginlabel
            text: "Please Login"

            font.pixelSize: 30

            anchors.centerIn: parent
            anchors.verticalCenterOffset: -50

        }

//        Label {
//            id: usernamelabel
//            text: "UserName"

//            font.pixelSize: 15

//            anchors.top: loginlabel.bottom
//            anchors.topMargin: 20
//            anchors.centerIn: parent
//        }

        TextField {
            id: usernameinput

            width: parent.width

            anchors.top: usernamelabel.bottom
            anchors.centerIn: parent
            anchors.margins: 20

            placeholderText: qsTr("Enter your Username")


        }

//    }
}
