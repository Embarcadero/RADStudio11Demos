FMX.KeyboardToolbar Sample[]()
# FMX.KeyboardToolbar Sample 


This is a sample that shows the use of a popup keyboard in mobile applications using **FireMonkey**.**Note:** This sample application only works on iOS. It does not work on Android.

![Image1.png](Readme%20Files/Image1.png)

[](http://docwiki.embarcadero.com/CodeExamples/en/File%3AKeyboardToolbar0.png)
Click **Add** to create a new custom button



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Classes](#Classes)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **FireMonkeyMobile KeyboardToolbar** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\KeyboardToolbar`
* `CPP\Multi-Device Samples\User Interface\KeyboardToolbar`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/KeyboardToolbar](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/KeyboardToolbar)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/KeyboardToolbar](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/KeyboardToolbar)

## Description 

This application illustrates how to customize the toolbar associated to the virtual keyboard using the [IFMXVirtualKeyboardToolbarService](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService).

![Image2.png](Readme%20Files/Image2.png)

[](http://docwiki.embarcadero.com/CodeExamples/en/File%3AKeyboardToolbar1.png)
Entering the caption for a button being created



## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **KeyboardToolbar.dproj**
*  C++: **KeyboardToolbar.cbproj**

2.  Press **F9** or choose **Run > Run**.
3.  To observe the functionality of the **Keyboard Toolbar**, follow the following steps:

*  To invoke the virtual keyboard, use the [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) control (named `Edit1`).
*  To enable or disable the **Keyboard Toolbar**, switch the [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) control (named `swToolbar`) **On** or **Off**.
*  To add a [TVirtualKeyboardToolButton](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.TVirtualKeyboardToolButton) button to the **Keyboard Toolbar**, use the **Add** button (named `btnAdd`). Notice that the button is visible in the Keyboard Toolbar (displayed over the virtual keyboard) and in the [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) list box (`lbButtons`).
*  To remove a [TVirtualKeyboardToolButton](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.TVirtualKeyboardToolButton) button from the **Keyboard Toolbar**, select the button from the [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) (`lbButtons`) and press the **Delete** button (named `btnDelete`).


![Image3.png](Readme%20Files/Image3.png)

[](http://docwiki.embarcadero.com/CodeExamples/en/File%3AKeyboardToolbar2.png)
**My button** is created. Press it



## Classes 

[TForm1](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm) (named `Form1`) is the main window of the **KeyboardToolbar** sample. It contains the following components:
* [TToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) named `ToolBar1`

*  Two [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) buttons named `btnAdd` and `btnDelete`

* [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) named `lbButtons` that is intended to contain keyboard toolbar buttons created with the `btnAdd` button.

* [TListBoxGroupHeader](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxGroupHeader) named _ListBoxGroupHeader3_. It shows the **CUSTOM BUTTONS** caption.

* [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) named `ListBox1` contains:

* [TListBoxGroupHeader](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxGroupHeader) named `ListBoxGroupHeader1`. It shows the **TOOLBAR** caption.
* [TListBoxGroupHeader](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxGroupHeader) named `ListBoxGroupHeader2`. It shows the **SAMPLE CONTROLS** caption.
* [TListBoxHeader](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxHeader) named `ListBoxHeader2`. It contains the [TLabel](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) label control named `Label2` showing **Keyboard ToolBar** caption.
* [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) named `ListBoxItem1`. It contains the [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) control named `swToolbar`.
* [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) named `ListBoxItem2`. It contains the [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) control named `swDoneButton`.
* [TListBoxItem](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem) named `ListBoxItem3`. It contains three controls:

* [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) edit control named `Edit1`.
* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) speed button control named `SpeedButton1`.
* [TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar) track bar control named `TrackBar1`.

## Implementation 


*  To enable or disable the **Keyboard Toolbar**, the [SetToolbarEnabled](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.SetToolbarEnabled) method is used.
*  To add or delete buttons from the **Keyboard Toolbar**, the [AddButton](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.AddButton) and [DeleteButton](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.DeleteButton) methods are used.

## Uses 


* [IFMXVirtualKeyboardToolbarService.AddButton](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.AddButton)
* [IFMXVirtualKeyboardToolbarService.DeleteButton](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.DeleteButton)
* [IFMXVirtualKeyboardToolbarService.IsHideKeyboardButtonVisible](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.IsHideKeyboardButtonVisible)
* [IFMXVirtualKeyboardToolbarService.SetHideKeyboardButtonVisibility](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.SetHideKeyboardButtonVisibility)
* [IFMXVirtualKeyboardToolbarService.SetToolbarEnabled](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.SetToolbarEnabled)

## See Also 


* [FMX.ScrollableForm Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ScrollableForm_Sample)
* [FMX.KeyboardTypes Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.KeyboardTypes_Sample)
* [FMX.TabSlideTransition Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.TabSlideTransition_Sample)

* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [iOS Mobile Application Development](http://docwiki.embarcadero.com/RADStudio/en/iOS_Mobile_Application_Development)
* [Troubleshooting: Cannot Deploy to the iOS Simulator](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_iOS_App_to_iOS_Simulator)
* [Troubleshooting: Cannot Deploy to the iOS Device](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_to_the_iOS_Device)
* [Mobile Tutorial: Using the Web Browser Component (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_the_Web_Browser_Component_(iOS_and_Android))





