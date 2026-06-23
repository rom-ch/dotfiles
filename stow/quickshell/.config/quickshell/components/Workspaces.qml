import Quickshell
import Quickshell.Hyprland
import QtQuick
import "../"

Row {
    spacing: 6

    component Pill: Rectangle {
        property bool active: false

        width: active ? 30 : 10
        height: 10 
        radius: height / 2

        Behavior on width {
            NumberAnimation {
                duration: 250
                easing.type: Easing.OutCubic
            }
        }
    }

    Repeater {
        model: 6


        Pill {
            property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
            property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1)

            active: isActive
            color: ws ? Theme.colors.text || "#f1f1f1" : Theme.colors.light || "#f1f1f1"

            MouseArea {
                anchors.fill: parent
                onClicked: Hyprland.dispatch("workspace " + (index + 1))
            }
        }
    }
}
