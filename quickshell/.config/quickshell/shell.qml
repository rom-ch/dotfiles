import Quickshell
import QtQuick
import "components"

ShellRoot {
    Variants {
        model: Quickshell.screens

        Bar {
            height: 38
            anchor: Edges.Top

            left: [
                Workspaces {}
            ]

            center: [
                ClockWidget {}
            ]
            
            right: [
                Network {}
            ]
        }
    }
}
