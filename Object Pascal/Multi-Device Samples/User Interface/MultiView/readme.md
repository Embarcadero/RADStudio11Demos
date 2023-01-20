FMX.MultiViewDemo Sample[]()
# FMX.MultiViewDemo Sample 


This is a sample that describes how to use [TMultiView](http://docwiki.embarcadero.com/Libraries/en/FMX.MultiView.TMultiView) component in mobile applications, using **FireMonkey**.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Run the Sample](#How_to_Run_the_Sample)
* [4 How It Works](#How_It_Works)
* [5 See Also](#See_Also)


## Location 

You can find the **FireMonkeyMobile MultiViewDemo** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\MultiView`
* `CPP\Multi-Device Samples\User Interface\MultiViewDemo`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/MultiView](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/MultiView)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/MultiViewDemo](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/MultiViewDemo)

## Description 

The MultiViewDemo sample shows how to create an application that implements the "master-detail" interface and explains how to use the master panel presentation modes.This sample allows you to change the master panel characteristics, such as mode, placement, sliding mode, shadow properties, etc. It also helps you understand how to implement your master panel in the Custom presentation mode.

## How to Run the Sample 


1.  Navigate to the location given above and open the project file:

*  C++Builder: **MultiViewDemoCpp.cbproj**

*  Delphi: **MultiViewDemo.dproj**

2.  Press **F9** or choose **Run > Run**.

## How It Works 

After you start this sample application, it displays the following form:![MultiViewDemo.png](Readme%20Files/MultiViewDemo.png)

> **Note**: This screen displays the 32-bit Windows desktop application form as an example. However, the forms for other target platforms provide similar functionality.

Using this form you can perform the following basic operations:
*  Select the [master panel presentation mode](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_a_MultiView_Component_to_Display_Alternate_Views_of_Information_(iOS_and_Android)#Master_Pane_Presentation_Modes) from the **Multi View Mode** list. The available modes are:

* `PlatformBehaviour`
* `Docked Panel`
* `Popover`
* `Drawer`
* `Custom`

*  Specify parameters for each presentation mode on the **Drawer**, **Popover** and **Split View** tabs, respectively.
*  Specify parameters of a shadow that the master pane casts on the detail pane on the **Shadow** tab.

## See Also 


* [Mobile Tutorial: Using a MultiView Component to Display Alternate Views of Information (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_a_MultiView_Component_to_Display_Alternate_Views_of_Information_(iOS_and_Android))
* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [iOS Mobile Application Development](http://docwiki.embarcadero.com/RADStudio/en/iOS_Mobile_Application_Development)
* [Troubleshooting: Cannot Deploy to the iOS Simulator](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_iOS_App_to_iOS_Simulator)
* [Troubleshooting: Cannot Deploy to the iOS Device](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_to_the_iOS_Device)
* [Mobile Tutorial: Using Location Sensors (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Location_Sensors_(iOS_and_Android))





