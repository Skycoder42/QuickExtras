import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0
import de.skycoder42.quickextras 1.0

Page {
	id: page
	header: ActionBar {
		title: qsTr("Quick-Extras Demo")

		onMenuButtonClicked: drawer.toggle()
		showMenuAsBack: drawer.visible

		AppBarButton {
			id: testButton
			imageSource: "image://svg/de/skycoder42/quickextras/icons/ic_arrow_back"
			text: "Click me"
			checkable: true
		}

		moreMenu: Menu {
			MenuItem {
				text: qsTr("About")
			}

			MenuItem {
				text: qsTr("Hello World")

				onClicked: dialog.open()
			}
		}

		tabBar: TabBar {
			TabButton {
				text: "Test"
			}
		}
	}

	NavigationDrawer {
		id: drawer
		hideHeader: testButton.checked ? page.header : null

		Pane {
			anchors.fill: parent

			ColumnLayout {
				anchors.top: parent.top
				anchors.left: parent.left
				anchors.right: parent.right

				Switch {
					text: "Option 1"
				}
				Switch {
					text: "Option 2"
				}
				Switch {
					text: "Option 3"
				}
			}
		}
	}

	AlertDialog {
		id: dialog
		title: "Hello Tree!"
		standardButtons: Dialog.Ok
	}
}
