import QtQuick 2.8
import QtQuick.Controls 2.1

Dialog {
	x: parent ? (parent.width - width) / 2 : 0
	y: parent ? (parent.height - height) / 2 : 0//TODO include input method heigth into calc
	implicitWidth: parent ? Math.min(300, parent.width - 56) : 300
	modal: true
	focus: true
}
