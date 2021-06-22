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
                text: qsTr("মাতৃভাষা বাংলা আমাদের জীবনের একটি অবিচ্ছেদ্য অংশ। প্রতিদিন নানা কাজে আমরা বাংলা ব্যবহার করে থাকি। বিভিন্ন ডিজিটাল কাজে বাংলার ব্যবহার দিন দিন বেড়েই চলেছে। কিন্তু প্রয়োজনীয় কাজগুলোতে ব্যবহারযোগ্য বাংলা অ্যাপ্লিকেশন এর সংখ্যা খুবই কম। 'আবহ' অ্যাপ্লিকেশন এই ডিজিটাল পথচলায় বাংলার চর্চার আবহকে নতুন মাত্রা দেবার প্রয়াস রাখে। এই অ্যাপ্লিকেশন ব্যবহার করে বাংলা বাক্যের সংক্ষিপ্তকরন, অনুভূতি বিশ্লেষণ এবং পরীক্ষামূলক শব্দ মেঘ তৈরি করতে সাহায্য করবে। এটি একটি পরীক্ষামূলক প্রয়াস, তাই আমাদের ভুল ত্রুটি সমূহ ক্ষমাসুন্দর দৃষ্টিতে দেখার জন্যে অনুরোধ করা হল। আপনাদের এই অ্যাপ সম্পর্কিত কোনো অভিযোগ/পরামর্শ থাকলে আমাদেরকে মেইলের মাধ্যমে তা জানাতে পারেন। ধন্যবাদ।

মেইলের ঠিকানা :
fuad1707033@stud.kuet.ac.bd
gomes1707054@stud.kuet.ac.bd")
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
