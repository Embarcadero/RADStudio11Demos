FMX.PlatformScrollBox Sample[]()
# FMX.PlatformScrollBox Sample 


This sample illustrates most of the features of the [TPresentedScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ScrollBox.TPresentedScrollBox) control to create an area with a scroll bar.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Run the Sample](#How_to_Run_the_Sample)
* [4 Files](#Files)
* [5 How It Works](#How_It_Works)
* [6 See Also](#See_Also)


## Location 

You can find the **PlatformScrollBox** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\PlatformScrollBox`
* `CPP\Multi-Device Samples\User Interface\PlatformScrollBox`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/PlatformScrollBox](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/PlatformScrollBox)
* **C++:**[https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/PlatformScrollBox](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/PlatformScrollBox)

## Description 

The PlatformScrollBox sample shows an instance of [TPresentedScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ScrollBox.TPresentedScrollBox) filled with a grid of random controls, and provides a [multi-view pane](http://docwiki.embarcadero.com/Libraries/en/FMX.MultiView.TMultiView) that allows you to configure at run-time many of the properties of the [TPresentedScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ScrollBox.TPresentedScrollBox) control and see how they affect the appearance and the behavior of the control.
## How to Run the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: `ScrollBoxPlatform.dproj`.
*  C++: `ScrollBoxDemoCpp.cbproj`.

2.  Select the target platform.
3.  Press `SHIFT`+`CTRL`+`F9` or select **Run > Run Without Debugging**.

## Files 



| File in Delphi                                   | File in C++                                     | Contains            |
| ------------------------------------------------ | ----------------------------------------------- | ------------------- |
| `ScrollBoxPlatform.dproj``ScrollBoxPlatform.dpr` | `ScrollBoxDemoCpp.cbproj``ScrollBoxDemoCpp.cpp` | The project itself. |
| `MainForm.pas``MainForm.fmx`                     | `MainFrm.h``MainFrm.cpp``MainFrm.fmx`           | The main form.      |


## How It Works 

After you start this sample application, it displays the following form:![PlatformScrollBox.png](Readme%20Files/PlatformScrollBox.png)
Use the controls in the left-side pane to change the appearance and the behavior of the scroll box at run time.

## See Also 


* [FMX.ScrollBox.TPresentedScrollBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ScrollBox.TPresentedScrollBox)





