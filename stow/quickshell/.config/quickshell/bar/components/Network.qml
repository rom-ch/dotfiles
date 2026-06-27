import QtQuick
import ".."

Rectangle {
  id: root
  required property var theme
  required property string font

  height: 24
  width: netContent.width + 12
  radius: 12
  color: theme.bgSurface

  Accessible.role: Accessible.StaticText
  Accessible.name: {
    if (SystemInfo.networkType === "ethernet") return "Network: Ethernet"
    if (SystemInfo.networkType === "wifi") return "Network: WiFi " + SystemInfo.networkInfo
    return "Network: Disconnected"
  }

  Row {
    id: netContent
    anchors.centerIn: parent
    spacing: 6

    Text {
      anchors.verticalCenter: parent.verticalCenter
      text: {
        if (SystemInfo.networkType === "ethernet") return "󰈀"
        if (SystemInfo.networkType === "wifi") return "󰖩"
        return "󰖪"
      }
      color: SystemInfo.networkType === "disconnected" ? root.theme.textMuted : root.theme.accentGreen
      font.pixelSize: 14
      font.family: root.font
    }
    Text {
      anchors.verticalCenter: parent.verticalCenter
      text: SystemInfo.networkInfo
      color: root.theme.textPrimary
      font.pixelSize: 11
      font.family: root.font
    }
  }
}
