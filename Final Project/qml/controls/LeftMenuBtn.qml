import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button{
    id: btnLeftMenu
    text: qsTr("Left menu text")

    //Custom properties

    property url btnIconSource: "../../images/svg_images/home_black_24dp.svg"
    property color btnColorDefault: "#1c1d20"// This is available in all editors.
    property color btnColorMouseHover: "#23272E"
    property color btnColorPressed: "#00a1f1"
    property int iconHeight: 18
    property int iconWidth: 18
    property color activeMenuColor: "#55aaff"
    property color activeMenuColorRight: "#2c313c"
    property bool isActiveMenu: false


    QtObject{
        id: internal

        property var dynamicColor: if(btnLeftMenu.down){
                                       btnLeftMenu.down ? btnColorPressed : btnColorDefault
                                   }else{
                                       btnLeftMenu.hovered ? btnColorMouseHover :btnColorDefault
                                   }
    }

    implicitHeight: 60
    implicitWidth: 250

    background: Rectangle{
        id:bgBtn
        color: internal.dynamicColor

        Rectangle{
            anchors{
                top: parent.top
                left: parent.left
                bottom: parent.bottom
            }

            color: activeMenuColor
            width: 3
            visible: isActiveMenu

        }

        Rectangle{
            anchors{
                top: parent.top
                right:  parent.right
                bottom: parent.bottom
            }

            color: activeMenuColorRight
            width: 5
            visible: isActiveMenu

        }
    }

    contentItem: Item {
        anchors.fill: parent
        id: content

        Image {
            id: iconBtn
            source: btnIconSource
            anchors.leftMargin: 26
            sourceSize.height: iconHeight
            sourceSize.width: iconWidth
            height: iconHeight
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            width: iconWidth
            fillMode: Image.PreserveAspectFit
            visible: false
            antialiasing: true
        }

        ColorOverlay{
            anchors.fill: iconBtn
            source: iconBtn
            color: "#ffffff"
            anchors.verticalCenter: parent.verticalCenter
            antialiasing: true
            width: iconWidth
            height: iconHeight
        }


        Text {
            color: "#ffffff"
            text: btnLeftMenu.text
            font: btnLeftMenu.font
            anchors.verticalCenter: parent.verticalCenter
            anchors.left: parent.left
            anchors.leftMargin: 75
        }
    }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:45;width:45}
}
##^##*/
