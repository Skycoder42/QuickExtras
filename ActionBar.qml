import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Layouts 1.3
import de.skycoder42.quickextras 1.0

ToolBar {
	id: toolbar
	implicitHeight: 56

	property alias title: titleLabel.text
	property alias showMenuButton: menuButton.visible
	property bool showMenuAsBack: false

	property Menu moreMenu: null
	default property alias actions: actionButtonsLayout.children

	signal menuButtonClicked()

	RowLayout {
		anchors.fill: parent
		spacing: 0

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
	}

	Component.onCompleted: {
		if(moreMenu) {
			moreMenu.parent = moreButton;
			if(!CommonStyle.isMaterial)
				moreMenu.y = Qt.binding(function(){return moreButton.height});
		}
	}
}
