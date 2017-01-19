import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1

RoundButton {
	id: fab
	height: fab.size
	width: fab.size
	highlighted: true

	property alias imageSource: image.source
	property double size: 56.0

	QtObject {
		id: p

		property bool toolTipVisible: false
	}

	contentItem: Item {
		id: imageWrapper
		implicitHeight: fab.size
		implicitWidth: fab.size

		Image {
			id: image
			anchors.centerIn: parent
			fillMode: Image.PreserveAspectFit
			horizontalAlignment: Image.AlignHCenter
			verticalAlignment: Image.AlignVCenter
			width: 24
			height: 24
		}
	}

	ToolTip {
		parent: fab
		Material.foreground: "#FFFFFF"
		visible: p.toolTipVisible
		text: fab.text
	}

	onPressAndHold: p.toolTipVisible = true
	onCanceled: p.toolTipVisible = false
	onReleased: p.toolTipVisible = false
}
