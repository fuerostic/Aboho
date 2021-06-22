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
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 50
            anchors.rightMargin: 45
            anchors.leftMargin: 45

            CustomImageNavButton{
                id: summaryPageButton
                x: 87
                width: 200
                height: 213
                anchors.verticalCenter: parent.verticalCenter
                anchors.right: sentimentPageButton.left
                anchors.rightMargin: 200
                font.pointSize: 16
                buttonLabel: "সংক্ষিপ্তকরন"
                btnIconSource: "../../images/report.png"
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
                width: 200
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.horizontalCenter: parent.horizontalCenter
                anchors.topMargin: 9
                anchors.bottomMargin: 8
                font.pointSize: 16
                buttonLabel: "অনুভূতি বিশ্লেষণ "
                btnIconSource: "../../images/feedback.png"

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
                width: 200
                anchors.left: sentimentPageButton.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.leftMargin: 200
                anchors.topMargin: 9
                anchors.bottomMargin: 8
                font.pointSize: 16
                buttonLabel: "শব্দ মেঘ "
                btnIconSource: "../../images/cloud.png"

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

        Text {
            id: welcomeText
            height: 72
            color: "#ffffff"
            text: qsTr("আবহ অ্যাপ্লিকেশন এ আপনাকে স্বাগতম!")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            font.pixelSize: 45
            horizontalAlignment: Text.AlignHCenter
            font.italic: false
            font.bold: true
            anchors.topMargin: 140
            anchors.leftMargin: 405
            anchors.rightMargin: 405
        }

        Text {
            id: welcomeText1
            height: 102
            color: "#ffffff"
            text: qsTr("বাংলা ভাষা ব্যবহারের অগ্রযাত্রায় আপনার যাত্রা শুরু হোক এখানে")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            font.pixelSize: 45
            horizontalAlignment: Text.AlignHCenter
            anchors.rightMargin: 150
            font.bold: true
            anchors.leftMargin: 150
            anchors.topMargin: 260
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
    D{i:0;autoSize:true;formeditorZoom:0.66;height:768;width:1366}
}
##^##*/
