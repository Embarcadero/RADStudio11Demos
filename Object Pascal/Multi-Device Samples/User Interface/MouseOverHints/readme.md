FMX.MouseOverHints Sample[]()
# FMX.MouseOverHints Sample 


This sample shows how to use hints to show contextual help.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Setting and Showing Hints](#Setting_and_Showing_Hints)
* [5.2 Actions](#Actions)
* [5.3 Status Bar](#Status_Bar)
* [5.4 Menu](#Menu)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **MouseOverHints** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\MouseOverHints`
* `CPP\Multi-Device Samples\User Interface\MouseOverHints`

* **GitHub Repository:**

*  Delphi: [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/MouseOverHints](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/MouseOverHints)
*  C++: [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/MouseOverHints](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/MouseOverHints)

## Description 

The **MouseOverHints** sample demonstrates how to use hints to show contextual help.The sample shows how to work with hints, and the special behavior that some components, such as status bars, actions, and menus, have when working with hints.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **MouseOverHints.dproj**.
*  C++: **MouseOverHints.cbproj**.

2.  Select the target platform.**Note:** The **MouseOverHints** sample is supported by desktop platforms, see [Platform Support for Hints](http://docwiki.embarcadero.com/RADStudio/en/Using_Hints_to_Show_Contextual_Help_in_a_FireMonkey_Application#Platform_Support_for_Hints) for further details.
3.  Press F9 or choose **Run > Run**.
4.  Use the check boxes to change the different options and place the mouse over the buttons, menu items, and panel to see hints.

![MouseOverHints Sample.png](Readme%20Files/MouseOverHints%20Sample.png)

## Files 



| **File in Delphi**         | **File in C++**                                      | **Contains**                                    |
| -------------------------- | ---------------------------------------------------- | ----------------------------------------------- |
| **MouseOverHints.dproj**   | **MouseOverHints.cbproj**                            | The project itself.                             |
| **MouseOverHints.fmx**     | **MouseOverHints.fmx**                               | The main form where the components are located. |
| **MouseoverHintsForm.pas** | **MouseoverHintsForm.h**, **MouseoverHintsForm.cpp** | Used to define and implement the sample.        |


## Implementation 


### Setting and Showing Hints 


*  The [TControl.Hint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Hint) property is used to set the hint of a control in the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector) at design time. The [TControl.Hint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Hint) property is also used to change or set the hint of a control at run time.

*  The [TApplication.ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TApplication.ShowHint) property is used to enable or disable the hints for the sample application. Disabling the hints of the application disables the hints from all controls.

*  The [TForm.ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm.ShowHint) property is used to enable or disable the hints of the form.

*  The [TControl.ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.ShowHint) property is used to enable or disable the hints of a control.

*  The [TControl.ParentShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.ParentShowHint) property is used to set whether the [ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.ShowHint) of a control is enabled or disabled according to the [TControl.ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.ShowHint) property of the parent control.

*  The [TApplication.HintShortCuts](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TApplication.HintShortCuts) property is used to indicate if the hints also display the [keyboard shortcuts](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction.ShortCut).

*  The [GetLongHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Utils.GetLongHint) method is used to get the long version of the hint. The long version of the hint is the one written after the | (pipe) character.
See more information about [enabling hints](http://docwiki.embarcadero.com/RADStudio/en/Using_Hints_to_Show_Contextual_Help_in_a_FireMonkey_Application#Enabling_Hints).
### Actions 

The [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList) component is used to maintain a list of some of the actions used in the sample.
*  The [TAction.OnHint](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction.OnHint) event is used to set or change the hint of the client control. Setting the hint with `OnHint` changes the hint that displays by default.
See more information about [actions and hints](http://docwiki.embarcadero.com/RADStudio/en/Using_Hints_to_Show_Contextual_Help_in_a_FireMonkey_Application#Actions).
### Status Bar 

The [TStatusBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar) control works in a different manner for hints.
*  The [TStatusBar.AutoHint](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar.AutoHint) property is set to `True` to allow the status bar to intercept all hints from the application.
*  Since `TStatusBar.AutoHint` is `True`, the [TStatusBar.OnHint](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar.OnHint) event occurs when any hint in the application is triggered.
*  The [TApplication.Hint](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TApplication.Hint) property is used to get the text of the current hint.
See more information about [status bar and hints](http://docwiki.embarcadero.com/RADStudio/en/Using_Hints_to_Show_Contextual_Help_in_a_FireMonkey_Application#Status_Bar).
### Menu 

Since the [menu items](http://docwiki.embarcadero.com/Libraries/en/FMX.Menus.TMainMenu) do not display hints as other controls do, the `Label1` displays the hints of the menu items when the [TStatusBar.OnHint](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar.OnHint) event occurs.See more information about [menus and hints](http://docwiki.embarcadero.com/RADStudio/en/Using_Hints_to_Show_Contextual_Help_in_a_FireMonkey_Application#Menus).

## Uses 


* [FMX.Forms.TApplication.Hint](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TApplication.Hint)
* [FMX.Forms.TApplication.ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TApplication.ShowHint)
* [FMX.Forms.TApplication.HintShortCuts](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TApplication.HintShortCuts)

* [FMX.Forms.TForm.ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm.ShowHint)

* [FMX.Controls.TControl.Hint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Hint)
* [FMX.Controls.TControl.ShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.ShowHint)
* [FMX.Controls.TControl.ParentShowHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.ParentShowHint)

* [FMX.ActnList.TAction.ShortCut](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction.ShortCut)
* [FMX.ActnList.TAction.OnHint](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction.OnHint)

* [FMX.ActnList.TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList)

* [FMX.Utils.GetLongHint](http://docwiki.embarcadero.com/Libraries/en/FMX.Utils.GetLongHint)

* [FMX.StdCtrls.TStatusBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar)
* [FMX.StdCtrls.TStatusBar.AutoHint](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar.AutoHint)
* [FMX.StdCtrls.TStatusBar.OnHint](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TStatusBar.OnHint)

## See Also 


* [Using Hints to Show Contextual Help in a FireMonkey Application](http://docwiki.embarcadero.com/RADStudio/en/Using_Hints_to_Show_Contextual_Help_in_a_FireMonkey_Application)
* [FireMonkey Actions](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Actions)





