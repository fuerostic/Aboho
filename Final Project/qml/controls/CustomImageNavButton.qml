import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnNavCustom

    //Custom properties

    property url btnIconSource: "../../images/feedback.png"
    property color btnColorDefault: "#1c1d20"// This is available in all editors.
    property color btnColorMouseHover: "#23272E"
    property color btnColorPressed: "#00a1f1"

    property string buttonLabel: "button"

    QtObject{
        id: internal

        property var dynamicColor: if(btnNavCustom.down){
                                       btnNavCustom.down ? btnColorPressed : btnColorDefault
                                   }else{
                                      btnNavCustom.hovered ? btnColorMouseHover :btnColorDefault
                                   }
    }



    height: 35
    width: 35

    background: Rectangle{
        id:bgBtn
        color: internal.dynamicColor
        radius: 10

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 80
            width: 80
            fillMode: Image.PreserveAspectFit
        }

        ColorOverlay{
            width: 25
            height: 25
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: false
        }
        Label {
            id: labelbutton
            height: 30
            color: "#ffffff"
            text: qsTr(btnNavCustom.buttonLabel)
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: iconBtn.bottom
            horizontalAlignment: Text.AlignHCenter
            wrapMode: Text.Wrap
            anchors.leftMargin: 10
            anchors.topMargin: 20
            anchors.rightMargin: 10



        }
    }
}

/*##^##
Designer {
    D{i:0;height:300;width:145}D{i:5}
}
##^##*/
