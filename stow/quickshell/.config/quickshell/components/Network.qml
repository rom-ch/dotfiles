import Quickshell
import Quickshell.Io
import QtQuick
import "../"

Item {
    id: root
    width: wifiIcon.width
    height: wifiIcon.height

    Text {
        id: wifiIcon
        text: ""
        font.pixelSize: 14
        color: Theme.colors.text || "#f1f1f1"

        // ToolTip.visible: wifiMouse.containsMouse
        // ToolTip.text: "Network (impala)"

        MouseArea {
            id: wifiMouse
            anchors.fill: parent
            hoverEnabled: true
            cursorShape: Qt.PointingHandCursor
            onClicked:{
                impalaProcess.running = false
                impalaProcess.running = true

            }
        }
    }

    Process {
        id: impalaProcess
        command: ["kitty", "-e", "impala"]
    }
}
