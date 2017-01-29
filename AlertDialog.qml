import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import de.skycoder42.quickextras 1.0

Dialog {
	id: alertDialog
	x: parent ? (parent.width - width) / 2 : 0
	y: parent ? deltaY() : 0
	width: parent ? Math.min(Math.max(implicitWidth, 300), parent.width - 28) : implicitWidth
	modal: true
	focus: true
	closePolicy: Popup.CloseOnEscape

	property real extraHeight: 0

	function deltaY() {
		var unscaled = Qt.inputMethod.keyboardRectangle.height / QuickExtras.scaleFactor;
		var availHeight = (parent.height + extraHeight) - unscaled - 28;//spacing
		var rawDelta = (Math.max(0, availHeight - height) / 2);
		return rawDelta + 14 - extraHeight;//spacing
	}
}
