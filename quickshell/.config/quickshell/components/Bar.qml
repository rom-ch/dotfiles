import Quickshell
import Quickshell.Wayland
import QtQuick
import QtQuick.Effects
import "../"

Scope {
    id: root
    required property var modelData

    property int height: 38
    property int anchor: Edges.Top

    property list<Item> left: []
    property list<Item> center: []
    property list<Item> right: []

    PanelWindow {
        id: window
        screen: modelData

        anchors {
            left: true
            right: true
            top: root.anchor === Edges.Top
            bottom: root.anchor === Edges.Bottom
        }

        implicitHeight: root.height
        color: "transparent"

        Rectangle {
            id: bar
            anchors.fill: parent
            color: Theme.colors.base || "#000000"
            opacity: 0.85

            Rectangle {
                anchors {
                    top: window.anchors.top ? undefined : parent.top
                    bottom: window.anchors.top ? parent.bottom : undefined
                }
                width: parent.width
                height: 2
                color: Theme.colors.light || "#f1f1f1"
                opacity: 0.2
            }

            Rectangle {
                anchors {
                    top: window.anchors.top ? undefined : parent.top
                    bottom: window.anchors.top ? parent.bottom : undefined
                }

                width: parent.width
                height: 1
                color: Theme.colors.dark || "#000000"
                opacity: 0.2
            }
        }

        Row {
            id: rowLeft
            anchors.verticalCenter: parent.verticalCenter
            leftPadding: Theme.padding
            spacing: Theme.spacing *2
            height: parent.height
            Component.onCompleted: { for (const w of root.left) {
                w.parent = rowLeft;
                w.anchors.verticalCenter = rowLeft.verticalCenter;
                w.children.forEach(c => {
                    if (c.hasOwnProperty('anchor')) c.anchor = root.anchor;
                })
            }}
        }

        // center items
        Row {
            id: rowCenter
            anchors {
                horizontalCenter: parent.horizontalCenter
                verticalCenter: parent.verticalCenter
            }
            spacing: Theme.spacing *2
            height: parent.height
            Component.onCompleted: { for (const w of root.center) {
                w.parent = rowCenter;
                w.anchors.verticalCenter = rowCenter.verticalCenter;
                w.children.forEach(c => {
                    if (c.hasOwnProperty('anchor')) c.anchor = root.anchor;
                })
            }}
        }

        // right items
        Row { 
            id: rowRight
            anchors {
                right: parent.right
                verticalCenter: parent.verticalCenter
            }
            rightPadding: Theme.padding
            spacing: Theme.spacing *2
            height: parent.height
            Component.onCompleted: { for (const w of root.right) {
                w.parent = rowRight;
                w.anchors.verticalCenter = rowRight.verticalCenter;
                w.children.forEach(c => {
                    if (c.hasOwnProperty('anchor')) c.anchor = root.anchor;
                })
            }}
        }
    }
}
