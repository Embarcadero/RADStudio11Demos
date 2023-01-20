FMX.KeyboardTypes Sample[]()
# FMX.KeyboardTypes Sample 


This is a sample that shows key entry types in mobile applications, using **FireMonkey**.

![Image1.png](Readme%20Files/Image1.png)

[](http://docwiki.embarcadero.com/CodeExamples/en/File%3AKeyboardType1.png)
**Alphabet** keyboard type



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Classes](#Classes)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **KeyboardTypes** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\KeyboardTypes`
* `CPP\Multi-Device Samples\User Interface\KeyboardTypes`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/KeyboardTypes](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/KeyboardTypes)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/KeyboardTypes](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/KeyboardTypes)


![Image2.png](Readme%20Files/Image2.png)

[](http://docwiki.embarcadero.com/CodeExamples/en/File%3AKeyboardType2.png)
**EmailAddress** keyboard type



## Description 

This application shows how to use different types of **Virtual Keyboard**.
## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **VirtualKeyboardDemo.dproj**
*  C++: **VirtualKeyboardDemo.cbproj**

2.  Press **F9** or choose **Run > Run**.
3.  Observe that different Virtual Keyboard types (**Alphabet**, **NumberPad**, **EmailAddress**, **PhonePad**, **URL**, and others) activate when you place input focus into different edit controls: **First Name**, **Email**, **Phone**, and others.

## Classes 

[TVKBaseForm](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm), named `VKBaseForm`, is the main window of the **KeyboardTypes** sample. It contains the `VertScrollBox1` vertical scrolling area containing the `MainLayout1` layout. `MainLayout1` contains the following components: 
* `ListBox1` list box with multiple list box items containing different [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) edit controls:

* `ListBoxItem1` contains the **First Name** edit control (`Edit1`).
* `ListBoxItem2` contains the **Last Name** edit control (`Edit2`).
* `ListBoxItem3` contains the **City** edit control (`Edit3`).
* `ListBoxItem4` contains the **State** edit control (`Edit4`).
* `ListBoxItem5` contains the **Zip Code** edit control (`Edit5`).
* `ListBoxItem6` contains the **Email** edit control (`Edit6`).
* `ListBoxItem7` contains the **Phone** edit control (`Edit7`).
* `ListBoxItem8` contains the **Web Page** edit control (`Edit8`).

* `ToolBar1` tool bar containing the **Keyboard Types** label `Label1`.


![Image3.png](Readme%20Files/Image3.png)

[](http://docwiki.embarcadero.com/CodeExamples/en/File%3AKeyboardType3.png)
**PhonePad** keyboard type



## Implementation 


*  The virtual keyboard type (**Alphabet**, **NumberPad**, and others) is stored in the [KeyboardType](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TCustomEdit.KeyboardType) property of [edit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) controls. To change the virtual keyboard type, select an edit control (**First Name**, **Email** or other) in the [Form Designer](http://docwiki.embarcadero.com/RADStudio/en/Form_Designer) and select an needed virtual keyboard type in the **KeyboardType** property in the **Object Inspector**.
*  The event handlers for [OnVirtualKeyboardShown](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TCommonCustomForm.OnVirtualKeyboardShown) and [OnVirtualKeyboardHidden](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TCommonCustomForm.OnVirtualKeyboardHidden) events of the [VKBaseForm](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm) object are used to scroll the [VertScrollBox1](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TVertScrollBox) scroll box and adapt the view to the height of the **Virtual Keyboard**.

## Uses 


* [FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.SetHideKeyboardButtonVisible](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.IsHideKeyboardButtonVisible)
* [FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.SetToolbarEnabled](http://docwiki.embarcadero.com/Libraries/en/FMX.VirtualKeyboard.IFMXVirtualKeyboardToolbarService.SetToolbarEnabled)
* [FMX.Edit.TCustomEdit.KeyboardType](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TCustomEdit.KeyboardType)

## See Also 


* [FMX.ScrollableForm Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ScrollableForm_Sample)
* [FMX.KeyboardToolbar Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.KeyboardToolbar_Sample)
* [FMX.TabSlideTransition Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.TabSlideTransition_Sample)

* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [iOS Mobile Application Development](http://docwiki.embarcadero.com/RADStudio/en/iOS_Mobile_Application_Development)
* [Mobile Tutorial: Using the Web Browser Component (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_the_Web_Browser_Component_(iOS_and_Android))





