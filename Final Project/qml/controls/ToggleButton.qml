import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnToggle

    //Custom properties

    property url btnIconSource: "../../images/svg_images/menu_black_24dp.svg"
    property color btnColorDefault: "#1c1d20"// This is available in all editors.
    property color btnColorMouseHover: "#23272E"
    property color btnColorPressed: "#00a1f1"

    QtObject{
        id: internal

        property var dynamicColor: if(btnToggle.down){
                                       btnToggle.down ? btnColorPressed : btnColorDefault
                                   }else{
                                       btnToggle.hovered ? btnColorMouseHover :btnColorDefault
                                   }
    }

    implicitHeight: 60
    implicitWidth: 70

    background: Rectangle{
        id:bgBtn
        color: internal.dynamicColor

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
            height: 25
            width: 25
            fillMode: Image.PreserveAspectFit
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            antialiasing: false
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:45;width:45}
}
##^##*/
