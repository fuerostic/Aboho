import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"


Item {
    id: item1

    property url sentiImage: "../../images/svg_images/sentiment_satisfied_black_24dp.svg"


    Rectangle {
        id: bgSenti
        color: "#393939"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Row {
            id: row
            anchors.fill: parent

            Label {
                id: sentiLabel
                color: "#e6e8e9"
                text: qsTr("Sentiment analysis page")
                anchors.left: parent.left
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 56
                anchors.topMargin: 22
                font.pointSize: 16
            }

            Rectangle {
                id: textInputBorder
                color: "#5b687d"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 262
                anchors.topMargin: 65
                anchors.rightMargin: 45
                anchors.leftMargin: 45
                radius: 10

                CustomTextField{
                    id: sentiField
                    x: 45
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 10
                    anchors.topMargin: 15
                    anchors.bottomMargin: 15
                    anchors.leftMargin: 10

                }
            }

            Rectangle {
                id: fromTxtFileArea
                width: 335
                height: 46
                color: "#00000000"
                anchors.left: parent.left
                anchors.top: textInputBorder.bottom
                anchors.leftMargin: 45
                anchors.topMargin: 20

                TopBarButton{
                    y: 11
                    width: 25
                    height: 25
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.rightMargin: 137
                    anchors.leftMargin: 162
                    btnIconSource: "../../images/svg_images/open_icon.svg"
                    btnColorDefault: "#5b687d"
                    antialiasing: false
                    radiusBtn: 10


                }

                Label {
                    id: label
                    color: "#ffffff"
                    text: qsTr("Enter Text from .txt file")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 282
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 15
                    anchors.topMargin: 15
                }
            }

            CustomButton{
                id: sentiButton
                text: "Analize sentiment"
                anchors.left: parent.left
                anchors.top: fromTxtFileArea.bottom
                anchors.topMargin: 10
                anchors.leftMargin: 45
                colorDefault: "#5b687d"
                width: 150
                height: 40

                onClicked:{


                }
            }

            CustomImageButton {
                id: resetButton
                x: 720
                anchors.right: parent.right
                anchors.top: parent.top
                btnColorDefault: "#00000000"
                btnIconSource: "../../images/svg_images/restart_alt_black_24dp.svg"
                anchors.topMargin: 30
                anchors.rightMargin: 45
            }

            Rectangle {
                id: rectangle
                width: 570
                height: 105
                color: "#00000000"
                anchors.left: parent.left
                anchors.top: sentiButton.bottom
                anchors.topMargin: 9
                anchors.leftMargin: 45

                CustomTextField {
                    id: outputText
                    x: 50
                    y: 20
                    width: 703
                    height: 293
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 150
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 22
                    anchors.topMargin: 20
                    enabled: false
                }

                Image {
                    id: sentimentImage
                    y: 13
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    source: sentiImage
                    anchors.bottomMargin: 10
                    anchors.leftMargin: 436
                    anchors.topMargin: 10
                    anchors.rightMargin: 10
                    fillMode: Image.PreserveAspectFit

                }
            }





        }



    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:640}D{i:10}D{i:12}D{i:13}D{i:11}
}
##^##*/
