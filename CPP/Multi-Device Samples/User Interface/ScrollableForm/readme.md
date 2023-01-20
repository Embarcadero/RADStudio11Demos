FMX.ScrollableForm Sample[]()
# FMX.ScrollableForm Sample 


This sample shows how to correctly reposition or scroll panels when the virtual keyboard is invoked in mobile applications, using **FireMonkey**.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Classes](#Classes)
* [5 Implementation](#Implementation)
* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **FireMonkeyMobile ScrollableForm** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\ScrollableForm`
* `CPP\Multi-Device Samples\User Interface\ScrollableForm`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ScrollableForm](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ScrollableForm)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/ScrollableForm](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/ScrollableForm)

## Description 

This application shows how to scroll or situate the entry field just above the **Virtual Keyboard**, so that the entry field is not obscured by the keyboard.
## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **ScrollableForm.dproj**
*  C++: **ScrollableForm.cbproj**

2.  Press **F9** or choose **Run > Run**.
3.  Observe that for each control, when the **Virtual Keyboard** is displayed, the application moves the entry field to a position above the keyboard.

## Classes 



![Image1.png](Readme%20Files/Image1.png)

[](http://docwiki.embarcadero.com/CodeExamples/en/File%3AScrollableFormDemo2.png)
When user selects an entry field, the form scrolls so that the keyboard is below the entry field


[VertScrollBox1](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TVertScrollBox) occupies the display area on the form and contains the main layout control and all the edit fields in the app:
* [MainLayout1](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout)

* [TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo) occupies the upper portion of the form. You can click on the **TMemo** and add or edit content using the virtual keyboard (its **KeyboardType** is **Default**).
* [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) controls: TEdit1 - TEdit5 are various types of edit fields.

*  TEdit1 has the [Align](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Align) property set to **Bottom** and it is associated with the number pad (that is, its [KeyboardType](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TCustomEdit.KeyboardType) is **NumberPad**). TEDit1 also has a clear button set ([FMX.Edit.TClearEditButton](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TClearEditButton)).
*  TEdit2 uses the **Default** keyboard type (full QWERTY) for text entry.
*  TEdit3 uses the number pad (KeyboardType is **NumberPad**).
*  TEdit4 is read-only (the [ReadOnly](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TCustomEdit.ReadOnly) property is set to **True**).
*  TEdit5 is also read-only and its [Enabled](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Enabled) property is set to **False**.

* [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) ("No edit control") is used to remove focus from a selected edit control. This is useful on some hardware such as the iPad, on which the focus must change to a different control before the keyboard redisplays after being dismissed.

## Implementation 


*  The event handlers for the [OnVirtualKeyboardShown](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TCommonCustomForm.OnVirtualKeyboardShown) and [OnVirtualKeyboardHidden](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TCommonCustomForm.OnVirtualKeyboardHidden) events of the [TForm](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm) object are used to reposition the [TVertScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TVertScrollBox) so that the entry field is not obscured by the **Virtual Keyboard**.

*  The procedure **TFormMain.UpdateKBBounds** retrieves the coordinates of the control having the focus. If the images of the control and the virtual keyboard overlap, then UpdateKBBounds shifts the visible region of the VertScrollBox1. [OnCalcContentBounds](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TScrollBox.OnCalcContentBounds) is used to increase the size of the working region.
*  The global variable **[VKAutoShowMode](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.VKAutoShowMode)** is set to **Always** in the .dpr file:`VKAutoShowMode := TVKAutoShowMode.Always;`
 This means that the virtual (onscreen) keyboard appears automatically for Windows and mobile applications even if a device has a physical keyboard.
## Uses 


* [FMX.Controls.TControl.SetBounds](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.SetBounds)
* [FMX.Layouts.TCustomScrollBox.ViewportPosition](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TCustomScrollBox.ViewportPosition)
* [FMX.Types.TVirtualKeyboardType](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TVirtualKeyboardType)

## See Also 


* [FMX.KeyboardTypes Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.KeyboardTypes_Sample)
* [FMX.KeyboardToolbar Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.KeyboardToolbar_Sample)

* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [iOS Mobile Application Development](http://docwiki.embarcadero.com/RADStudio/en/iOS_Mobile_Application_Development)
* [Troubleshooting: Cannot Deploy to the iOS Simulator](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_iOS_App_to_iOS_Simulator)
* [Troubleshooting: Cannot Deploy to the iOS Device](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_to_the_iOS_Device)
* [http://stackoverflow.com/questions/1126726/how-to-make-a-uitextfield-move-up-when-keyboard-is-present](http://stackoverflow.com/questions/1126726/how-to-make-a-uitextfield-move-up-when-keyboard-is-present)





