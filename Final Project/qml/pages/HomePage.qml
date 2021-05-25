import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: rectangle
        color: "#55aaff"
        anchors.fill: parent

        Label {
            id: label
            x: 387
            y: 214
            text: qsTr("Home Page")
            anchors.verticalCenter: parent.verticalCenter
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.verticalCenterOffset: -204
            anchors.horizontalCenterOffset: -225
            anchors.horizontalCenter: parent.horizontalCenter
            font.pointSize: 16
        }

        Rectangle {
            id: rectangle1
            x: 34
            y: 124
            width: 562
            height: 229
            color: "#00000000"

            TextField {
                id: textNameField
                x: 81
                y: 28
                placeholderText: qsTr("Text Field")
            }

            Button {
                id: submitButton
                x: 328
                y: 28
                text: qsTr("Button")

                onClicked: {
                    backend.welcomeText(textNameField.text)
                }
            }

            Label {
                id: labelName
                x: 239
                y: 135
                width: 119
                height: 37
                text: qsTr("Label")
            }
        }
    }

    Connections{
        target: backend

        function onSetName(name){
            labelName.text = name
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}
}
##^##*/
