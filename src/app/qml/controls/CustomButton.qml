import QtQuick 2.15
import QtQuick.Controls 2.15
import QtGraphicalEffects 1.15

Button {
    id: button

    // Custom Properties
    property color colorDefault: "#4891d9"
    property color colorDisabled: "#93b7db"
    property color colorMouseOver: "#55AAFF"
    property color colorPressed: "#3F7EBD"
    property alias iconPath: image.source
    property alias iconVisibility: image.visible
    property int fontSize: 15

    QtObject{
        id: internal
        property var dynamicColor: if(button.down){
                                       button.down ? colorPressed : colorDefault
                                   }else if(!button.enabled){
                                       button.enabled?colorDefault:colorDisabled
                                    }else{
                                       button.hovered ? colorMouseOver : colorDefault
                                   }
    }

    text: qsTr("Button")
    property alias textValue: button.text
    contentItem: Item{
        Text {
            id: name
            text: button.text
            font: button.font
            color: "#ffffff"
            minimumPixelSize: fontSize
            anchors.verticalCenter: parent.verticalCenter
            anchors.horizontalCenter: parent.horizontalCenter
        }

        Image {
            id: image
            anchors.fill: parent
            source: ""
            visible: false
            z: -1
            fillMode: Image.PreserveAspectFit
            ColorOverlay {
                id: overlay
                anchors.fill: image
                source: image
                color: "#ffffff"
            }
        }
    }

    background: Rectangle{
        color: internal.dynamicColor
        radius: 10
    }
}
/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:0.75;height:480;width:640}D{i:4}
}
##^##*/
