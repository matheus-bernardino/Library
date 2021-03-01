import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Page {
    id: removePage
    onActiveFocusChanged: {
        comboBox.model = bk.model
    }

    ComboBox {
        id: comboBox
        height: 29
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 60
        anchors.rightMargin: 30
        anchors.leftMargin: 30

        model : bk.model
    }

    RoundButton {
        id: button
        text: qsTr("Remover Livro")
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: comboBox.bottom
        anchors.rightMargin: 30
        anchors.leftMargin: 30
        anchors.topMargin: 30
        onClicked: {
            bk.isbn = comboBox.currentValue
            bk.removeBook()
            result.text = bk.add_result
            bk.getBooks()
            comboBox.model = bk.model
        }

    }
    Label {
        id: result
        height: 17
        text: ""
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: button.bottom
        horizontalAlignment: Text.AlignHCenter
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.topMargin: 20
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:1}
}
##^##*/
