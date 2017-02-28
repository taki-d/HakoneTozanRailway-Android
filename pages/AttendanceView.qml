import QtQuick 2.0
import QtQuick.Controls 2.1

Page {

    signal changeScreen(string src)

    id: page

    SwipeView{
        id: swipeview
    }


    header: TabBar {
        id: tabbar
        currentIndex: swipeview.currentIndex

        TabButton {
            text: "Profile"
        }
        TabButton {
            text: "Second"
        }
    }


}
