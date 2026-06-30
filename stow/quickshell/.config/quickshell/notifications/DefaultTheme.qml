import QtQuick

QtObject {
  readonly property color bgBase:     "#0d0d0d"
  readonly property color bgSurface:  "#1a1a1a"
  readonly property color bgHover:    "#2e2e2e"
  readonly property color bgSelected: "#383838"
  readonly property color bgOverlay:  "#88000000"
  readonly property color bgBorder:    "#333333"

  readonly property color textPrimary:   "#f0f0f0"
  readonly property color textSecondary: "#a8a8a8"
  readonly property color textMuted:  "#606060"

  readonly property color accentPrimary: "#5294e2"
  readonly property color accentCyan:    "#3dbcbf"
  readonly property color accentGreen:   "#5dbe6e"
  readonly property color accentOrange:  "#e8a24a"
  readonly property color accentRed:     "#e05555"

  readonly property color urgencyLow:      textMuted
  readonly property color urgencyNormal:   accentPrimary
  readonly property color urgencyWarning:  accentOrange
  readonly property color urgencyCritical: accentRed

  readonly property color batteryGood:     accentGreen
  readonly property color batteryWarning:  accentOrange
  readonly property color batteryCritical: accentRed
}
