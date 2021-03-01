import QtQuick 2.9
import QtQuick.Window 2.2
import QtQuick.Controls 2.5
import QtQuick.Layouts 1.3

Page {
    id: page

    TextField {
        id: nome
        height: 29
        opacity: 1
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: isbn.bottom
        font.bold: true
        renderType: Text.QtRendering
        anchors.rightMargin: 30
        anchors.leftMargin: 30
        anchors.topMargin: 10
        placeholderText: qsTr("Nome do Livro")
    }

    TextField {
        id: autor
        height: 29
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: nome.bottom
        font.bold: true
        anchors.rightMargin: 30
        anchors.leftMargin: 30
        anchors.topMargin: 10
        placeholderText: qsTr("Autor do Livro")
    }

    ComboBox {
        id: comboBox
        y: 174
        height: 40
        anchors.left: parent.left
        anchors.right: parent.right

        anchors.rightMargin: 30
        anchors.leftMargin: 30
        anchors.topMargin: 10
        model: [ "Biografia", "Comportamento", "Conto", "Ficção Científica", "Fantasia" ]
    }

    TextField{
        id: isbn
        height: 29
        text: ""
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        padding: 6
        font.bold: true
        anchors.rightMargin: 30
        anchors.leftMargin: 30
        anchors.topMargin: 50
        placeholderText: qsTr("ISBN")
        inputMethodHints:  Qt.ImhDigitsOnly
        validator: IntValidator {
                bottom: 0
                top: 2147483647
         }
    }

    RoundButton {
        id: roundButton
        x: 105
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: comboBox.bottom
        anchors.bottom: parent.bottom
        anchors.topMargin: 20
        anchors.bottomMargin: 210
        anchors.rightMargin: 30
        anchors.leftMargin: 30
        text: "Adicionar Livro"
        onClicked: {
            bk.nome = nome.text
            bk.autor = autor.text
            bk.categoria = comboBox.currentValue
            bk.isbn = isbn.text
            bk.saveBook()
            bk.getBooks()
            result.text = bk.add_result
        }
    }

    Label {
        id: result
        height: 17
        text: ""
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: roundButton.bottom
        horizontalAlignment: Text.AlignHCenter
        anchors.rightMargin: 20
        anchors.leftMargin: 20
        anchors.topMargin: 20
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
