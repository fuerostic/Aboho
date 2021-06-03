import QtQuick 2.0
import QtQuick.Controls 2.15
import "../controls"

Item {
    id: item1

    Rectangle {
        id: rectangle
        color: "#383e4b"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Label {
            id: label
            color: "#eceef0"
            text: qsTr("Summary output")
            anchors.left: parent.left
            anchors.top: parent.top
            horizontalAlignment: Text.AlignHCenter
            verticalAlignment: Text.AlignVCenter
            anchors.leftMargin: 45
            anchors.topMargin: 20
            font.pointSize: 16
        }

        CustomTextField{

            id:outputText
            x: 50
            y: 85
            width: 703
            height: 228
            anchors.rightMargin: 45
            anchors.leftMargin: 45
            anchors.bottomMargin: 163
            anchors.topMargin: 75
            enabled: false

        }

        CustomButton{
            x: 589
            width: 166
            height: 40
            anchors.right: parent.right
            anchors.top: outputText.bottom
            anchors.rightMargin: 45
            anchors.topMargin: 108
            colorDefault: "#5d6678"
            text: "Return"

            onClicked: {
                pagesHomeView.visible = false
                pagesSummarizeView.visible = true
                pagesSentimentView.visible = false
                pagesWordCloudView.visible = false
                pagesSettingsView.visible = false
                pagesSummaryOutputView.visible = false
                pagesSentimentOutputView = false
                pagesWordCloudOutputView = false
            }

        }

        Rectangle {
            id: rectangle1
            width: 361
            height: 49
            color: "#00000000"
            anchors.left: parent.left
            anchors.top: outputText.bottom
            anchors.leftMargin: 45
            anchors.topMargin: 56

            Label {
                id: label1
                y: 16
                color: "#ffffff"
                text: qsTr("Save in .txt file")
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 0
            }

            CustomImageButton{
                x: 100
                y: 8
                anchors.verticalCenter: label1.verticalCenter
                anchors.top: parent.top
                btnIconSource: "../../images/svg_images/save_icon.svg"
                btnColorDefault: "#00000000"
                anchors.topMargin: 8

            }
        }

        CustomImageButton{
            id: customImageButton
            x: 720
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.rightMargin: 45
            anchors.topMargin: 32
            btnColorDefault: "#00000000"
            btnIconSource: "../../images/svg_images/content_copy_black_24dp.svg"

        }
    }


}

/*##^##
Designer {
    D{i:0;autoSize:true;height:480;width:800}D{i:2}D{i:4}D{i:6}D{i:5}D{i:8}
}
##^##*/
