import QtQuick 2.15
import QtGraphicalEffects 1.15
import QtQuick.Window 2.15
import QtQuick.Controls 2.15
import QtQuick.Layouts 1.11
import "../controls"
import Qt.labs.folderlistmodel 2.12
import Qt.labs.location 1.0
import Qt.labs.platform 1.1

Item {
    id: patientPage
    property alias rectangle2: rectangle2
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
                    id: testee
                    x: 105
                    y: 278
                    width: 146
                    height: 41
                    text: "SAVE"
                    anchors.bottom: parent.bottom
                    anchors.horizontalCenterOffset: 0
                    anchors.horizontalCenter: parent.horizontalCenter
                    anchors.bottomMargin: 15

                }

                Text {
                    id: text2
                    color: "#ffffff"
                    text: qsTr("NAME:")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.topMargin: 31
                    anchors.leftMargin: 17
                    font.bold: true
                }

                CustomTextField{
                    x: 118
                    y: 19
                    width: 266
                    height: 40
                    anchors.right: parent.right
                    placeholderText: "e.g. Wanghley Soares Martins"
                    anchors.rightMargin: 74
                    clip: false

                }

                Text {
                    id: text3
                    color: "#ffffff"
                    text: qsTr("GENDER:")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    font.bold: true
                    anchors.topMargin: 78
                    anchors.leftMargin: 17
                }

                RadioButton {
                    id: radioButton
                    x: 113
                    y: 65
                    text: qsTr("Female")
                }

                RadioButton {
                    id: radioButton1
                    x: 246
                    y: 65
                    text: qsTr("Male")
                }

                Text {
                    id: text4
                    color: "#ffffff"
                    text: qsTr("BIRTHDAY:")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.leftMargin: 17
                    anchors.topMargin: 136
                    font.bold: true
                }

                DatePicker{
                    x: 118
                    y: 123
                    width: 266
                    height: 42

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
                    x: 118
                    y: 228
                    width: 266
                    height: 25
                    color: "#00000000"
                    radius: 8
                    border.color: "#2c313c"
                    border.width: 2

                    TextInput {
                        id: textInput
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
                        property alias text1: textInput.text

                        FolderDialog {
                            id: folderDialog
                            currentFolder: viewer.folder
                            folder: StandardPaths.standardLocations(StandardPaths.PicturesLocation)[0]
                            onAccepted: {
                                var path = textInput.urlToPath(folderDialog.currentFolder.toString());
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
                            textInput.text1=s;
                        }
                    }
                }

                RadioButton {
                    id: radioButton2
                    x: 118
                    y: 175
                    text: qsTr("Yes")
                }


                RadioButton {
                    id: radioButton3
                    x: 213
                    y: 175
                    text: qsTr("No")
                }


                Text {
                    id: text6
                    width: 95
                    height: 14
                    color: "#ffffff"
                    text: qsTr("LOCATION:")
                    anchors.left: parent.left
                    anchors.top: parent.top
                    font.pixelSize: 12
                    anchors.topMargin: 231
                    font.bold: true
                    anchors.leftMargin: 17
                }
            }
        }
    }
}



/*##^##
Designer {
    D{i:0;formeditorZoom:0.5;height:480;width:800}D{i:3}
}
##^##*/
