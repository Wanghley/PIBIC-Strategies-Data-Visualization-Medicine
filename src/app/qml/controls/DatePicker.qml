import QtQuick 2.15
import QtQuick.Controls 2.15

Item {
    Rectangle {
        id: rectangle
        height: 40
        color: "#2c313c"
        anchors.fill: parent

        ComboBox {
            id: day
            x: 0
            y: 0
            width: 73
            height: 40

            property var dayModel: [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,28,29,30,31]

            currentIndex: -1
            displayText: currentIndex===-1?"01":currentText

            model: dayModel

        }

        ComboBox {
            id: month
            x: 74
            y: 0
            width: 73
            height: 40

            property var monthModel: ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'June', 'July', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec']

            currentIndex: -1
            displayText: currentIndex===-1?"01":currentText


            model: monthModel
        }

        ComboBox {
            id: year
            x: 148
            y: 0
            width: 117
            height: 40

            currentIndex: -1
            displayText: currentIndex===-1?new Date().getFullYear():currentText

            model: ListModel{
                id:yearModel
            }
        }

    }

    Component.onCompleted: {
        loadYears();
    }

    function loadYears() {
        var date = new Date();
        var currentYear = date.getFullYear();

        for (var i = currentYear; i >= currentYear-200; i--) {
            yearModel.append({"year" : i});
        }
    }

}

/*##^##
Designer {
    D{i:0;autoSize:true;formeditorZoom:1.3300000429153442;height:40;width:260}
}
##^##*/
