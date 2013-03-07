import QtQuick 2.0
import Ubuntu.Components 0.1
import Ubuntu.Components.ListItems 0.1 as ListItem

Column {
    anchors.fill: parent
    anchors.margins: 0

    ListView {
        id: chatview
        height: parent.height - newmessage.height
        width: parent.width
        anchors.top: parent.top

        model: ChatList {}
        delegate: ListItem.Standard {
            text: name + ": " + msg
        }
    }

    Rectangle {
        id: newmessage
        anchors.bottom: parent.bottom
        width: parent.width
        height: units.gu(12)

        /*
        Button {
            objectName: "button"

            text: "Tap me!"

            onClicked: {
                if(label.text=="..world!")
                    label.text = "Hello.."
                else
                    label.text = "..world!"
                CppHandler.test();
            }
        }
        */

        Button {
            id: sendBtn
            anchors.right: parent.right
            anchors.margins: units.gu(1)
            anchors.bottom: parent.bottom
            // anchors.top: parent.top + (parent.height - height) / 2
            objectName: "sendBtn"

            text: "Send"

            onClicked: {
                CppHandler.test(textarea.text);
                flipable.flip();
            }
        }

        TextArea {
            id: textarea
            width: parent.width - sendBtn.width - units.gu(2)
            anchors.margins: units.gu(1)
        }

    }
}
