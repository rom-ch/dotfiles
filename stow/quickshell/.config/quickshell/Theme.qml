pragma Singleton
import QtQuick
import Quickshell
import Quickshell.Io

Singleton {
    id: root

    property var colors: ({})

    // Controls
    property int padding: 12
    property int spacing: 4
    property int radius: 8
    property int iconSize: 16

    // Fonts
    property string fontSans: "Adwaita Sans"
    property string fontMono: "JetBrainsMono Nerd Font"

    FileView {
        id: themeFile
        path: Qt.resolvedUrl("./themes/catppuccin.json")
        onTextChanged: root.colors = JSON.parse(themeFile.text())
    }
}
