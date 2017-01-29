import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import QtGraphicalEffects 1.0
import QtQuick.Controls.Material 2.1
import de.skycoder42.quickextras 1.0

ToolButton {
	id: toolButton
	implicitHeight: toolButton.size
	implicitWidth: toolButton.size
	opacity: enabled ? 1.0 : 0.5

	property alias imageSource: tintIcon.source
	property alias tintColor: tintIcon.tintColor
	property double size: 56.0

	QtObject {
		id: p

		property bool toolTipVisible: false
	}

	contentItem: TintIcon {
		id: tintIcon
		implicitHeight: toolButton.size
		implicitWidth: toolButton.size
	}

	ToolTip {
		parent: toolButton
		Material.foreground: "#FFFFFF"
		visible: p.toolTipVisible
		text: toolButton.text
	}

	onPressAndHold: {
		QuickExtras.hapticFeedback();
		p.toolTipVisible = true;
	}
	onCanceled: p.toolTipVisible = false
	onReleased: p.toolTipVisible = false
}
