import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem

Column {
    anchors.fill: parent
    anchors.margins: units.gu(2)

    Label {
        id: label
        objectName: "label"

        text: "Hello.."
    }

    Button {
        anchors.centerIn: parent
        objectName: "button"
        width: parent.width

        text: "Flip"

        onClicked: {
            flipable.flip();
        }
    }

}
