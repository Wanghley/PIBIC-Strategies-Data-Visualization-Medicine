import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
//import QtBluetooth 5.2 // import for bluetooth control
import "controls"

Window {
    id: mainWindow
    width: 1000
    minimumWidth: 850
    height: 580
    minimumHeight: 500
    visible: true
    color: "#00000000"
    title: qsTr("Motion Sense")

    //REMOVE TITLE BAR
    flags: Qt.Window | Qt.FramelessWindowHint
    
    //PROPERTIES
    property int windowStatus: 0
    property int windowMargin: 10


    //INTERNAl FUNCTIONS
    QtObject{
        id: internal

        function resizeVisibility(opt){
            resizeBotton.visible=opt
            resizeBtnRight.visible=opt
            resizeLeft.visible=opt
            resizeRight.visible=opt
            resizeTop.visible=opt
            resizeImage.visible=opt
        }

        function maximizeRestore(){
            if(windowStatus==0){
                mainWindow.showMaximized()
                btnMaximizeRestore.btnIconSource="../images/svg_images/restore_icon.svg"
                windowMargin=0
                windowStatus=1
                //Resize visibility
                internal.resizeVisibility(false)
            }else{
                mainWindow.showNormal()
                btnMaximizeRestore.btnIconSource="../images/svg_images/maximize_icon.svg"
                windowMargin=10
                windowStatus=0
                //Resize visibility
                internal.resizeVisibility(true)
            }
        }

        function ifMaximizedWindowRestore(){
            if(windowStatus==1){
                mainWindow.showNormal()
                btnMaximizeRestore.btnIconSource="../images/svg_images/maximize_icon.svg"
                windowStatus=0
                windowMargin=10
            }
        }

        function restoreMargins(){
            btnMaximizeRestore.btnIconSource="../images/svg_images/maximize_icon.svg"
            windowMargin=10
            windowStatus=0
        }
    }

    Rectangle {
        id: bg
        color: "#2c313c"
        border.color: "#353b48"
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.rightMargin: windowMargin
        anchors.leftMargin: windowMargin
        anchors.bottomMargin: windowMargin
        anchors.topMargin: windowMargin
        z:1

        Rectangle {
            id: appContainer
            color: "#00000000"
            border.color: "#00000000"
            anchors.fill: parent
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
                
                ToggleButton {
                    onClicked: animationMenu.running=true
                }
                
                Rectangle {
                    id: topBarDescription
                    y: 28
                    height: 25
                    color: "#282c34"
                    anchors.left: parent.left
                    anchors.right: parent.right
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 70
                    anchors.rightMargin: 0
                    anchors.bottomMargin: 0
                    
                    Label {
                        id: labelTopInfo
                        color: "#5f6a82"
                        text: qsTr("Environment for human movements collection and analysis")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        anchors.bottomMargin: 0
                        anchors.rightMargin: 300
                        anchors.leftMargin: 10
                        anchors.topMargin: 0
                    }
                    
                    Label {
                        id: labelRightInfo
                        color: "#5f6a82"
                        text: qsTr("NOT CONNECTED")
                        anchors.left: labelTopInfo.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignRight
                        verticalAlignment: Text.AlignVCenter
                        anchors.leftMargin: 0
                        anchors.rightMargin: 10
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
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
                    
                    DragHandler{
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
                        source: "../images/icon.svg"
                        anchors.leftMargin: 5
                        anchors.bottomMargin: 0
                        anchors.topMargin: 0
                        fillMode: Image.PreserveAspectFit

                        smooth: true
                            layer {
                                enabled: true
                                effect: ColorOverlay {
                                    color: "#ffffff"
                                }
                            }

                    }
                    
                    Label {
                        id: label
                        color: "#c3cbdd"
                        text: qsTr("Motion Sense")
                        anchors.left: iconApp.right
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        horizontalAlignment: Text.AlignLeft
                        verticalAlignment: Text.AlignVCenter
                        font.family: "Arial"
                        font.bold: true
                        font.pointSize: 12
                        anchors.leftMargin: 5
                    }
                }

                Row {
                    id: rowBtns
                    x: 900
                    width: 105
                    height: 35
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    anchors.rightMargin: 0

                    TopBarButton {
                        id: btnMinimize
                        onClicked: {
                            mainWindow.showMinimized()
                            internal.restoreMargins()
                        }
                    }

                    TopBarButton {
                        id: btnMaximizeRestore
                        btnIconSource: "../images/svg_images/maximize_icon.svg"
                        onClicked: internal.maximizeRestore()
                    }

                    TopBarButton {
                        id: btnClose
                        btnColorClicked: "#f10000"
                        btnIconSource: "../images/svg_images/close_icon.svg"
                        onClicked: mainWindow.close()
                    }
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
                    height: 498
                    color: "#1c1d20"
                    anchors.left: parent.left
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.topMargin: 0
                    anchors.bottomMargin: 0
                    anchors.leftMargin: 0

                    PropertyAnimation{
                        id: animationMenu
                        target: leftMenu
                        property: "width"
                        to: if(leftMenu.width==70) return 200; else return 70
                        duration: 500
                        easing.type: Easing.InOutQuint
                    }
                    
                    Column {
                        id: columnMenus
                        width: 70
                        anchors.fill: parent
                        anchors.bottomMargin: 69

                        LeftMenuBtn {
                            id: btnHome
                            width: leftMenu.width
                            text: qsTr("Home")
                            iconHeight: 20
                            iconWidth: 20
                            isActiveMenu: true
                            onClicked: {
                                btnHome.isActiveMenu = true
                                btnPatient.isActiveMenu=false
                                btnCollection.isActiveMenu=false
                                btnAnalysis.isActiveMenu=false
                                btnSettings.isActiveMenu=false
//                                stackView.push(Qt.resolvedUrl("pages/homePage.qml"))
//                                pagesView.setSource(Qt.resolvedUrl("pages/homePage.qml"))
                                homePageView.visible=true
                                patientPageView.visible=false
                                collectPageView.visible=false
                                settingsPageView.visible=false
                            }
                        }

                        LeftMenuBtn {
                            id: btnPatient
                            width: leftMenu.width
                            text: qsTr("Patient")
                            anchors.top: btnHome.bottom
                            iconHeight: 20
                            iconWidth: 24
                            btnIconSource: "../images/svg_images/patient.svg"
                            anchors.topMargin: 5
                            onClicked: {
                                btnHome.isActiveMenu=false
                                btnPatient.isActiveMenu=true
                                btnCollection.isActiveMenu=false
                                btnAnalysis.isActiveMenu=false
                                btnSettings.isActiveMenu=false
//                                stackView.push(Qt.resolvedUrl("pages/patientPage.qml"))
//                                pagesView.setSource(Qt.resolvedUrl("pages/patientPage.qml"))
                                homePageView.visible=false
                                patientPageView.visible=true
                                collectPageView.visible=false
                                settingsPageView.visible=false
                            }
                        }

                        LeftMenuBtn {
                            id: btnAnalysis
                            width: leftMenu.width
                            visible: true
                            enabled: false
                            text: qsTr("Analysis")
                            ToolTip.visible: down
                                ToolTip.text: qsTr("Under development!")
                            anchors.top: btnCollection.bottom
                            isActiveMenu: false
                            iconHeight: 20
                            iconWidth: 20
                            btnIconSource: "../images/svg_images/analysis.svg"

                            onClicked: {
//                                btnHome.isActiveMenu=false
//                                btnPatient.isActiveMenu=false
//                                btnCollection.isActiveMenu=false
//                                btnAnalysis.isActiveMenu=true
//                                btnSettings.isActiveMenu=false
                            }
                        }

                        LeftMenuBtn {
                            id: btnCollection
                            width: leftMenu.width
                            text: qsTr("Collect")
                            anchors.top: btnPatient.bottom
                            anchors.topMargin: 5
                            iconWidth: 20
                            btnIconSource: "../images/svg_images/sensor.svg"
                            iconHeight: 20
                            onClicked: {
                                btnHome.isActiveMenu=false
                                btnPatient.isActiveMenu=false
                                btnCollection.isActiveMenu=true
                                btnAnalysis.isActiveMenu=false
                                btnSettings.isActiveMenu=false
//                                stackView.push(Qt.resolvedUrl("pages/collectPage.qml"))
//                                pagesView.setSource(Qt.resolvedUrl("pages/collectPage.qml"))
                                homePageView.visible=false
                                patientPageView.visible=false
                                collectPageView.visible=true
                                settingsPageView.visible=false
                            }
                        }
                    }
                }
                
                LeftMenuBtn {
                    id: btnSettings
                    x: 0
                    y: 379
                    width: leftMenu.width
                    text: qsTr("Settings")
                    anchors.bottom: parent.bottom
                    iconHeight: 20
                    iconWidth: 20
                    btnIconSource: "../images/svg_images/settings.svg"
                    anchors.bottomMargin: 25
                    onClicked: {
                        btnHome.isActiveMenu=false
                        btnPatient.isActiveMenu=false
                        btnCollection.isActiveMenu=false
                        btnAnalysis.isActiveMenu=false
                        btnSettings.isActiveMenu=true
//                        stackView.push((Qt.resolvedUrl("pages/settingsPage.qml")))
//                        pagesView.setSource(Qt.resolvedUrl("pages/collectPage.qml"))
                        homePageView.visible=false
                        patientPageView.visible=false
                        collectPageView.visible=false
                        settingsPageView.visible=true
                    }
                }

                Rectangle {
                    id: contentPages
                    color: "#2c313c"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    clip: true
                    anchors.bottomMargin: 25
                    anchors.leftMargin: 0

//                    StackView {
//                        id: stackView
//                        anchors.fill: parent
//                        clip: true
//                        initialItem: Qt.resolvedUrl("pages/homePage.qml")
//                    }

                    Loader{ //load other pages without animations
                        id: homePageView
                        anchors.fill: parent
                        visible: true
                        source: Qt.resolvedUrl("pages/homePage.qml")
                    }
                    Loader{ //load other pages without animations
                        id: patientPageView
                        anchors.fill: parent
                        visible: false
                        source: Qt.resolvedUrl("pages/patientPage.qml")
                    }
                    Loader{ //load other pages without animations
                        id: collectPageView
                        anchors.fill: parent
                        visible: false
                        source: Qt.resolvedUrl("pages/collectPage.qml")
                    }
                    Loader{ //load other pages without animations
                        id: settingsPageView
                        anchors.fill: parent
                        visible: false
                        source: Qt.resolvedUrl("pages/settingsPage.qml")
                    }

                }
                
                Rectangle {
                    id: bot
                    color: "#282c34"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: contentPages.bottom
                    anchors.bottom: parent.bottom
                    anchors.leftMargin: 0
                    anchors.topMargin: 0
                    
                    Label {
                        id: labelTopInfo1
                        color: "#5f6a82"
                        text: qsTr("By Wanghley Soares Martins (@wanghley)")
                        anchors.left: parent.left
                        anchors.right: parent.right
                        anchors.top: parent.top
                        anchors.bottom: parent.bottom
                        verticalAlignment: Text.AlignVCenter
                        font.pointSize: 9
                        anchors.leftMargin: 10
                        anchors.rightMargin: 30
                        anchors.topMargin: 0
                        anchors.bottomMargin: 0
                    }

                    MouseArea {
                        id: resizeBtnRight
                        width: 25
                        height: 25
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        anchors.rightMargin: 0
                        anchors.bottomMargin: 0

                        cursorShape: Qt.SizeFDiagCursor

                        DragHandler{
                            target: null
                            onActiveChanged: if (active){
                                                 mainWindow.startSystemResize(Qt.RightEdge|Qt.BottonEdge)
                                             }
                        }
                    }

                    Image {
                        id: resizeImage
                        x: 883
                        y: 8
                        width: 25
                        height: 25
                        opacity: 0.5
                        anchors.right: parent.right
                        anchors.bottom: parent.bottom
                        source: "../images/svg_images/resize_icon.svg"
                        anchors.rightMargin: -5
                        anchors.bottomMargin: -5
                        fillMode: Image.PreserveAspectFit
                        antialiasing: false
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
        color: "#80000000"
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
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if(active) {mainWindow.startSystemResize(Qt.LeftEdge)}        }
    }


    MouseArea {
        id: resizeRight
        width: 10
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.leftMargin: 0
        anchors.bottomMargin: 10
        anchors.topMargin: 10
        cursorShape: Qt.SizeHorCursor

        DragHandler{
            target: null
            onActiveChanged: if(active) {mainWindow.startSystemResize(Qt.RightEdge)}        }
    }

    MouseArea {
        id: resizeTop
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: parent.top
        anchors.bottom: bg.top
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        anchors.bottomMargin: 0
        anchors.topMargin: 0
        cursorShape: Qt.SizeVerCursor

        DragHandler{
            target: null
            onActiveChanged: if(active) {mainWindow.startSystemResize(Qt.TopEdge)}        }
    }

    MouseArea {
        id: resizeBotton
        height: 10
        anchors.left: parent.left
        anchors.right: parent.right
        anchors.top: bg.bottom
        anchors.topMargin: 0
        anchors.rightMargin: 10
        anchors.leftMargin: 10
        cursorShape: Qt.SizeVerCursor

        DragHandler{
            target: null
            onActiveChanged: if(active) {mainWindow.startSystemResize(Qt.BottonEdge)}        }
    }


}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
