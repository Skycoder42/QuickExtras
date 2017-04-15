import QtQuick 2.8
import QtQuick.Controls 2.1
import de.skycoder42.quickextras 1.0

Drawer {
	id: drawer

	property var hideHeader: null

	y: hideHeader ?  hideHeader.height : 0
	height: parent.height - y
	width: Math.min(300, parent.width - 24);

	function toggle() {
		if(visible)
			close();
		else
			open();
	}
}
