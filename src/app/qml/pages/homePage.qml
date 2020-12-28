import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import "../controls"

Item {
    id: homePage
    anchors.centerIn: parent

    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.left: parent.left
        anchors.top: parent.top
        anchors.bottom: parent.bottom
        anchors.horizontalCenterOffset: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0
        anchors.horizontalCenter: parent.horizontalCenter

        Row {
            id: row
            height: 150
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 25
            anchors.leftMargin: 25
            anchors.rightMargin: 25
            Image {
                id: image
                height: 142
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                source: "../../images/official_logo.png"
                anchors.rightMargin: 2*parent.width/3
                anchors.topMargin: 0
                anchors.leftMargin: 20
                fillMode: Image.PreserveAspectFit

                smooth: true
                layer {
                    enabled: true
                    effect: ColorOverlay {
                        color: "#ffffff"
                    }
                }

            }

            Text {
                id: text1
                height: 66
                color: "#4891d9"
                text: qsTr("This is an environement created to collect, administrate an process inertial data from human movements.")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                font.pixelSize: 18
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                anchors.leftMargin: parent.width/3+25
                font.bold: true
                anchors.rightMargin: 50
                anchors.topMargin: 38
                minimumPixelSize: 27
            }
        }

        Column {
            id: column
            height: 160
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: row.bottom
            anchors.rightMargin: 2*parent.width/3-50
            anchors.leftMargin: 25
            anchors.topMargin: 20

            CustomButton {
                id: btnStart
                height: 40
                text: qsTr("Start")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                font.pointSize: 12
                font.bold: false
                onClicked: {
                    backend.welcomeText("Wanghley")
                }
            }

            CustomButton {
                id: btnInstructions
                height: 40
                text: qsTr("Instructions")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: btnStart.bottom
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 20
                font.pointSize: 12
            }

            CustomButton {
                id: btnAbout
                height: 40
                text: qsTr("About")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: btnInstructions.bottom
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 20
                font.pointSize: 12
            }
        }

        Column {
            id: column1
            height: 253
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: row.bottom
            anchors.leftMargin: parent.width/2-50
            anchors.rightMargin: 25
            anchors.topMargin: 20

            Text {
                id: textHome
                width: 450
                height: 180
                color: "#a9b2c8"
                text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">GNU GENERAL PUBLIC LICENSE</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Version 3, 29 June 2007</p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Copyright (c) 2020 <br><span style=\" font-weight:800;\">Wanghley Soares Martins</span> & <span style=\" font-weight:800;\">Fábio Henrique Monteiro Oliveira</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600; color:#55aaff;\">Attention</span>: this project was created with the Open Souce tools from Qt Company,</p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">this project can be used for studies or personal non-commercial projects. </p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">If you are going to use it for </span><span style=\" font-weight:600; color:#55aaff;\">commercial use</span><span style=\" font-weight:600;\">,<br>you need to purchase a license at &quot;https://www.qt.io&quot;.</span></p><p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Please, be aware with the licence terms.<br>For more informations see:</p></body></html>"
                elide: Text.ElideLeft
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                font.pixelSize: 12
                wrapMode: Text.WordWrap
                anchors.rightMargin: 0
                anchors.leftMargin: 0
                anchors.topMargin: 0
                renderType: Text.QtRendering
                textFormat: Text.RichText
            }

            CustomButton {
                id: button3
                width: 201
                height: 27
                text: qsTr("LICENSE")
                anchors.top: textHome.bottom
                anchors.topMargin: 15
            }
        }
        Connections{
            target: backend

            function onSetName(name){
                text1.text=name
            }
        }

    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:480;width:800}
}
##^##*/
