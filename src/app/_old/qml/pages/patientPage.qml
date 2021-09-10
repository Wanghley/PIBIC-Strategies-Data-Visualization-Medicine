import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import "../controls"
import Qt.labs.folderlistmodel 2.12
import Qt.labs.location 1.0
import Qt.labs.platform 1.1
import QtQuick.Dialogs 1.1

Item {
    id: patientPage
    anchors.centerIn: parent

    Rectangle {
        id: rectangle
        color: "#2c313c"
        anchors.fill: parent

        Column {
            id: column
            anchors.fill: parent
            anchors.leftMargin: 498

            Image {
                id: image1
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                anchors.bottom: parent.bottom
                source: "../../images/svg_images/profile-fig.svg"
                anchors.topMargin: 34
                anchors.bottomMargin: 34
                anchors.leftMargin: 15
                anchors.rightMargin: 15
                fillMode: Image.PreserveAspectFit
            }
        }

        Column {
            id: columnForm
            anchors.left: parent.left
            anchors.right: column.left
            anchors.top: parent.top
            anchors.bottom: parent.bottom
            anchors.rightMargin: 0
            anchors.topMargin: 0
            anchors.bottomMargin: 0
            anchors.leftMargin: 10

            Text {
                id: text1
                color: "#ffffff"
                text: qsTr("Patient Data")
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: parent.top
                font.pixelSize: 44
                horizontalAlignment: Text.AlignLeft
                verticalAlignment: Text.AlignVCenter
                anchors.rightMargin: 0
                anchors.topMargin: 25
                anchors.leftMargin: 10
                font.bold: true
            }

            Rectangle {
                id: rectangle1
                opacity: 1
                color: "#2affffff"
                anchors.left: parent.left
                anchors.right: parent.right
                anchors.top: text1.bottom
                anchors.bottom: parent.bottom
                anchors.bottomMargin: 30
                anchors.rightMargin: 15
                anchors.leftMargin: 10
                anchors.topMargin: 25
                radius: 10

                CustomButton{
                    id: btnSavePatientData
                    x: 105
                    y: 278
                    width: 146
                    height: 41
                    text: "SAVE"
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 15
                    onClicked: {
                        save_patient.savePatientData(txtName.text,rBtnFemale.checked,rBtnMale.checked,dateBirthday.selectedDate,rBtnYes.checked,rBtnNo.checked,txtPath.text)
                    }

                }

                Text {
                    id: text2
                    width: 95
                    height: 15
                    color: "#ffffff"
                    text: qsTr("NAME:")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignRight
                    anchors.topMargin: 31
                    anchors.leftMargin: 17
                    font.bold: true
                }

                CustomTextField{
                    id: txtName
                    y: 19
                    height: 40
                    anchors.left: text2.right
                    anchors.right: parent.right
                    anchors.leftMargin: 15
                    placeholderText: "e.g. Wanghley Soares Martins"
                    anchors.rightMargin: 70
                    clip: false

                }

                Text {
                    id: text3
                    width: 95
                    height: 15
                    color: "#ffffff"
                    text: qsTr("GENDER:")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignRight
                    font.bold: true
                    anchors.topMargin: 78
                    anchors.leftMargin: 17
                }

                RadioButton {
                    id: rBtnFemale
                    y: 65
                    text: qsTr("Female")
                    anchors.verticalCenter: text3.verticalCenter
                    anchors.left: text3.right
                    checked: true
                    checkable: true
                    anchors.leftMargin: 10
                }

                RadioButton {
                    id: rBtnMale
                    y: 65
                    text: qsTr("Male")
                    anchors.verticalCenter: rBtnFemale.verticalCenter
                    anchors.left: rBtnFemale.right
                    checkable: true
                    anchors.leftMargin: 45
                }

                Text {
                    id: text4
                    width: 95
                    height: 15
                    color: "#ffffff"
                    text: qsTr("BIRTHDAY:")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    horizontalAlignment: Text.AlignRight
                    anchors.leftMargin: 17
                    anchors.topMargin: 136
                    font.bold: true
                }

                DatePicker{
                    id: dateBirthday
                    y: 123
                    height: 42
                    anchors.left: text4.right
                    anchors.right: parent.right
                    anchors.rightMargin: 70
                    anchors.leftMargin: 15

                }

                Text {
                    id: text5
                    width: 95
                    height: 14
                    color: "#ffffff"
                    text: qsTr("PARKINSONIAN:")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    font.bold: true
                    anchors.topMargin: 188
                    anchors.leftMargin: 17
                }



                Rectangle {
                    id: rectangle2
                    y: 228
                    width: 266
                    height: 25
                    color: "#00000000"
                    radius: 8
                    border.color: "#2c313c"
                    border.width: 2
                    anchors.verticalCenter: text6.verticalCenter
                    anchors.left: text6.right
                    anchors.leftMargin: 15

                    TextInput {
                        id: txtPath
                        y: 0
                        width: 250
                        height: 25
                        color: "#ffffff"
                        text: qsTr("Select folder to save data...")
                        anchors.left: parent.left
                        font.pixelSize: 11
                        anchors.leftMargin: 8
                        topPadding: 4
                        selectedTextColor: "#000000"
                        antialiasing: false
                        readOnly: true
                        property alias text1: txtPath.text

                        FolderDialog {
                            id: folderDialog
                            currentFolder: viewer.folder
                            folder: StandardPaths.standardLocations(StandardPaths.DesktopLocation)[0]
                            onAccepted: {
                                var path = txtPath.urlToPath(folderDialog.currentFolder.toString());
                                console.log(path)
                                folderDialog.close()
                            }
                        }

                        MouseArea {
                            anchors.fill: parent
                            propagateComposedEvents: true

                            onClicked: {
                                folderDialog.open()
                            }
                        }
                        function urlToPath(urlString) {
                            var s
                            if (urlString.startsWith("file:///")) {
                                var k = urlString.charAt(9) === ':' ? 8 : 7
                                s = urlString.substring(k)
                            } else {
                                s = urlString
                            }
                            txtPath.text1=s;
                        }
                    }
                }



                RowLayout {
                    id: rowLayout
                    x: -10
                    y: 150
                    height: 40
                    anchors.verticalCenter: text5.verticalCenter
                    anchors.left: text5.right
                    anchors.right: parent.right
                    anchors.rightMargin: 70
                    anchors.leftMargin: 10

                    RadioButton {
                        id: rBtnYes
                        x: 148
                        y: 179
                        text: qsTr("Yes")
                        checked: true
                    }
                    RadioButton {
                        id: rBtnNo
                        x: 148
                        y: 179
                        text: qsTr("No")
                        checked: false
                    }
                }



                Text {
                    id: text6
                    width: 95
                    height: 14
                    color: "#ffffff"
                    text: qsTr("SAVING FOLDER:")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.topMargin: 231
                    font.bold: true
                    anchors.leftMargin: 17
                }

            }
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
            target: save_patient
            function onPatientData(success,error){
                if(success){
                    msgDialog.title="Success"
                    msgDialog.text="File created successfully. Select a bluetooth device to start the collection!"
                    msgDialog.visible=true
                    btnHome.isActiveMenu = false
                    btnPatient.isActiveMenu=false
                    btnCollection.isActiveMenu=false
                    btnAnalysis.isActiveMenu=false
                    btnSettings.isActiveMenu=true
                    homePageView.visible=false
                    patientPageView.visible=false
                    collectPageView.visible=false
                    settingsPageView.visible=true
                } else{
                    msgDialog.title="ERROR"
                    msgDialog.text="File NOT created. "+error
                    msgDialog.icon=StandardIcon.Critical
                    msgDialog.visible=true
                }
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.75;height:480;width:800}
}
##^##*/
