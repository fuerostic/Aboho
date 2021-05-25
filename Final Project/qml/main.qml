import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "controls"

Window {
    id: mainWindow
    width: 1366
    height: 768
    minimumHeight: 500
    minimumWidth: 800
    visible: true
    color: "#00000000"


    //remove tiitle bar

    flags: Qt.Window | Qt.FramelessWindowHint


    //properties
    property int windowStatus: 0
    property int windowMargin: 10


    //internal function
    QtObject{
        id:internal

        function resetResizeBorders(){
            resizeLeft.visible = true
            resizeRight.visible = true
            resizeBottom.visible = true
            resizeTop.visible = true
        }

        function maximizeRestore(){
            if(windowStatus==0){
                windowStatus = 1
                windowMargin =0
                mainWindow.showMaximized()

                //resize visibility

                resizeLeft.visible = false
                resizeRight.visible = false
                resizeBottom.visible = false
                resizeTop.visible = false

                maximizeBtn.btnIconSource = "../images/svg_images/restore_icon.svg"

            }else{
                windowStatus =0
                windowMargin =10
                mainWindow.showNormal()

                //resize visibility

                resetResizeBorders()

                maximizeBtn.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function ifMaximizedWindowRestore(){
            if(windowStatus==1){
                mainWindow.showNormal()
                windowStatus=0
                windowMargin =10

                //resize visibility

                resetResizeBorders()
                maximizeBtn.btnIconSource = "../images/svg_images/maximize_icon.svg"
            }
        }

        function restoreMargin(){
            windowStatus =0
            windowMargin =10

            //resize visibility

            resetResizeBorders()

            maximizeBtn.btnIconSource = "../images/svg_images/maximize_icon.svg"
        }
    }


    title: qsTr("New App")

    Rectangle {
        id: bg
        color: "#2c313c"
        anchors.fill: parent
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        z:1

        Rectangle {
            id: appContainer
            color: "#00000000"
            border.color: "#353b48"
            border.width: 1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 1
            anchors.leftMargin: 1
            anchors.bottomMargin: 1
            anchors.topMargin: 1

            Rectangle {
                id: topBar
                height: 60
                color: "#1c1d20"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0

                ToggleButton{
                    onClicked: animationMenu.running = true

                }

                //                Button {
                //                    id: toggleButton
                //                    width: 70
                //                    height: 60
                //                    text: qsTr("Button")
                //                    anchors.left: parent.left
                //                    anchors.top: parent.top
                //                    anchors.leftMargin: 0
                //                    anchors.topMargin: 0
                //                }

                Rectangle {
                    id: topBarDescription
                    x: 89
                    y: 33
                    height: 25
                    color: "#282c34"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 70
                    anchors.bottomMargin: 0

                    Label {
                        id: labelTopInfo
                        color: "#c2c2c2"
                        text: qsTr("Application Description")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                        anchors.bottomMargin: 4
                        anchors.topMargin: 5
                    }

                    Label {
                        id: labelRightInfo
                        color: "#c2c2c2"
                        text: qsTr("Home")
                        anchors.left: labelTopInfo.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 10
                        anchors.leftMargin: 0
                        anchors.topMargin: 0
                    }
                }

                Rectangle {
                    id: titleBar
                    height: 35
                    color: "#00000000"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 105
                    anchors.leftMargin: 70
                    anchors.topMargin: 0

                    DragHandler {
                        onActiveChanged: if(active){
                                             mainWindow.startSystemMove()
                                             internal.ifMaximizedWindowRestore()
                                         }
                    }

                    Image {
                        id: iconApp
                        width: 28
                        anchors.left: parent.left
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        source: "../images/logos_white.png"
                        anchors.leftMargin: 5
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit
                        antialiasing: false
                    }

                    Label {
                        id: label
                        color: "#c6c6c6"
                        text: qsTr("My application title")
                        anchors.left: iconApp.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 13
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: rowBtns
                    x: 873
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.rightMargin: 0
                    anchors.topMargin: 0

                    TopBarButton{
                        id: minimizeBtn
                        onClicked: {
                            mainWindow.showMinimized()
                            internal.restoreMargin()
                        }

                    }

                    TopBarButton {
                        id: maximizeBtn
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                        onClicked: internal.maximizeRestore()

                    }

                    TopBarButton {
                        id: closeBtn
                        onClicked: mainWindow.close()
                        btnIconSource: "../images/svg_images/close_black_24dp.svg"
                    }



                    //                    Button {
                    //                        id: buttonMinimize
                    //                        width: 35
                    //                        height: 35
                    //                        text: qsTr("Button")
                    //                    }
                }
            }

            Rectangle {
                id: content
                color: "#00000000"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: topBar.bottom
                anchors.bottom: parent.bottom
                anchors.topMargin: 0

                Rectangle {
                    id: leftMenu
                    width: 70
                    color: "#1c1d20"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    PropertyAnimation{
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: if(leftMenu.width==70) return 200; else return 70
                        duration: 500
                        easing.type: Easing.OutQuint
                    }

                    Column {
                        id: column
                        width: 70
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.leftMargin: 0
                        anchors.bottomMargin: 66
                        anchors.topMargin: 0


                        LeftMenuBtn{
                            id: btnHome
                            width: leftMenu.width
                            height: 60
                            visible: true
                            text: qsTr("Home")
                            isActiveMenu: true

                            onClicked: {
                                btnHome.isActiveMenu = true
                                btnSummarize.isActiveMenu = false
                                btnSentiment.isActiveMenu = false
                                btnWordCloud.isActiveMenu = false
                                btnSettings.isActiveMenu = false

                                //stackView.push(Qt.resolvedUrl("pages/HomePage.qml"))
                                //pagesView.setSource(Qt.resolvedUrl("pages/HomePage.qml"))
                                pagesHomeView.visible = true
                                pagesSummarizeView.visible = false
                                pagesSentimentView.visible = false
                                pagesWordCloudView.visible = false
                                pagesSettingsView.visible = false
                                pagesSummaryOutputView = false
                                pagesSentimentOutputView = false
                                pagesWordCloudOutputView = false
                            }

                        }

                        LeftMenuBtn {
                            id: btnSummarize
                            width: leftMenu.width
                            height: 60
                            visible: true
                            text: qsTr("Summarize")
                            btnIconSource: "../images/svg_images/summarize_black_24dp.svg"

                            onClicked: {
                                btnHome.isActiveMenu = false
                                btnSummarize.isActiveMenu = true
                                btnSentiment.isActiveMenu = false
                                btnWordCloud.isActiveMenu = false
                                btnSettings.isActiveMenu = false

                                //stackView.push(Qt.resolvedUrl("pages/HomePage.qml"))
                                //pagesView.setSource(Qt.resolvedUrl("pages/HomePage.qml"))
                                pagesHomeView.visible = false
                                pagesSummarizeView.visible = true
                                pagesSentimentView.visible = false
                                pagesWordCloudView.visible = false
                                pagesSettingsView.visible = false
                                pagesSummaryOutputView = false
                                pagesSentimentOutputView = false
                                pagesWordCloudOutputView = false
                            }

                        }


                        LeftMenuBtn {
                            id: btnSentiment
                            width: leftMenu.width
                            height: 60
                            visible: true
                            text: qsTr("Sentiment Analysis")
                            btnIconSource: "../images/svg_images/sentiment_satisfied_black_24dp.svg"

                            onClicked: {
                                btnHome.isActiveMenu = false
                                btnSummarize.isActiveMenu = false
                                btnSentiment.isActiveMenu = true
                                btnWordCloud.isActiveMenu = false
                                btnSettings.isActiveMenu = false

                                //stackView.push(Qt.resolvedUrl("pages/HomePage.qml"))
                                //pagesView.setSource(Qt.resolvedUrl("pages/HomePage.qml"))
                                pagesHomeView.visible = false
                                pagesSummarizeView.visible = false
                                pagesSentimentView.visible = true
                                pagesWordCloudView.visible = false
                                pagesSettingsView.visible = false
                                pagesSummaryOutputView = false
                                pagesSentimentOutputView = false
                                pagesWordCloudOutputView = false
                            }

                        }


                        LeftMenuBtn {
                            id: btnWordCloud
                            width: leftMenu.width
                            height: 60
                            visible: true
                            text: qsTr("Word Cloud")
                            btnIconSource: "../images/svg_images/cloud_black_24dp.svg"

                            onClicked: {
                                btnHome.isActiveMenu = false
                                btnSummarize.isActiveMenu = false
                                btnSentiment.isActiveMenu = false
                                btnWordCloud.isActiveMenu = true
                                btnSettings.isActiveMenu = false

                                //stackView.push(Qt.resolvedUrl("pages/HomePage.qml"))
                                //pagesView.setSource(Qt.resolvedUrl("pages/HomePage.qml"))
                                pagesHomeView.visible = false
                                pagesSummarizeView.visible = false
                                pagesSentimentView.visible = false
                                pagesWordCloudView.visible = true
                                pagesSettingsView.visible = false
                                pagesSummaryOutputView = false
                                pagesSentimentOutputView = false
                                pagesWordCloudOutputView = false
                            }

                        }

                    }

                    LeftMenuBtn {
                        id: btnSettings
                        width: leftMenu.width
                        height: 60
                        visible: true
                        text: qsTr("Settings")
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 25
                        btnIconSource: "../images/svg_images/settings_black_24dp.svg"
//                        onClicked: {
//                            btnHome.isActiveMenu = false
//                            btnSettings.isActiveMenu = true
//                            //stackView.push(Qt.resolvedUrl("pages/SettingsPage.qml"))
//                            pagesView.setSource(Qt.resolvedUrl("pages/SettingsPage.qml"))
//                        }

                        onClicked: {
                            btnHome.isActiveMenu = false
                            btnSummarize.isActiveMenu = false
                            btnSentiment.isActiveMenu = false
                            btnWordCloud.isActiveMenu = false
                            btnSettings.isActiveMenu = true

                            //stackView.push(Qt.resolvedUrl("pages/HomePage.qml"))
                            //pagesView.setSource(Qt.resolvedUrl("pages/HomePage.qml"))
                            pagesHomeView.visible = false
                            pagesSummarizeView.visible = false
                            pagesSentimentView.visible = false
                            pagesWordCloudView.visible = false
                            pagesSettingsView.visible = true
                            pagesSummaryOutputView = false
                            pagesSentimentOutputView = false
                            pagesWordCloudOutputView = false
                        }


                    }
                }

                Rectangle {
                    id: contentPages
                    visible: true
                    color: "#2c313c"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 25
                    anchors.topMargin: 0

//                    StackView {
//                        id: stackView
//                        anchors.fill: parent

//                        initialItem: Qt.resolvedUrl("pages/HomePage.qml")
//                    }

                    Loader{
                        id: pagesHomeView
                        anchors.fill: parent
                        source: Qt.resolvedUrl("pages/HomePage.qml")
                        visible: true

                    }

                    Loader{
                        id: pagesSummarizeView
                        anchors.fill: parent
                        source: Qt.resolvedUrl("pages/SummarizePage.qml")
                        visible: false

                    }

                    Loader{
                        id: pagesSentimentView
                        anchors.fill: parent
                        source: Qt.resolvedUrl("pages/SentimentPage.qml")
                        visible: false

                    }
                    Loader{
                        id: pagesWordCloudView
                        anchors.fill: parent
                        source: Qt.resolvedUrl("pages/WordCloudPage.qml")
                        visible: false

                    }
                    Loader{
                        id: pagesSettingsView
                        anchors.fill: parent
                        source: Qt.resolvedUrl("pages/SettingsPage.qml")
                        visible: false

                    }

                    Loader{
                        id: pagesSummaryOutputView
                        anchors.fill: parent
                        source: Qt.resolvedUrl("pages/SummaryOutputPage.qml")
                        visible: false

                    }

                    Loader{
                        id: pagesSentimentOutputView
                        anchors.fill: parent
                        source: Qt.resolvedUrl("pages/SentimentAnlysisOutputPage.qml")
                        visible: false

                    }

                    Loader{
                        id: pagesWordCloudOutputView
                        anchors.fill: parent
                        source: Qt.resolvedUrl("pages/WordCloudOutputPage.qml")
                        visible: false

                    }

                }

                Rectangle {
                    id: rectangle
                    color: "#282c34"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: contentPages.bottom
                    anchors.bottom: parent.bottom
                    anchors.rightMargin: 0
                    anchors.leftMargin: 0
                    anchors.bottomMargin: 0
                    anchors.topMargin: 0

                    Label {
                        id: labelBottomInfo
                        color: "#c2c2c2"
                        text: qsTr("Application Description")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        anchors.bottomMargin: 4
                        anchors.rightMargin: 30
                        anchors.leftMargin: 10
                        anchors.topMargin: 5
                    }

                    MouseArea {
                        id: resizeBottomRight
                        x: 1255
                        y: 3
                        width: 25
                        height: 25
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: -6
                        anchors.bottomMargin: -3
                        cursorShape: Qt.SizeFDiagCursor

                        Image {
                            id: image
                            y: 0
                            width: 16
                            height: 16
                            opacity: 0.5
                            anchors.left: parent.left
                            anchors.right: parent.right
                            anchors.top: parent.top
                            anchors.bottom: parent.bottom
                            source: "../images/svg_images/resize_icon.svg"
                            anchors.rightMargin: 4
                            anchors.leftMargin: 0
                            anchors.bottomMargin: 0
                            anchors.topMargin: 5
                            sourceSize.height: 16
                            sourceSize.width: 16
                            anchors.horizontalCenter: parent.horizontalCenter
                            fillMode: Image.PreserveAspectFit
                            antialiasing: false
                        }

                        DragHandler{
                            target: null
                            onActiveChanged: if(active){
                                                 mainWindow.startSystemResize(Qt.BottomEdge | Qt.RightEdge)
                                             }
                        }

                    }
                }
            }
        }
    }



    DropShadow{
        anchors.fill: bg
        horizontalOffset: 0
        verticalOffset: 0
        radius: 10
        samples: 16
        color: "#000000"
        source: bg
        z:0

    }

    MouseArea {
        id: resizeLeft
        width: 10
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 9
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if(active) {
                                 mainWindow.startSystemResize(Qt.LeftEdge)
                             }
        }
    }

    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if(active) {
                                 mainWindow.startSystemResize(Qt.RightEdge)
                             }
        }
    }

    MouseArea {
        id: resizeBottom
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        anchors.bottomMargin: 0
        cursorShape: Qt.SizeVerCursor

        DragHandler{
            target: null
            onActiveChanged: if(active) {
                                 mainWindow.startSystemResize(Qt.BottomEdge)
                             }
        }
    }


    MouseArea {
        id: resizeTop
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.topMargin: 0
        anchors.leftMargin: 10
        anchors.rightMargin: 10
        cursorShape: Qt.SizeVerCursor

        DragHandler{
            target: null
            onActiveChanged: if(active) {
                                 mainWindow.startSystemResize(Qt.TopEdge)
                             }
        }
    }


}




/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:35}D{i:42}
}
##^##*/
