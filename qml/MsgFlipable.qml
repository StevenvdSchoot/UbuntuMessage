import QtQuick 2.0
import Ubuntu.Components 0.1

Flipable {
    property bool flipped: false

    transform: Rotation {
        id: rotation

        origin.x: flipable.width / 2
        origin.y: flipable.height / 2
        origin.z: 0

        axis.x: 0
        axis.y: 1
        axis.z: 0

        angle: 0
    }

    states: State {
        name: "back"
        PropertyChanges { target: rotation; angle: 180 }
        when: flipable.flipped
    }

    transitions: Transition {
        NumberAnimation { target: rotation; property: "angle"; duration: 256 }
    }

    function flip () {
        flipable.flipped = !flipable.flipped
    }

    function showContacts() {
        flipable.flipped = false
    }

    function showChat() {
        flipable.flipped = true
    }
}
