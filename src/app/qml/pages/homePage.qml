import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import "../controls"

Item {
    width: 800
    anchors.centerIn: parent

    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Row {
            height: 150
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.topMargin: 25
            anchors.leftMargin: 25
            anchors.rightMargin: 25
            Image {
                id: image
                width: 227
                height: 142
                anchors.left: parent.left
                anchors.top: parent.top
                source: "../../images/official_logo.png"
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
                width: 438
                height: 66
                color: "#ffffff"
                text: qsTr("This is an environement created to collect, administrate an process inertial data from human movements.")
                anchors.left: image.right
                anchors.right: parent.right
                anchors.top: parent.top
                font.pixelSize: 20
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                anchors.leftMargin: 30
                anchors.rightMargin: 2
                anchors.topMargin: 38
                minimumPixelSize: 32
            }
        }

        CustomButton {
            id: button
            x: 57
            y: 229
            width: 214
            height: 40
            text: qsTr("Start")
        }

        CustomButton {
            id: button1
            x: 57
            y: 296
            width: 214
            height: 40
            text: qsTr("Instructions")
        }

        CustomButton {
            id: button2
            x: 57
            y: 366
            width: 214
            height: 40
            text: qsTr("About")
        }

        ScrollView {
            id: scrollView
            anchors.left: button1.right
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.leftMargin: 50
            anchors.topMargin: 210
            anchors.bottomMargin: 23
            anchors.rightMargin: 25

            Text {
                id: textHome
                color: "#a9b2c8"
                text: "<!DOCTYPE HTML PUBLIC \"-//W3C//DTD HTML 4.0//EN\" \"http://www.w3.org/TR/REC-html40/strict.dtd\">\n<html><head><meta name=\"qrichtext\" content=\"1\" /><style type=\"text/css\">\np, li { white-space: wrap; }\n</style></head><body style=\" font-family:'MS Shell Dlg 2'; font-size:8.25pt; font-weight:400; font-style:normal;\">\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">GNU GENERAL PUBLIC LICENSE</span></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Version 3, 29 June 2007</p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">Copyright (c) 2020 <span style=\" font-weight:800;\">Wanghley Soares Martins</span></p>\n<p style=\"-qt-paragraph-type:empty; margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px; font-weight:600;\"><br /></p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600; color:#55aaff;\">Attention</span>: this project was created with the Open Souce tools from Qt Company,</p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\">this project can be used for studies or personal non-commercial projects. </p>\n<p style=\" margin-top:0px; margin-bottom:0px; margin-left:0px; margin-right:0px; -qt-block-indent:0; text-indent:0px;\"><span style=\" font-weight:600;\">If you are going to use it for </span><span style=\" font-weight:600; color:#55aaff;\">commercial use</span><span style=\" font-weight:600;\">,<br>you need to purchase a license at &quot;https://www.qt.io&quot;.</span></p></body></html>"
                elide: Text.ElideLeft
                anchors.fill: parent
                font.pixelSize: 12
                wrapMode: Text.WordWrap
                renderType: Text.QtRendering
                anchors.rightMargin: 20
                anchors.leftMargin: 20
                anchors.bottomMargin: 20
                anchors.topMargin: 20
                textFormat: Text.RichText
            }
        }

    }

}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75}D{i:2}D{i:9}D{i:8}
}
##^##*/
