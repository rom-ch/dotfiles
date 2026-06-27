pragma Singleton

import Quickshell
import QtQuick

Singleton {
  id: root

  readonly property string timeString: {
    Qt.formatDateTime(clock.date, "hh:mm")
  }

  readonly property string dateString: {
    Qt.formatDateTime(clock.date, "ddd dd MMM yy")
  }

  SystemClock {
      id: clock
      precision: SystemClock.Minutes
  }
}
