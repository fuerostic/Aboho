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

            Row {
                id: row
                anchors.fill: parent

                Label {
                    id: summaryLabel
                    color: "#e6e8e9"
                    text: qsTr("Summarize page")
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
                        id: summarizeField
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
                        text: qsTr("Enter Text from Txt file")
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
                    id: summarizeButton
                    text: "Summarize"
                    anchors.left: parent.left
                    anchors.top: fromTxtFileArea.bottom
                    anchors.topMargin: 10
                    anchors.leftMargin: 45
                    colorDefault: "#5b687d"
                    width: 150
                    height: 40

                    onClicked:{
                        pagesHomeView.visible = false
                        pagesSummarizeView.visible = false
                        pagesSentimentView.visible = false
                        pagesWordCloudView.visible = false
                        pagesSettingsView.visible = false
                        pagesSummaryOutputView.visible = true
                        pagesSentimentOutputView = false
                        pagesWordCloudOutputView = false

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
            }





     }
}
}




/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:600;width:1000}D{i:4}
}
##^##*/
