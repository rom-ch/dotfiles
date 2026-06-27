import QtQuick
import Quickshell.Io
import ".."

Rectangle {
  id: root
  required property var theme
  required property string font

  // Brightness state
  property real brightnessValue: 0
  property real brightnessMax: 1

  height: 24
  width: brightContent.width + 12
  radius: 12
  color: theme.bgSurface
  visible: brightnessFile.path !== ""

  Accessible.role: Accessible.StaticText
  Accessible.name: "Brightness: " + Math.round(root.brightnessValue * 100) + "%"


  FileView {
    id: brightnessFile
    path: ""
    watchChanges: true
    onFileChanged: brightnessReadProc.running = true
  }

  Process {
    id: brightnessReadProc
    command: ["brightnessctl", "get"]
    running: false
    stdout: StdioCollector {
      onStreamFinished: {
        const val = parseInt(text.trim());
        if (!isNaN(val) && root.brightnessMax > 0)
        root.brightnessValue = val / root.brightnessMax;
      }
    }
  }

  Process {
    id: brightnessSetProc
    running: false
  }

  Process {
    id: backlightDiscovery
    command: ["sh", "-c", "p=$(ls -d /sys/class/backlight/*/brightness 2>/dev/null | head -1); [ -n \"$p\" ] && echo \"$p\" && cat \"${p%brightness}max_brightness\""]
    running: true
    stdout: StdioCollector {
      onStreamFinished: {
        const lines = text.trim().split("\n");
        if (lines.length >= 2) {
          const max = parseInt(lines[1]);
          if (!isNaN(max) && max > 0) root.brightnessMax = max;
          brightnessFile.path = lines[0];
          brightnessReadProc.running = true;
        }
      }
    }
  }
  Row {
    id: brightContent
    anchors.centerIn: parent
    spacing: 6

    Text {
      anchors.verticalCenter: parent.verticalCenter
      text: "󰃠"
      color: root.theme.accentOrange
      font.pixelSize: 14
      font.family: root.font
    }

    Text {
      anchors.verticalCenter: parent.verticalCenter
      text: Math.round(root.brightnessValue * 100) + "%"
      color: root.theme.textPrimary
      font.pixelSize: 11
      font.family: root.font
    }
  }

  MouseArea {
    anchors.fill: parent
    cursorShape: Qt.PointingHandCursor
    onWheel: (wheel) => {
      brightnessSetProc.command = wheel.angleDelta.y > 0
      ? ["brightnessctl", "set", "5%+"]
      : ["brightnessctl", "set", "5%-"];
      brightnessSetProc.running = true;
    }
  }
}
