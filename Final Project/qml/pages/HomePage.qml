import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"

Item {
    Rectangle {
        id: rectangle
        color: "#393939"
        anchors.fill: parent

        Rectangle {
            id: rectangle1
            height: 229
            color: "#00000000"
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 200
            anchors.rightMargin: 45
            anchors.leftMargin: 45

            CustomImageNavButton{
                id: summaryPageButton
                x: 87
                width: 126
                height: 213
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: sentimentPageButton.left
                font.pointSize: 16
                buttonLabel: ""
                btnIconSource: "../../images/report.png"
                anchors.rightMargin: 79
                anchors.verticalCenterOffset: 0

                onClicked: {
                    btnHome.isActiveMenu = false
                    btnSummarize.isActiveMenu = true
                    btnSentiment.isActiveMenu = false
                    btnWordCloud.isActiveMenu = false
                    btnSettings.isActiveMenu = false

                    pagesHomeView.visible = false
                    pagesSummarizeView.visible = true
                    pagesSentimentView.visible = false
                    pagesWordCloudView.visible = false
                    pagesSettingsView.visible = false



                }

            }

            CustomImageNavButton {
                id: sentimentPageButton
                x: 270
                width: 126
                height: 213
                anchors.verticalCenter: parent.verticalCenter
                btnIconSource: "../../images/feedback.png"
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenterOffset: 0

                onClicked: {

                    btnHome.isActiveMenu = false
                    btnSummarize.isActiveMenu = false
                    btnSentiment.isActiveMenu = true
                    btnWordCloud.isActiveMenu = false
                    btnSettings.isActiveMenu = false

                    pagesHomeView.visible = false
                    pagesSummarizeView.visible = false
                    pagesSentimentView.visible = true
                    pagesWordCloudView.visible = false
                    pagesSettingsView.visible = false

                }
            }

            CustomImageNavButton {
                id: wordCloudPageButton
                x: 270
                width: 126
                height: 213
                anchors.verticalCenter: parent.verticalCenter
                btnIconSource: "../../images/cloud.png"
                anchors.horizontalCenterOffset: 213
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.verticalCenterOffset: 0

                onClicked: {

                    btnHome.isActiveMenu = false
                    btnSummarize.isActiveMenu = false
                    btnSentiment.isActiveMenu = false
                    btnWordCloud.isActiveMenu = true
                    btnSettings.isActiveMenu = false

                    pagesHomeView.visible = false
                    pagesSummarizeView.visible = false
                    pagesSentimentView.visible = false
                    pagesWordCloudView.visible = true
                    pagesSettingsView.visible = false

                }
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
    D{i:0;autoSize:true;height:480;width:800}
}
##^##*/
