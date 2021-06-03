import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15


//Flickable {
//    id: flickable
//    anchors.fill: parent

//    // Custom Properties
//    property color colorDefault: "#282c34"
//    property color colorOnFocus: "#242831"
//    property color colorMouseOver: "#2B2F38"

//    QtObject{
//        id: internal

//        property var dynamicColor: if(textField.focus){
//                                        textField.hovered ? colorOnFocus : colorDefault
//                                   }else{
//                                        textField.hovered ? colorMouseOver : colorDefault
//                                   }
//    }

//    TextArea.flickable: TextArea {
//        id: textField



////        QtObject{
////            id: internal

////            property var dynamicColor: if(textField.focus){
////                                            textField.hovered ? colorOnFocus : colorDefault
////                                       }else{
////                                            textField.hovered ? colorMouseOver : colorDefault
////                                       }
////        }

//        implicitWidth: 300
//        implicitHeight: 40
//        placeholderText: qsTr("Type something")
//        color: "#ffffff"
//        background: Rectangle {
//            color:internal.dynamicColor
//            radius: 10
//        }

//        selectByMouse: true
//        selectedTextColor: "#FFFFFF"
//        selectionColor: "#ff007f"
//        placeholderTextColor: "#81848c"


//        wrapMode: TextArea.Wrap
//    }

//    ScrollBar.vertical: ScrollBar { }
//}


//Flickable{

//    Rectangle{
//        color: "#282c34"
//        anchors.fill: parent
//        anchors.rightMargin: 10
//        anchors.leftMargin: 10
//        anchors.bottomMargin: 15
//        anchors.topMargin: 15
//        visible: root.focus
//        radius: 10


//        TextEdit.flickable: TextEdit {
//            id: textEdit
//            //text: qsTr("Text Edit")
//            anchors.left: parent.left
//            anchors.right: parent.right
//            anchors.top: parent.top
//            anchors.bottom: parent.bottom
//            fontpixelSize1212
//            wrapMode: Text.Wrap
//            clip: true
//            anchors.topMargin: 10
//            anchors.bottomMargin: 10
//            anchors.rightMargin: 10
//            anchors.leftMargin: 10



//            property string placeholderText: "Enter text here..."
//            color: "#ffffff"

//            Text {
//                text: textEdit.placeholderText
//                color: "#aaa"
//                visible: !textEdit.text
//            }
//        }

//    }

//}

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
            text: textEdit.placeholderText
            color: "#aaa"
            visible: !textEdit.text
        }
    }

}


//ScrollView{
//    id: textScrollView
//    anchors.fill: parent


//    TextField {



//}



/*##^##
Designer {
    D{i:0;height:480;width:800}
}
##^##*/
