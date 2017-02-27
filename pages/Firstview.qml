import QtQuick 2.0
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1


Item {


    Image {
        id: logo

        sourceSize.width: parent.availableWidth
        sourceSize.height: parent.availableWidth
        anchors.centerIn: parent
        anchors.verticalCenterOffset: -50
        source: "qrc:resource/bread.svg"

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

        font.pixelSize: 20

    }

    Button {
        anchors.margins: 40
        anchors.top: httBreadLabel.bottom
        anchors.left: parent.left
        anchors.right: parent.right

        width: parent.width / 4

        font.pixelSize: 25

        text: "Let's Get Started"

        Material.background: Material.LightGreen
        Material.foreground: "white"

        onClicked: {
            //                    console.log("clicked start button")
            //                    stackView.push("qrc:pages/Login.qml")
            console.log("hogehoge")
            loader.source = "qrc:pages/Login.qml"
        }

    }

}
