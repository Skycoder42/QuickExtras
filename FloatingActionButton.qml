import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtQuick.Controls.Material 2.1
import de.skycoder42.quickextras 2.0

RoundButton {
	id: fab
	height: fab.size
	width: fab.size
	highlighted: true

	property alias imageSource: tintIcon.source
	property alias tintColor: tintIcon.tintColor
	property double size: 72.0

	QtObject {
		id: p

		property bool toolTipVisible: false
	}

	contentItem: TintIcon {
		id: tintIcon
		implicitHeight: fab.size
		implicitWidth: fab.size
		iconSize: Qt.size(fab.size/2, fab.size/2)
	}

	ToolTip {
		parent: fab
		Material.foreground: "#FFFFFF"
		visible: p.toolTipVisible
		text: fab.text
	}

	onPressAndHold: {
		QuickExtras.hapticLongPress();
		p.toolTipVisible = true;
	}
	onCanceled: p.toolTipVisible = false
	onReleased: p.toolTipVisible = false
}
