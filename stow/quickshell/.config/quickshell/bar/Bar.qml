import Quickshell
import QtQuick
import QtQuick.Layouts
import Quickshell.Hyprland
import Quickshell.Io
import Quickshell.Services.Pipewire
import "components"

Scope {
  id: root
  property var theme: DefaultTheme {}
  property string font: "Hack Nerd Font"
  property bool barVisible: true

  IpcHandler {
    target: "bar"
    function toggle(): void { root.barVisible = !root.barVisible; }
  }

  PwObjectTracker {
    objects: [Pipewire.defaultAudioSink]
  }

  Variants {
    model: Quickshell.screens

    PanelWindow {
      required property var modelData
      screen: modelData
      visible: root.barVisible

      anchors {
        top: true
        left: true
        right: true
      }
      implicitHeight: 32
      color: root.theme.bgBase

      Item {
        anchors.fill: parent
        anchors.leftMargin: 10
        anchors.rightMargin: 10

        Workspaces {
          anchors.left: parent.left
          anchors.verticalCenter: parent.verticalCenter
          theme: root.theme
          font: root.font
        }

        Clock {
          anchors.centerIn: parent
          theme: root.theme
          font: root.font
        }

        Row {
          anchors.right: parent.right
          anchors.verticalCenter: parent.verticalCenter
          spacing: 8

          Volume { theme: root.theme; font: root.font }
          Brightness { theme: root.theme; font: root.font }
          Network { theme: root.theme; font: root.font }
          Loader {
            active: SystemInfo.hasBattery
            sourceComponent: Battery {
              theme: root.theme
              font: root.font
            }
          }
          Tray {theme: root.theme }
        }
      }
    }
  }
}
