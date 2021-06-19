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

        Timer {
            id: timer
        }

        function delay(delayTime, cb) {
            timer.interval = delayTime;
            timer.repeat = false;
            timer.triggered.connect(cb);
            timer.start();
        }


        Row {
            id: row
            anchors.fill: parent

            Label {
                id: sentiLabel
                color: "#e6e8e9"
                text: qsTr("শব্দ মেঘ তৈরিকরণ")
                anchors.left: parent.left
                anchors.top: parent.top
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 56
                anchors.topMargin: 20
                font.pointSize: 26
            }

            Rectangle {
                id: textInputBorder
                color: "#5b687d"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 450
                anchors.topMargin: 80
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
                        //text: qsTr("এখানে পাঠ্য প্রবেশ করুন")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        font.pixelSize: 16
                        wrapMode: Text.Wrap
                        clip: true
                        anchors.topMargin: 10
                        anchors.bottomMargin: 10
                        anchors.rightMargin: 10
                        anchors.leftMargin: 10



                        property string placeholderText: "এখানে পাঠ্য প্রবেশ করুন..."
                        color: "#ffffff"

                        Text {
                            text: cloudfield.placeholderText
                            color: "#aaa"
                            visible: !cloudfield.text
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
                    anchors.verticalCenterOffset: 5
                    anchors.rightMargin: 52
                    anchors.leftMargin: 248
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
                    text: qsTr("পাঠ্য প্রবেশ করুন .txt ফাইল হতে")
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    font.pointSize: 12
                    anchors.rightMargin: 282
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 15
                    anchors.topMargin: 15
                }
            }

            CustomButton{
                id: sentiButton
                width: 200
                text: "প্রবেশ করুন"
                anchors.left: fromTxtFileArea.right
                anchors.top: textInputBorder.bottom
                font.pointSize: 12
                anchors.leftMargin: 20
                anchors.topMargin: 25
                colorDefault: "#5b687d"
                height: 40

                onClicked:{
                    sentiButton.text = "প্রক্রিয়াধীন"
                    sentiButton.colorDefault = "#ff0000"
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

                    sentiButton.text = "প্রবেশ করুন"
                    sentiButton.colorDefault = "#5b687d"

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

                sentiButton.text = "সম্পন্ন"
                sentiButton.colorDefault = "#00ff00"

                bgSenti.delay(5000, function() {
                    sentiButton.text = "প্রবেশ করুন"
                    sentiButton.colorDefault = "#5b687d"

                        })

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
    D{i:0;autoSize:true;height:600;width:800}
}
##^##*/
