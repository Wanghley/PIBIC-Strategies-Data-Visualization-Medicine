import QtQuick 2.15;
import QtQuick.Controls 2.15;
import "../controls"
import QtQuick.Layouts 1.0;

Item {
    id: frame

    width: 800
    Rectangle{
        id: rectangle
        color:"#2c313c"
        anchors.fill: parent
        anchors.rightMargin: 0
        anchors.bottomMargin: 0
        anchors.leftMargin: 0
        anchors.topMargin: 0

        Rectangle {
            id: rectangle1
            height: 151
            opacity: 1
            color: "#2affffff"
            radius:10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: text1.bottom
            anchors.topMargin: 10
            anchors.rightMargin: 60
            anchors.leftMargin: 60

            Text {
                id: text2
                color: "#ffffff"
                text: qsTr("Bluetooth Connection:")
                anchors.left: parent.left
                anchors.top: parent.top
                font.pixelSize: 18
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                anchors.topMargin: 30
                anchors.leftMargin: 20
                Layout.preferredHeight: 40
                font.bold: false
            }

            ComboBox {
                id: comboBox
                y: 19
                height: 44
                anchors.verticalCenter: text2.verticalCenter
                anchors.left: text2.right
                anchors.right: parent.right
                displayText: "Select a device"
                font.pixelSize: 16
                anchors.rightMargin: 25
                anchors.leftMargin: 20
                Layout.fillWidth: true
                Layout.columnSpan: 2
                Layout.preferredHeight: 40
            }

            CustomButton{
                id:searchBtn
                x: 446
                y: 82
                width: 175
                height: 50
                text: "Search"
                font.pixelSize: 16
                Layout.preferredHeight: 40
                Layout.preferredWidth: 200
                onClicked: {
                    console.log(btModel)
                }
            }

            CustomButton {
                id: searchBtn1
                x: 221
                y: 82
                width: 175
                height: 50
                text: "Connect"
                font.pixelSize: 16
                fontSize: 20
                Layout.preferredHeight: 40
                Layout.preferredWidth: 200
            }
        }



        Text {
            id: text1
            height: 54
            color: "#ffffff"
            text: qsTr("Settings")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            font.pixelSize: 44
            font.bold: true
            anchors.topMargin: 25
            anchors.rightMargin: 25
            anchors.leftMargin: 25
        }







        Rectangle {
            id: rectangle2
            height: 177
            opacity: 1
            color: "#2affffff"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle1.bottom
            anchors.topMargin: 34
            anchors.leftMargin: 60
            anchors.rightMargin: 60

            Text {
                id: text3
                x: 78
                color: "#ffffff"
                text: qsTr("Frequency (Hz):")
                anchors.top: parent.top
                font.pixelSize: 18
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                anchors.topMargin: parent.width/30
                Layout.preferredHeight: 40
                font.bold: false
            }

            SpinBox {
                id: spinBox
                y: 19
                anchors.verticalCenter: text3.verticalCenter
                anchors.left: text3.right
                anchors.right: parent.right
                font.pixelSize: 14
                anchors.rightMargin: 316
                anchors.leftMargin: 20
                Layout.preferredHeight: 40
                Layout.preferredWidth: 191
                to: 100
                from: 1
                value: 50
            }

            Item {
                id: spacer
                Layout.columnSpan: 2
                Layout.preferredHeight: 14
                Layout.preferredWidth: 14
            }

            Text {
                id: text4
                x: 97
                color: "#ffffff"
                text: qsTr("Data Header:")
                anchors.top: text3.bottom
                font.pixelSize: 18
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                anchors.topMargin: 30
                Layout.preferredHeight: 40
                font.bold: false
            }

            TextField {
                id: textField
                y: 69
                width: 399
                height: 40
                placeholderText: qsTr("")
                text: "time,accx,accy,accz,gyx,gyy,gyz,temperature"
                anchors.verticalCenter: text4.verticalCenter
                anchors.left: text4.right
                anchors.leftMargin: 20
                Layout.columnSpan: 3
                Layout.preferredHeight: 40
                Layout.preferredWidth: 356
            }

            Text {
                id: text5
                x: 53
                color: "#ffffff"
                text: qsTr("Raw data file type:")
                anchors.top: text4.bottom
                font.pixelSize: 18
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                anchors.topMargin: 30
                Layout.preferredHeight: 40
                font.bold: false
            }

            ComboBox {
                id: comboBox1
                y: 116
                anchors.verticalCenter: text5.verticalCenter
                anchors.left: text5.right
                font.pixelSize: 14
                anchors.leftMargin: 20
                displayText: ".csv"
                textRole: ""
                currentIndex: -1
                Layout.preferredHeight: 40
                Layout.preferredWidth: 191
            }

            Item {
                id: spacer1
                Layout.columnSpan: 2
                Layout.preferredHeight: 14
                Layout.preferredWidth: 14
            }
        }
        Component.onCompleted: {

        }

        Connections{
            target: settings_backend

        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75;height:480}
}
##^##*/
