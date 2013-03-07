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
        objectName: "page"

        tools: ToolbarActions {
            Action {
                objectName: "action"

                iconSource: Qt.resolvedUrl("img/avatar.png")
                text: i18n.tr("Options")

                onTriggered: {
                    label.text = i18n.tr("Toolbar tapped")
                }
            }

            Action {
                objectName: "contactsAction"

                iconSource: Qt.resolvedUrl("img/avatar.png")
                text: i18n.tr("Contacts")

                onTriggered: {
                    flipable.showContacts()
                }
            }
        }

        MsgFlipable {
            objectName: "flipable"
            id: flipable

            anchors.fill: parent

            front: ContactsView { }
            back: ChatView { }

        }

    }
}
