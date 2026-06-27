import QtQuick
import Quickshell
import ".."

// Rectangle {
//   id: root
//   required property var theme
//   required property string font
//
//   height: 24
//   width: timeDate.width + 16
//   radius: 12
//   color: theme.bgSurface
//
//   Row {
//     id: timeDate
//     anchors.centerIn: parent
//     spacing: 8
//
//     Text {
//       anchors.verticalCenter: parent.verticalCenter
//       text: Time.timeString
//       color: root.theme.textPrimary
//       font.pixelSize: 12
//       font.family: root.font
//     }
//
//     Text {
//       anchors.verticalCenter: parent.verticalCenter
//       text: Time.dateString
//       color: root.theme.textSecondary
//       font.pixelSize: 12
//       font.family: root.font
//     }
//   }
// }


Rectangle {
  id: root
  required property var theme
  required property string font

  height: 24
  width: hovered ? timeDate.width + 16 : timeOnly.width + 16
  radius: 12
  color: theme.bgSurface

  property bool hovered: false

  Behavior on width {
    NumberAnimation {
      duration: 300
      easing.type: Easing.InOutQuad
    }
  }

  HoverHandler {
    onHoveredChanged: {
      root.hovered = hovered
      if (hovered) {
        timeOnly.opacity = 0
        showDateDelay.restart()
      } else {
        showDateDelay.stop()
        timeDate.opacity = 0
        timeOnly.opacity = 1
      }
    }
  }

  Timer {
    id: showDateDelay
    interval: 180
    onTriggered: timeDate.opacity = 1
  }

  Text {
    id: timeOnly
    anchors.centerIn: parent
    visible: opacity > 0
    opacity: 1
    text: Time.timeString
    color: root.theme.textPrimary
    font.pixelSize: 12
    font.family: root.font

    Behavior on opacity {
      NumberAnimation { duration: 80 }
    }
  }

  Row {
    id: timeDate
    anchors.centerIn: parent
    spacing: 8
    visible: opacity > 0
    opacity: 0

    Text {
      anchors.verticalCenter: parent.verticalCenter
      text: Time.timeString
      color: root.theme.textPrimary
      font.pixelSize: 12
      font.family: root.font
    }

    Text {
      anchors.verticalCenter: parent.verticalCenter
      text: Time.dateString
      color: root.theme.textSecondary
      font.pixelSize: 12
      font.family: root.font
    }

    Behavior on opacity {
      NumberAnimation { duration: 80 }
    }
  }
}
