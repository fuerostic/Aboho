import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15


Flickable {
    id: flickable
    anchors.fill: parent

    // Custom Properties
    property color colorDefault: "#282c34"
    property color colorOnFocus: "#242831"
    property color colorMouseOver: "#2B2F38"

    QtObject{
        id: internal

        property var dynamicColor: if(textField.focus){
                                        textField.hovered ? colorOnFocus : colorDefault
                                   }else{
                                        textField.hovered ? colorMouseOver : colorDefault
                                   }
    }

    TextArea.flickable: TextArea {
        id: textField



//        QtObject{
//            id: internal

//            property var dynamicColor: if(textField.focus){
//                                            textField.hovered ? colorOnFocus : colorDefault
//                                       }else{
//                                            textField.hovered ? colorMouseOver : colorDefault
//                                       }
//        }

        implicitWidth: 300
        implicitHeight: 40
        placeholderText: qsTr("Type something")
        color: "#ffffff"
        background: Rectangle {
            color:internal.dynamicColor
            radius: 10
        }

        selectByMouse: true
        selectedTextColor: "#FFFFFF"
        selectionColor: "#ff007f"
        placeholderTextColor: "#81848c"


        wrapMode: TextArea.Wrap
    }

    ScrollBar.vertical: ScrollBar { }
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
