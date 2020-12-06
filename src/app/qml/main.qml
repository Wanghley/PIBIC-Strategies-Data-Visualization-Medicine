import QtQuick 2.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15
import "controls"

Window {
    id: mainWindow
    width: 1000
    height: 580
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

        function maximizeRestore(){
            if(windowStatus==0){
                windowMargin=0
                mainWindow.showMaximized()
                windowStatus=1
            }else{
                windowMargin=10
                mainWindow.showNormal()
                windowStatus=0
            }
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
                        onClicked: mainWindow.showMinimized()
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
                        duration: 750
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
                        }

                        LeftMenuBtn {
                            id: btnAnalysis
                            width: leftMenu.width
                            text: qsTr("Analysis")
                            anchors.top: btnCollection.bottom
                            iconHeight: 20
                            iconWidth: 20
                            btnIconSource: "../images/svg_images/analysis.svg"
                            anchors.topMargin: 5
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
                }

                Rectangle {
                    id: contentPages
                    color: "#2c313c"
                    anchors.left: leftMenu.right
                    anchors.right: parent.right
                    anchors.top: parent.top
                    anchors.bottom: parent.bottom
                    anchors.bottomMargin: 25
                    anchors.leftMargin: 0
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

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.5}
}
##^##*/
