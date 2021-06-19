import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"



Item {


    Rectangle {
        id: bgSummary
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




        Rectangle {
            id: conntainerProrgess

            property string progress: "loading"
            opacity: 1
            color: "#00000000"
            anchors.fill: parent
            visible: false
            ProgressBar {
                id: progressBar
                anchors.top: parent.top
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 400
                value: 50

                ProgressBar {
                    id: control
                    opacity: 1
                    value: 0.5
                    padding: 2

                    background: Rectangle {
                        implicitWidth: 200
                        implicitHeight: 6
                        color: "#e6e6e6"
                        radius: 3
                    }

                    contentItem: Item {
                        implicitWidth: 200
                        implicitHeight: 4

                        Rectangle {
                            width: control.visualPosition * parent.width
                            height: parent.height
                            radius: 2
                            color: "#17a81a"
                        }
                    }
                }
            }

            Label {
                id: progressLabel
                text: conntainerProrgess.progress
                anchors.verticalCenter: parent.verticalCenter
                anchors.top: progressBar.bottom
                horizontalAlignment: Text.AlignHCenter
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 20
            }





        }

        Row {
            id: row
            anchors.fill: parent

            Label {
                id: summaryLabel
                color: "#e6e8e9"
                text: qsTr("পাঠ্য সংক্ষিপ্তকরণ")
                anchors.left: parent.left
                anchors.top: parent.top
                horizontalAlignment: Text.AlignHCenter
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
                anchors.bottomMargin: 262
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
                        id: textEdit
                        //text: qsTr("Text Edit")
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
                            text: textEdit.placeholderText
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
                    width: 25
                    height: 25
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.verticalCenterOffset: 5
                    anchors.topMargin: 15
                    anchors.leftMargin: 283
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
                    text: qsTr("এখানে পাঠ্য প্রবেশ করুন .txt ফাইল হতে")
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
                id: summarizeButton
                text: "সংক্ষিপ্ত করুন"
                anchors.left: parent.left
                anchors.top: fromTxtFileArea.bottom
                font.pointSize: 12
                anchors.topMargin: 10
                anchors.leftMargin: 45
                colorDefault: "#5b687d"
                width: 150
                height: 40

                onClicked:{

                    summarizeButton.text = "প্রক্রিয়াধীন"
                    summarizeButton.colorDefault = "#ff0000"
                    bgSummary.delay(10, function() {


                            })

                    backend.summaryCreate(textEdit.text.toString())
                }
            }

            CustomImageButton {
                id: resetButton
                x: 720
                anchors.right: parent.right
                anchors.top: parent.top
                btnColorDefault: "#00000000"
                btnIconSource: "../../images/svg_images/restart_alt_black_24dp.svg"
                anchors.topMargin: 32
                anchors.rightMargin: 45

                onClicked: {

                    summarizeButton.text = "সংক্ষিপ্ত করুন"
                    summarizeButton.colorDefault = "#5b687d"
                    textEdit.text = ""
                }
            }

            CustomImageButton {
                id: copyButton
                x: 720
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 80
                anchors.topMargin: 32
                btnIconSource: "../../images/svg_images/content_copy_black_24dp.svg"
                btnColorDefault: "#00000000"

                onClicked: {
                    backend.textCopy(textEdit.text.toString())
                }
            }

        }


    }


    Connections{
        target: backend

        function onGetInput(text){


            summarizeButton.text = "সম্পন্ন"
            summarizeButton.colorDefault = "#00ff00"

            bgSummary.delay(5000, function() {
                summarizeButton.text = "সংক্ষিপ্ত করুন"
                summarizeButton.colorDefault = "#5b687d"

                    })

            textEdit.text = text
        }


        function onCopyText(text){



        }

        function onOpenTxtFile(text){
            textEdit.text = text
        }


    }



}




/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.9;height:600;width:1000}
}
##^##*/
