import QtQuick 2.0;
import QtQuick.Controls 2.15;
import "../controls"
import QtQuick.Layouts 1.0;

Item {
    id: item1
    width: 800
    Rectangle{
        id: rectangle
        color:"#2c313c"
        anchors.fill: parent

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

        GridLayout {
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: parent.width/6+20
            anchors.bottomMargin: 100
            anchors.topMargin: 100
            anchors.leftMargin: 25
            rowSpacing: 20
            columnSpacing: 15
            rows: 4
            columns: 4

            Text {
                id: text2
                color: "#ffffff"
                text: qsTr("Bluetooth Connection:")
                font.pixelSize: 18
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                Layout.preferredHeight: 40
                font.bold: false
            }

            ComboBox {
                id: comboBox
                displayText: "Select a device"
                font.pixelSize: 16
                Layout.fillWidth: true
                Layout.columnSpan: 2
                Layout.preferredHeight: 40
            }

            CustomButton{
                id:searchBtn
                text: ""
                Layout.preferredHeight: 40
                Layout.preferredWidth: 40
                iconVisibility: true
                iconPath: "../../images/svg_images/search.png"
            }

            Text {
                id: text3
                color: "#ffffff"
                text: qsTr("Data colleciton frequency (Hz):")
                font.pixelSize: 18
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                Layout.preferredHeight: 40
                font.bold: false
            }

            SpinBox {
                id: spinBox
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
                color: "#ffffff"
                text: qsTr("Data Header:")
                font.pixelSize: 18
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                Layout.preferredHeight: 40
                font.bold: false
            }

            TextField {
                id: textField
                placeholderText: qsTr("")
                text: "time,accx,accy,accz,gyx,gyy,gyz,temperature"
                Layout.columnSpan: 3
                Layout.preferredHeight: 40
                Layout.preferredWidth: 356
            }

            Text {
                id: text5
                color: "#ffffff"
                text: qsTr("Raw data file type:")
                font.pixelSize: 18
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                Layout.preferredHeight: 40
                font.bold: false
            }

            ComboBox {
                id: comboBox1
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

        Column {
            id: column
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: text1.bottom
            anchors.bottom: parent.bottom
            anchors.leftMargin: 5*parent.width/6
            anchors.bottomMargin: 10
            anchors.topMargin: 25
            anchors.rightMargin: 10

            Image {
                id: image
                width: 100
                height: 100
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                source: "../../images/svg_images/settings_illustration.svg"
                anchors.horizontalCenter: parent.horizontalCenter
                fillMode: Image.PreserveAspectFit
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.66}D{i:4}D{i:5}D{i:7}D{i:8}D{i:9;extraSpanning:1}D{i:10}D{i:11}
D{i:12}D{i:13}D{i:14;extraSpanning:1}D{i:3}D{i:16}D{i:15}
}
##^##*/
