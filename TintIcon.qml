import QtQuick 2.8
import QtGraphicalEffects 1.0
import de.skycoder42.quickextras 1.0

Item {
	id: tintIcon

	property size iconSize: Qt.size(24, 24)
	property alias tintColor: overlay.color
	property alias source: image.source

	Image {
		id: image
		anchors.centerIn: parent
		fillMode: Image.PreserveAspectFit
		horizontalAlignment: Image.AlignHCenter
		verticalAlignment: Image.AlignVCenter
		width: iconSize.width
		height: iconSize.height
		sourceSize: iconSize
		visible: false
	}

	ColorOverlay {
		id: overlay
		anchors.fill: image
		source: image
		color: CommonStyle.foreground
	}
}
