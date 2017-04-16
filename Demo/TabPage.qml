import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.0
import de.skycoder42.quickextras 1.0

Page {
	id: subPage

	header: ActionBar {
		id: bar
		title: qsTr("Tab Page")

		onMenuButtonClicked: stack.pop()
		showMenuAsBack: true

		tabBar: TabBar {
			id: tabBar
			currentIndex: swipe.currentIndex

			TabButton {
				text: "Test 1"
			}
			TabButton {
				text: "Test 2"
			}
		}
	}

	SwipeView {
		id: swipe
		anchors.fill: parent
		currentIndex: bar.tabBarItem.currentIndex

		Pane {
			id: firstPage

			Button {
				anchors.centerIn: parent
				text: qsTr("Click me!")
			}
		}
		Pane {
			id: secondPage

			CheckBox {
				anchors.centerIn: parent
				text: qsTr("Check me!")
			}
		}
	}
}
