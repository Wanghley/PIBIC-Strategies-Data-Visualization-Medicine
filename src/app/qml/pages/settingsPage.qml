import QtQuick 2.15;
import QtQuick.Controls 2.15;
import "../controls"
import QtQuick.Layouts 1.0;
import QtQuick.Dialogs 1.1

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
                id: cbDevices
                y: 19
                height: 44
                anchors.verticalCenter: text2.verticalCenter
                anchors.left: text2.right
                anchors.right: parent.right
                currentIndex: -1
                displayText: currentIndex===-1?"Select a device":currentText
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
                    settings_backend.searchDevice()
                }
            }

            CustomButton {
                id: connectBtn
                x: 221
                y: 82
                width: 175
                height: 50
                text: "Connect"
                font.pixelSize: 16
                fontSize: 20
                Layout.preferredHeight: 40
                Layout.preferredWidth: 200
                onClicked: {
                    settings_backend.connect(cbDevices.displayText)
                }
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
            opacity: 1
            color: "#2affffff"
            radius: 10
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: rectangle1.bottom
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 25
            anchors.topMargin: 20
            anchors.leftMargin: 60
            anchors.rightMargin: 60

            Text {
                id: text3
                x: 72
                color: "#ffffff"
                text: qsTr("Frequency (Hz):")
                anchors.top: parent.top
                font.pixelSize: 18
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                anchors.topMargin: 13
                Layout.preferredHeight: 40
                font.bold: false
            }

            SpinBox {
                id: sBoxFreq
                y: 19
                height: 35
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
                onValueChanged: {
                    settings_backend.updateFrequency(value)
                }
            }

            Item {
                id: spacer
                Layout.columnSpan: 2
                Layout.preferredHeight: 14
                Layout.preferredWidth: 14
            }

            Text {
                id: text4
                x: 53
                width: 148
                height: 21
                color: "#ffffff"
                text: qsTr("Data Header:")
                anchors.top: text3.bottom
                font.pixelSize: 18
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                anchors.topMargin: 25
                Layout.preferredHeight: 40
                font.bold: false
            }

            TextField {
                id: txtHeader
                y: 69
                width: 399
                height: 35
                placeholderText: qsTr("")
                text: "time,accx,accy,accz,gyx,gyy,gyz,temperature"
                anchors.verticalCenter: text4.verticalCenter
                anchors.left: text4.right
                anchors.leftMargin: 20
                Layout.columnSpan: 3
                Layout.preferredHeight: 40
                Layout.preferredWidth: 356
                onTextChanged: {
                    settings_backend.updateHeader(text)
                }
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
                anchors.topMargin: 25
                Layout.preferredHeight: 40
                font.bold: false
            }

            ComboBox {
                id: comboBox1
                y: 116
                width: 143
                height: 35
                anchors.verticalCenter: text5.verticalCenter
                anchors.left: text5.right
                font.pixelSize: 14
                anchors.leftMargin: 20
                currentIndex: -1
                displayText: currentIndex===-1?".csv":currentText
                model: [".csv", ".tsv", ".xls"]

                Layout.preferredHeight: 40
                Layout.preferredWidth: 191
            }

            Item {
                id: spacer1
                Layout.columnSpan: 2
                Layout.preferredHeight: 14
                Layout.preferredWidth: 14
            }

            Text {
                id: text6
                x: 53
                width: 148
                height: 21
                color: "#ffffff"
                text: qsTr("Buffer size:")
                anchors.top: text5.bottom
                font.pixelSize: 18
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.WordWrap
                font.bold: false
                Layout.preferredHeight: 40
                anchors.topMargin: 25
            }

            SpinBox {
                id: sBoxBufferSize
                y: 144
                height: 35
                anchors.verticalCenter: text6.verticalCenter
                anchors.left: text6.right
                anchors.right: parent.right
                font.pixelSize: 14
                Layout.preferredWidth: 191
                Layout.preferredHeight: 40
                anchors.leftMargin: 20
                anchors.rightMargin: 316
                value: 60
                to: 256
                from: 50
                onValueChanged: {
                    settings_backend.updateBufferSize(value)
                }
            }
        }
        Component.onCompleted: {
            settings_backend.searchDevice()
        }

        MessageDialog {
            id: msgDialog
            title: "Overwrite?"
            icon: StandardIcon.Information
            text: "file.txt already exists.  Replace?"
            standardButtons: StandardButton.Ok
            visible: false
        }

        Connections{
            target: settings_backend
            function onSearchDeviceSig(devices){
                console.log(devices)
                cbDevices.model=devices
            }

            function onConnectToDevice(success,name){
                if(success){
                    msgDialog.title="Success"
                    msgDialog.text="Connected successfully to "+name
                    msgDialog.visible=true

                    labelRightInfo.text = "<font color=\"lime\"><b>CONNECTED</br> ("+name+")</font>"



                    btnHome.isActiveMenu = false
                    btnPatient.isActiveMenu=false
                    btnCollection.isActiveMenu=true
                    btnAnalysis.isActiveMenu=false
                    btnSettings.isActiveMenu=false
                    homePageView.visible=false
                    patientPageView.visible=false
                    collectPageView.visible=true
                    settingsPageView.visible=false
                }
            }
        }
    }
}

/*##^##
Designer {
    D{i:0;formeditorZoom:0.75;height:480}
}
##^##*/
