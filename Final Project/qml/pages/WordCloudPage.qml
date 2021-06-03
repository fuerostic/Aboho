import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"


Item {
    id: item1

    property url cloudImage: "../../images/svg_images/sentiment_satisfied_black_24dp.svg"


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
                text: qsTr("Word Cloud Page")
                anchors.left: parent.left
                anchors.top: parent.top
                horizontalAlignment: Text.AlignLeft
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
                anchors.bottomMargin: 500
                anchors.topMargin: 65
                anchors.rightMargin: 45
                anchors.leftMargin: 45
                radius: 10


                Rectangle{
                    color: "#282c34"
                    anchors.fill: parent
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 15
                    anchors.topMargin: 15
                    visible: root.focus
                    radius: 10


                    TextEdit {
                        id: cloudfield
                        //text: qsTr("Enter text here")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 12
                        wrapMode: Text.Wrap
                        clip: true
                        anchors.topMargin: 10
                        anchors.bottomMargin: 10
                        anchors.rightMargin: 10
                        anchors.leftMargin: 10



                        property string placeholderText: "Enter text here..."
                        color: "#ffffff"

                        Text {
                            text: sentifield.placeholderText
                            color: "#aaa"
                            visible: !textEdit.text
                        }
                    }

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
                    id: fileOpenbutton
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

                    onClicked: {
                        backend.fileOpen("")
                    }


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
                text: "Submit"
                anchors.left: fromTxtFileArea.right
                anchors.right: parent.right
                anchors.top: textInputBorder.bottom
                anchors.rightMargin: 90
                anchors.leftMargin: 20
                anchors.topMargin: 25
                colorDefault: "#5b687d"
                height: 40

                onClicked:{

                    backend.wordParsing(cloudfield.text)
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

                onClicked: {

                    cloudfield.text = ""


                }

            }

            Image {
                id: imageOutput
                width: 204
                anchors.left: parent.left
                anchors.top: fromTxtFileArea.bottom
                anchors.bottom: parent.bottom
                source: item1.cloudImage
                anchors.bottomMargin: 0
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.leftMargin: 100
                anchors.topMargin: 17
                fillMode: Image.PreserveAspectFit
                visible: false
            }



        }


        Connections{
            target: backend

            function onGetWordCloudInput(text){

                item1.cloudImage= "../../"+text

                imageOutput.visible = true
            }


            function onOpenTxtFile(text){
                cloudfield.text = text
            }



        }

    }
}


/*##^##
Designer {
    D{i:0;autoSize:true;height:600;width:800}D{i:11}D{i:13}
}
##^##*/
