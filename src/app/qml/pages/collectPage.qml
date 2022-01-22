import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.0
import QtQuick.Controls.Styles 1.0
import "../controls"
import QtQuick.Dialogs 1.1

Item {
    clip: true
    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Label {
            id: label1
            height: 51
            color: "#ffffff"
            text: qsTr("Data Colection Control")
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: parent.top
            font.pixelSize: 44
            verticalAlignment: Text.AlignVCenter
            anchors.rightMargin: 25
            font.bold: true
            anchors.topMargin: 25
            anchors.leftMargin: 25
        }

        Column {
            id: column1
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: label1.bottom
            anchors.bottom: parent.bottom
            anchors.rightMargin: parent.width/2-15
            z: 1
            anchors.topMargin: 15
            anchors.bottomMargin: 10
            anchors.leftMargin: 25

            Rectangle {
                id: rectangle2
                color: "#2affffff"
                border.width: 0
                anchors.fill: parent
                radius: 10
            }

            Label {
                id: label
                width: 80
                height: 38
                color: "#ffffff"
                text: qsTr("Interval of each task:")
                anchors.left: parent.left
                anchors.top: parent.top
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
                wrapMode: Text.Wrap
                font.bold: false
                anchors.topMargin: 30
                anchors.leftMargin: 15
            }


            Text {
                id: txtInterval
                property alias text1: txtInterval.text

                width: 75
                height: 33
                color: "#55aaff"
                text: "30.0"
                anchors.left: dial.right
                anchors.top: parent.top
                font.pixelSize: 24
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                anchors.topMargin: 33
                anchors.leftMargin: 35
                font.bold: true

            }

            Text {
                id: txtIntervalUnit
                width: 70
                height: 18
                color: "#55aaff"
                text: qsTr("Seconds")
                anchors.verticalCenter: txtInterval.verticalCenter
                anchors.left: txtInterval.right
                font.pixelSize: 16
                verticalAlignment: Text.AlignVCenter
                anchors.leftMargin: 10
                font.bold: true
            }

            Dial {
                id: dial
                width: 60
                height: 60
                anchors.left: label.right
                anchors.top: parent.top
                anchors.topMargin: 20
                anchors.leftMargin: 25
                value: 0.15
                palette.dark: "#4891d9"
                stepSize: 2

                ColorOverlay {
                    id: dialInterval
                    x: 0
                    y: 0
                    anchors.fill: dial
                    source: dial
                    anchors.topMargin: 0
                    color: "#4891d9"
                }

                onValueChanged: {
                    txtInterval.text1=valueToString(value)
                }
                function valueToString(value){
                    var n = 15+value*105;
                    n = n.toFixed(1);
                    return n.toString();
                }
            }

            Label {
                id: label2
                width: 80
                height: 50
                color: "#ffffff"
                text: qsTr("Tasks:")
                anchors.left: parent.left
                anchors.top: label.bottom
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                anchors.leftMargin: 15
                anchors.topMargin: 35
                font.bold: false
            }

            CheckBox {
                id: checkBox
                property var txt: txtCB1.text
                anchors.verticalCenter: label2.verticalCenter
                anchors.left: label2.right
                anchors.top: label.bottom
                font.pixelSize: 16
                checked: true
                anchors.verticalCenterOffset: 15
                scale: 0.6
                checkState: Qt.Unchecked
                anchors.topMargin: 30
                anchors.leftMargin: 15
                Text {
                    id:txtCB1
                    text: "Radial deviation"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pixelSize: 22
                    anchors.verticalCenterOffset: 0
                    scale: 1
                    anchors.leftMargin: 40
                    color: "#ffffff"
                }

            }

            CheckBox {
                id: checkBox1
                property string txt: txtCB2.text
                anchors.verticalCenter: checkBox.verticalCenter
                anchors.left: checkBox.right
                anchors.top: label.bottom
                font.pixelSize: 16
                checked: true
                anchors.leftMargin: 83
                checkState: Qt.Unchecked
                scale: 0.6
                Text {
                    id:txtCB2
                    color: "#ffffff"
                    text: "Ulnar deviation"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pixelSize: 22
                    anchors.leftMargin: 40
                }
                anchors.topMargin: 30
            }

            CheckBox {
                id: checkBox2
                property string txt: txtCB3.text
                anchors.verticalCenter: label2.verticalCenter
                anchors.left: label2.right
                anchors.top: label.bottom
                font.pixelSize: 16
                checked: true
                anchors.horizontalCenter: checkBox.horizontalCenter
                anchors.leftMargin: 15
                checkState: Qt.Unchecked
                scale: 0.6
                Text {
                    id:txtCB3
                    color: "#ffffff"
                    text: "Rest"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pixelSize: 22
                    anchors.leftMargin: 40
                    scale: 1
                    anchors.verticalCenterOffset: 0
                }
                anchors.verticalCenterOffset: -10
                anchors.topMargin: 30
            }
            CheckBox {
                id: checkBox3
                property string txt: txtCB4.text
                anchors.verticalCenter: checkBox2.verticalCenter
                anchors.left: checkBox2.right
                anchors.top: label.bottom
                font.pixelSize: 16
                checked: true
                anchors.leftMargin: 20
                checkState: Qt.Unchecked
                scale: 0.6
                Text {
                    id:txtCB4
                    color: "#ffffff"
                    text: "Flexion"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pixelSize: 22
                    anchors.leftMargin: 40
                }
                anchors.topMargin: 30
            }
            CheckBox {
                id: checkBox4
                property string txt: txtCB5.text
                anchors.verticalCenter: checkBox3.verticalCenter
                anchors.left: checkBox3.right
                anchors.top: label.bottom
                font.pixelSize: 16
                checkable: true
                checked: true
                anchors.leftMargin: 25
                checkState: Qt.Unchecked
                scale: 0.6
                Text {
                    id:txtCB5
                    color: "#ffffff"
                    text: "Against gravity"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pixelSize: 22
                    anchors.leftMargin: 40
                }
                anchors.topMargin: 30
            }

            Label {
                id: label3
                width: 80
                height: 50
                color: "#ffffff"
                text: qsTr("Guidance video:")
                anchors.left: parent.left
                anchors.top: label2.bottom
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                anchors.leftMargin: 15
                font.bold: false
                anchors.topMargin: 10
            }

            RadioButton {
                id: rBtnVideo
                Text {
                    color: "#ffffff"
                    text: "Activated"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pixelSize: 22
                    anchors.leftMargin: 45
                }
                anchors.verticalCenter: label3.verticalCenter
                anchors.left: label3.right
                checked: false
                scale: 0.65
                anchors.leftMargin: 20
            }

            RadioButton {
                id: radioButton1
                anchors.verticalCenter: label3.verticalCenter
                anchors.left: rBtnVideo.right
                checked: true
                anchors.leftMargin: 80
                scale: 0.65
                Text {
                    color: "#ffffff"
                    text: "Deactivated"
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    font.pixelSize: 22
                    anchors.leftMargin: 45
                }
            }
            CustomButton {
                id: startBtn
                height: 30
                textValue: "Start"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: label5.bottom
                anchors.rightMargin: parent.width/2+30
                highlighted: false
                scale: 1.2
                anchors.leftMargin: 50
                anchors.topMargin: 15
                onClicked:{
                    startBtn.enabled=false
                    finishBtn.enabled=true

                    dial.enabled = false
                    console.log(dial.value)

                    btnHome.enabled=false
                    btnPatient.enabled=false
                    btnCollection.enabled=false
                    btnAnalysis.enabled=false
                    btnSettings.enabled=false

                    //animationOne.start()


                    collect_backend.start(dial.value,selectedTasks(),rBtnVideo.checked,rBtnAudio.checked) //self,interval,tasks,showVideo,showAudio
                    imgStatus.source= "../../images/svg_images/circle-64-green.png"
                    lblStatus.text="Reading data movements"

                }
            }

            CustomButton {
                id: finishBtn
                height: 30
                text: "Stop"
                textValue: "Finish"
                anchors.verticalCenter: startBtn.verticalCenter
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: label5.bottom
                colorMouseOver: "#7e0e1c"
                colorDefault: "#cf142b"
                anchors.topMargin: 15
                colorDisabled: "#b3dc9494"
                enabled: false
                anchors.leftMargin: parent.width/2+30
                anchors.rightMargin: 50
                highlighted: false
                scale: 1.2
                onClicked: {
                    startBtn.enabled=true
                    finishBtn.enabled=false

                    dial.enabled = true

                    btnHome.enabled=true
                    btnPatient.enabled=true
                    btnCollection.enabled=true
                    btnAnalysis.enabled=true
                    btnSettings.enabled=true

                    imgStatus.source= ""
                    imgStatus.source= "../../images/svg_images/circle-64-red.png"
                    lblStatus.text="Collection stop and saved"

                    collect_backend.stop(rBtnVideo.checked,rBtnAudio.checked)
                }
            }

            Image {
                id: imgStatus
                width: 24
                height: 24
                anchors.left: parent.left
                anchors.bottom: parent.bottom
                source: "../../images/svg_images/circle-64-gray.png"
                anchors.bottomMargin: 10
                anchors.leftMargin: 25
                visible: true
                fillMode: Image.PreserveAspectFit

                //PropertyAnimation { id: animationOne; target: imgStatus;alwaysRunToEnd: true; property: "opacity"; to: 1; duration: 500; onStopped: animationTwo.start()}
                //PropertyAnimation { id: animationTwo; target: imgStatus;alwaysRunToEnd: true; property: "opacity"; to: 0.2; duration: 500; onStopped: animationOne.start()}
            }

            Label {
                id: lblStatus
                height: 15
                color: "#ffffff"
                text: qsTr("Waiting to start...")
                anchors.verticalCenter: imgStatus.verticalCenter
                anchors.left: imgStatus.right
                anchors.right: parent.right
                font.pixelSize: 12
                anchors.rightMargin: 25
                anchors.leftMargin: 10
            }

            Label {
                id: label5
                width: 80
                height: 50
                color: "#ffffff"
                text: qsTr("Guidance sound:")
                anchors.left: parent.left
                anchors.top: label3.bottom
                font.pixelSize: 16
                horizontalAlignment: Text.AlignRight
                verticalAlignment: Text.AlignVCenter
                wrapMode: Text.Wrap
                anchors.topMargin: 10
                font.bold: false
                anchors.leftMargin: 15
            }

            Row {
                id: row
                width: 240
                height: 50
                anchors.verticalCenter: label5.verticalCenter
                anchors.left: label5.right
                anchors.leftMargin: 20

                RadioButton {
                    id: rBtnAudio
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: parent.left
                    Text {
                        color: "#ffffff"
                        text: "Activated"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        font.pixelSize: 22
                        anchors.leftMargin: 45
                    }
                    checked: false
                    scale: 0.65
                    anchors.leftMargin: 0
                }

                RadioButton {
                    id: radioButton3
                    anchors.verticalCenter: parent.verticalCenter
                    anchors.left: rBtnAudio.right
                    Text {
                        color: "#ffffff"
                        text: "Deactivated"
                        anchors.verticalCenter: parent.verticalCenter
                        anchors.left: parent.left
                        font.pixelSize: 22
                        anchors.leftMargin: 45
                    }
                    checked: true
                    anchors.leftMargin: 80
                    scale: 0.65
                }
            }


        }

        Column {
            id: column
            anchors.left: parent.left
            anchors.right: parent.right
            anchors.top: label1.bottom
            anchors.bottom: parent.bottom
            anchors.leftMargin: 2*parent.width/3-100
            clip: true
            anchors.topMargin: 15
            anchors.bottomMargin: 15
            anchors.rightMargin: 25

            Rectangle {
                id: rectangle1
                color: "#00000000"
                border.color: "#ffffff"
                border.width: 3
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 60
                anchors.topMargin: 25
                anchors.rightMargin: 15
                anchors.leftMargin: 15

                AnimatedImage {
                    id: animatedImage
                    anchors.fill: parent
                    source: "../../images/gifs/logo-white.gif"
                    anchors.rightMargin: 10
                    anchors.leftMargin: 10
                    anchors.bottomMargin: 10
                    anchors.topMargin: 10
                    fillMode: Image.PreserveAspectFit
                }
            }

            ProgressBar {
                id: progressBar
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: rectangle1.bottom
                spacing: 0
                height: 15
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                anchors.topMargin: 20
                from: 0
                to: 1
                value: 0
                background: Rectangle {
                    implicitWidth: 100
                    implicitHeight: 6
                    color: "#e6e6e6"
                    radius: 8
                }
                contentItem: Item {
                    anchors.top: parent.top
                    anchors.topMargin: 0
                    implicitWidth: 200
                    implicitHeight: 4

                    Rectangle {
                        width: progressBar.visualPosition * parent.width
                        height: parent.height
                        radius: 5
                        color: "#4891d9"
                    }
                }
            }
            MessageDialog {
                id: msgDialog
                title: "Overwrite?"
                icon: StandardIcon.Critical
                text: "file.txt already exists.  Replace?"
                standardButtons: StandardButton.Ok
                visible: false
            }
        }
        Connections{
            target: collect_backend

            function onProgressChanged(value){
                console.log(value)
                progressBar.value=value
            }

            function onUpdateGif(path){
                animatedImage.source=path
            }

            function onErrorStart(error){
                startBtn.enabled=true
                finishBtn.enabled=false

                dial.enabled = true

                btnHome.enabled=true
                btnPatient.enabled=true
                btnCollection.enabled=true
                btnAnalysis.enabled=true
                btnSettings.enabled=true

                imgStatus.source= ""
                imgStatus.source= "../../images/svg_images/circle-64-red.png"
                lblStatus.text="Collection starting failed"
                msgDialog.title="ERROR"
                msgDialog.text=error
                msgDialog.visible=true


            }
        }

    }
    property int i: 0
    property alias progressBar: progressBar
    function selectedTasks(){
        var tasks = []

        if (checkBox2.checked){
                  tasks.push(checkBox2.txt)
          }
        if (checkBox3.checked){
                  tasks.push(checkBox3.txt)
          }
        if (checkBox4.checked){
                  tasks.push(checkBox4.txt)
          }
        if(checkBox.checked){
            tasks.push(checkBox.txt)
        }
        if(checkBox1.checked){
                  tasks.push(checkBox1.txt)
          }
        return tasks
       }
}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.66;height:480;width:800}D{i:2}D{i:4}D{i:5}D{i:6}
D{i:7}D{i:9}D{i:8}D{i:10}D{i:12}D{i:11}D{i:14}D{i:13}D{i:16}D{i:15}D{i:18}D{i:17}
D{i:20}D{i:19}D{i:21}D{i:23}D{i:22}D{i:25}D{i:24}D{i:26}D{i:27}D{i:28}D{i:29}D{i:30}
D{i:33}D{i:32}D{i:35}D{i:34}D{i:31}D{i:3}D{i:38}D{i:37}D{i:39}D{i:43}D{i:36}D{i:44}
D{i:1}
}
##^##*/
