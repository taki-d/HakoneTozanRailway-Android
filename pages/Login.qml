import QtQuick 2.0
import QtQuick.Controls 2.0
import QtQuick.Layouts 1.1
import QtQuick.Controls.Styles 1.4
import QtQuick.Controls.Material 2.0


Item {
    id: page

    Material.background: Material.Green
    Material.accent: Material.LightBlue

    signal clickedLogin(string Password,string Username)

//    Column{

//        spacing: 40
//        width: parent.width

        Label {

            id: loginlabel
            text: "Please Login"
            x: parent.width * 0.1
            y: parent.height * 0.3

            font.pixelSize: 30

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

            width: parent.width * 0.8
            x: parent.width * 0.1
//            anchors.top: usernamelabel.bottom

            anchors.top: loginlabel.bottom
            anchors.margins: 50

            placeholderText: qsTr("Enter your Username")


        }

        TextField {
            id: passwordinput

            width: parent.width * 0.8
            x: parent.width * 0.1

            echoMode: TextInput.Password
            passwordCharacter: "*"

            placeholderText: qsTr("Enter your Password")

            anchors.topMargin: 40
            anchors.top: usernameinput.bottom

        }

        Button {
            id: loginButton
            text: "Login"

            width: parent.width * 0.6
            x: parent.width * 0.2

            Material.background: Material.Orange

            anchors.topMargin: 150
            anchors.top: passwordinput.bottom

            onClicked: {
                console.log("Login.qml: Clicked Login Button")

                page.clickedLogin(passwordinput.text,usernameinput.text)
                networkSignalSlot.slotTest()
            }

        }

        Connections {
            target: networkSignalSlot
            onSignalTest: {
                console.log("signalllll");
            }
        }

//    }
}
