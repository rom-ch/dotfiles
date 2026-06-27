import QtQuick
import ".."

// Battery
Rectangle {
  id: root
  required property var theme
  required property string font
  readonly property color batteryColor: {
    if (SystemInfo.batteryCharging) return root.theme.accentGreen;
    if (SystemInfo.batteryLevelRaw > 20) return root.theme.batteryGood;
    if (SystemInfo.batteryLevelRaw > 10) return root.theme.batteryWarning;
    return root.theme.batteryCritical;
  }

  height: 24
  width: battContent.width + 12
  radius: 12
  color: theme.bgSurface
  Accessible.role: Accessible.StaticText
  Accessible.name: "Battery: " + SystemInfo.batteryLevel

  Row {
    id: battContent
    anchors.centerIn: parent
    spacing: 6

    Text {
      anchors.verticalCenter: parent.verticalCenter
      text: SystemInfo.batteryIcon
      color: root.batteryColor
      font.pixelSize: 14
      font.family: root.font
    }
    Text {
      anchors.verticalCenter: parent.verticalCenter
      text: SystemInfo.batteryLevel
      color: root.theme.textPrimary
      font.pixelSize: 11
      font.family: root.font
    }
  }
}
