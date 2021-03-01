import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

ApplicationWindow {
    id: window
    width: 320
    height: 480
    visible: true
    title: qsTr("Biblioteca")

    SwipeView {
        id: sw
        anchors.fill: parent
        currentIndex: tab.currentIndex

        AddBookPage {
            id: addPage
        }

        RemoveBookPage {
            id: removePage
        }

    }

    TabBar {
        id: tab
        currentIndex: sw.currentIndex
            TabButton {
                id: addButton
                x: 0
                y: 0
                width: 160
                height: 40
                text: qsTr("Adicionar livro")
            }

            TabButton {
                id: removeButton
                x: 160
                y: 0
                width: 160
                height: 40
                text: qsTr("Remover Livro")
            }
    }
}
