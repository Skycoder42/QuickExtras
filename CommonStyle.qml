import QtQuick 2.8
import QtQuick.Controls 2.1
import QtQuick.Controls.Material 2.1
import QtQuick.Controls.Universal 2.1
import de.skycoder42.quickextras 2.0

Control {
	readonly property int theme: {
		if(QuickExtras.currentStyle === "Material")
			return Material.theme;
		else if(QuickExtras.currentStyle === "Universal")
			return Universal.theme;
		else
			return 0;
	}

	readonly property color accent: {
		if(QuickExtras.currentStyle === "Material")
			return Material.accent;
		else if(QuickExtras.currentStyle === "Universal")
			return Universal.accent;
		else
			return "black";
	}

	readonly property color primary: {
		if(QuickExtras.currentStyle === "Material")
			return Material.primary;
		else if(QuickExtras.currentStyle === "Universal")
			return Universal.background;
		else
			return "white";
	}

	readonly property color sBackground: {
		if(QuickExtras.currentStyle === "Material")
			return Material.background;
		else if(QuickExtras.currentStyle === "Universal")
			return Universal.background;
		else
			return "white";
	}

	readonly property color foreground: {
		if(QuickExtras.currentStyle === "Material")
			return Material.foreground;
		else if(QuickExtras.currentStyle === "Universal")
			return Universal.foreground;
		else
			return "black";
	}

	readonly property int elevation: {
		if(QuickExtras.currentStyle === "Material")
			return Material.elevation;
		else
			return 1;
	}

	readonly property bool isMaterial: QuickExtras.currentStyle === "Material"
	readonly property bool isUniversal: QuickExtras.currentStyle === "Universal"
}
