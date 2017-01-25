import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Window 2.2
import com.skycoder42.quickextras 1.0

Dialog {
	id: alertDialog
	x: parent ? (parent.width - width) / 2 : 0
	y: parent ? deltaY() : 0
	implicitWidth: parent ? Math.min(300, parent.width - 56) : 300
	modal: true
	focus: true
	closePolicy: Popup.CloseOnEscape

	function deltaY() {
		var unscaled = Qt.inputMethod.keyboardRectangle.height / QuickExtras.scaleFactor;
		var availHeight = parent.height - unscaled - 28;//spacing
		if(parent.header)
			availHeight += parent.header.height;
		if(parent.footer)
			availHeight += parent.footer.height;
		return (Math.max(0, availHeight - height) / 2) + 14;
	}
}
