import QtQuick
import "../"

Text {
    text: Time.time
    color: Theme.colors.text || "#f1f1f1"
    font {
        family: Theme.fontMono
        pixelSize: 12
        weight: 600
    }
}
