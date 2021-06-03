import QtQuick 2.4
import QtQuick.Controls 2.15
import "../controls"


LoadingPageForm {
    Rectangle {
        id: conntainerProrgess
        anchors.fill: parent

        property string progress: "loading"
        ProgressBar {
            id: progressBar
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.topMargin: 244
            anchors.bottomMargin: 230
            anchors.leftMargin: 283
            anchors.rightMargin: 317
            value: 50
            
            ProgressBar {
                id: control
                value: 0.5
                padding: 2
            
                background: Rectangle {
                    implicitWidth: 200
                    implicitHeight: 6
                    color: "#e6e6e6"
                    radius: 3
                }
            
                contentItem: Item {
                    implicitWidth: 200
                    implicitHeight: 4
            
                    Rectangle {
                        width: control.visualPosition * parent.width
                        height: parent.height
                        radius: 2
                        color: "#17a81a"
                    }
                }
            }
        }

        Label {
            id: progressLabel
            text: conntainerProrgess.progress
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: progressBar.bottom
            horizontalAlignment: Text.AlignHCenter
            anchors.rightMargin: 402
            anchors.leftMargin: 368
            anchors.topMargin: 19
        }
        
        
        


    }
    
    Connections{
        target: backend-progres 

        function onGetProgress(text,val){
            progressLabel.text = text
            progressBar.value = val
        }
        
    }
}
