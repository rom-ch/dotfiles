//@ pragma UseQApplication

import Quickshell
import Quickshell.Io
import QtQuick
import "appLauncher"
import "bar"
import "wallpaper"
import "osd"
import "notifications"

Scope {
  Bar {}
  AppLauncher {}
  WallpaperManager {}
  OSD {}
  NotificationPopup {}
}
