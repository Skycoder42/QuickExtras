import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Layouts 1.3
import de.skycoder42.quickextras 1.0

ToolBar {
	id: toolbar
	implicitHeight: (tabLoader.item ? tabLoader.item.implicitHeight : 0) + 56

	property alias title: titleLabel.text
	property alias showMenuButton: menuButton.visible
	property bool showMenuAsBack: false

	property Menu moreMenu: null
	property alias tabBar: tabLoader.sourceComponent
	property alias tabBarItem: tabLoader.item
	default property alias actions: actionButtonsLayout.children

	signal menuButtonClicked()

	GridLayout {
		id: grid
		anchors.fill: parent
		rowSpacing: 0
		columnSpacing: 0
		columns: 2 + (showMenuButton ? 1 : 0) + (moreMenu ? 1 : 0)
		rows: 2

		AppBarButton {
			id: menuButton
			imageSource: showMenuAsBack ?
							 "image://svg/de/skycoder42/quickextras/icons/ic_arrow_back" :
							 "image://svg/de/skycoder42/quickextras/icons/ic_menu"
			text: showMenuAsBack ? qsTr("Go back") : qsTr("Show menu")

			onClicked: menuButtonClicked()
		}

		Label {
			id: titleLabel
			font.pointSize: 16
			font.bold: true
			elide: Label.ElideRight
			horizontalAlignment: Qt.AlignLeft
			verticalAlignment: Qt.AlignVCenter
			Layout.fillWidth: true
			Layout.leftMargin: 10
			Layout.minimumHeight: 56
		}

		RowLayout {
			id: actionButtonsLayout
			spacing: 0
		}

		AppBarButton {
			id: moreButton
			visible: moreMenu
			imageSource: "image://svg/de/skycoder42/quickextras/icons/ic_more_vert"
			text: qsTr("More…")
			checkable: true

			property bool skipNext: false

			onPressed: uncheckTimer.stop();
			onReleased: skipNext = false;
			onCanceled: skipNext = false;

			onCheckedChanged: {
				if(skipNext) {
					skipNext = false;
					checked = !checked;
					return;
				}

				if(checked) {
					if(!moreMenu.visible)
						moreMenu.open();
				} else {
					if(moreMenu.visible)
						moreMenu.close();
				}
			}

			Connections {
				target: moreMenu
				onClosed: {
					moreButton.checked = false;
					moreButton.skipNext = true;
					uncheckTimer.restart();
				}
			}

			Timer {
				id: uncheckTimer
				interval: 100
				repeat: false
				running: false

				onTriggered: moreButton.skipNext = false;
			}
		}

		Loader {
			id: tabLoader
			Layout.fillWidth: true
			Layout.columnSpan: grid.columns
			Material.background: Material.primary

			onLoaded: {
				tabLoader.item.position = TabBar.Header;
			}
		}
	}

	CommonStyle {
		id: style
	}

	Component.onCompleted: {
		if(moreMenu) {
			moreMenu.parent = moreButton;
			if(!style.isMaterial)
				moreMenu.y = Qt.binding(function(){return moreButton.height});
		}
	}
}
