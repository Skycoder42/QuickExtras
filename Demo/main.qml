import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0
import de.skycoder42.quickextras 1.0

ApplicationWindow {
	id: root
	visible: true
	width: 640
	height: 480
	title: qsTr("Quick-Extras Demo")

	StackView {
		anchors.fill: parent

		initialItem: MainPage {}
	}

}
