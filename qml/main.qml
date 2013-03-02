import QtQuick 2.0
import Ubuntu.Components 0.1

/*!
    \brief A Hello World application with a functional tests with autopilot-qt
*/

MainView {
    // objectName for functional testing purposes (autopilot-qt5)
    objectName: "mainView"

    width: units.gu(50)
    height: units.gu(75)

    Page {

        tools: ToolbarActions {
            Action {
                objectName: "action"

                iconSource: Qt.resolvedUrl("img/avatar.png")
                text: i18n.tr("Options")

                onTriggered: {
                    label.text = i18n.tr("Toolbar tapped")
                }
            }
        }

        MsgFlipable {
            id: flipable
            anchors.fill: parent

            front: Column {
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

            back: Column {
                anchors.fill: parent
                anchors.margins: units.gu(2)

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
        }

    }
}
