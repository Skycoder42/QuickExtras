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

	header: ActionBar {
		title: root.title

		AppBarButton {
			id: testButton
			imageSource: "image://svg/de/skycoder42/quickextras/icons/ic_arrow_back"
			text: "Click me"

			onClicked: dialog.open()
		}

		moreMenu: Menu {
			MenuItem {
				text: qsTr("About")
			}

			MenuItem {
				text: qsTr("Hello World")
			}
		}
	}

	AlertDialog {
		id: dialog
		title: "Hello Tree!"
		standardButtons: Dialog.Ok
	}
}
