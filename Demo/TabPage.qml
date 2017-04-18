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
		showMenuButton: switch2.checked

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

			Switch {
				id: switch2
				anchors.centerIn: parent
				checked: true
				text: qsTr("Back button visible")
			}
		}
		Pane {
			id: secondPage

			Switch {
				anchors.centerIn: parent
				text: qsTr("Click me!")
			}
		}
	}
}
