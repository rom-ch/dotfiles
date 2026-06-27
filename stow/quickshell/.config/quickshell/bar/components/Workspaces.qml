import QtQuick
import Quickshell.Hyprland

Row {
  id: root
  required property var theme
  required property string font

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

    Behavior on color {
      ColorAnimation { duration: 250 }
    }

    MouseArea {
      anchors.fill: parent
      onClicked: Hyprland.dispatch("hl.dsp.focus({ workspace = " + (index + 1) + " })")
    }
  }

  Repeater {
    model: 5
    Pill {
      property var ws: Hyprland.workspaces.values.find(w => w.id === index + 1)
      property bool isActive: Hyprland.focusedWorkspace?.id === (index + 1) 
      active: isActive
      color: ws ? root.theme.accentPrimary : root.theme.textMuted
    }
  }
}
