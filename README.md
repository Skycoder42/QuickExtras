# QuickExtras
Additional Stuff for Qt Quick Controls 2, to make it work event better

> Note: The android specific stuff has been moved to [AndroidUtils](https://github.com/Skycoder42/AndroidUtils)

## Features
This package is a collection of various qml types to improve the qt quick controls 2 as well as android support

- QML Types
	- CommonStyle - An item to easily access style parameters (like accent, background, etc) without referencing the styles directly
	- TintIcon - An icon with a tint color
	- AppBarButton - A button to be used in ActionBars, in short an improved toolbutton
	- FloatingActionButton - Improved Version of the RoundButton
	- AlerDialog - A keyboard-aware qml dialog, extending the default dialog by modifying position and size
	- ActionBar - A Toolbar in android style - menu button, title, actions and more menu (and an optional TabBar)
	- NavigationDrawer - A Drawer with automated size behavior
	- DoubleSpinBox - A spinbox for double values
	- QuickExtras singleton with additional properties/methods
- Adds an SVG image provider that uses the SVG engine to scale images, instead of zooming in QML (which looks horrible on high DPI devices)
- Makes QSortFilterProxyModel available in QML

## Installation
The package is providet as qpm package, [`de.skycoder42.quickextras`](https://www.qpm.io/packages/de.skycoder42.quickextras/index.html). To install:

1. Install qpm (See [GitHub - Installing](https://github.com/Cutehacks/qpm/blob/master/README.md#installing))
2. In your projects root directory, run `qpm install de.skycoder42.quickextras`
3. Include qpm to your project by adding `include(vendor/vendor.pri)` to your `.pro` file

Check their [GitHub - Usage for App Developers](https://github.com/Cutehacks/qpm/blob/master/README.md#usage-for-app-developers) to learn more about qpm.

## Usage
All the QML type ar available via the import `import de.skycoder42.quickextras 1.0`. To make use of the SVG image provider, it must be registered in the engine. This can be done by calling `QuickExtras::setupEngine(engine);` in your main. To load svg images, use `image://svg/dir_to/image`. This would load the svg image `:/dir_to/image.svg` from the resources. Have a look at the `Demo` project to see a small example of the extra controls

### Haptic Feedback
Since haptic feedback is device specific, it is not implemented here. The `QuickExtras.hapticLongPress()` by default does nothing, unless a feedback trigger has been set by using `QuickExtras::setHapticFeedbackProvider`. **Pro-Tip:** My [AndroidUtils package](https://github.com/Skycoder42/AndroidUtils) provides a method to trigger such feedback for android.