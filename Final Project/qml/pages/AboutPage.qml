import QtQuick 2.0
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: rectangle
        color: "#393939"
        anchors.fill: parent
        
        Rectangle {
            id: rectangle1
            color: "#00000000"
            anchors.fill: parent
            
            Label {
                id: label
                height: 43
                color: "#e6e8e9"
                text: qsTr("আবহ আপ্লিকেশন পরিচিতি")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                font.pointSize: 28
                anchors.topMargin: 45
                anchors.leftMargin: 100
                anchors.rightMargin: 100
            }
            
            Text {
                id: text1
                height: 320
                color: "#ffffff"
                text: qsTr("মাতৃভাষা বাংলা আমাদের জীবন এর একটি অবিচ্ছেদ্য নাম। প্রতিদিন নানা কাজে আমরা বাংলা ব্যাবহার করে থাকি। বিভিন্ন ডিজিটাল কাজে বাংলার ব্যাবহার দিন দিন বেড়ে চলেছে। কিন্তু প্রয়োজনীয় কাজগুলতে ব্যাবহারযোগ্য বাংলা অ্যাপ্লিকেশন এর সংঝা অনেক কম। 'আবহ' অ্যাপ্লিকেশন এই ডিজিটাল পথচলায় বাংলার আবহকে নতুন মাত্রা দেবার প্রয়াস রাখে। এই অ্যাপ্লিকেশন ব্যাবহার করে বাংলা বাক্যের সংক্ষিপ্তকরন, অনুভূতি বিশ্লেষণ এবং পরীক্ষামূলক শব্দ মেঘ তৈরি করতে সাহায্য করবে। ")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                font.pixelSize: 30
                wrapMode: Text.Wrap
                anchors.topMargin: 145
                anchors.rightMargin: 136
                anchors.leftMargin: 108
            }
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:768;width:1366}
}
##^##*/
