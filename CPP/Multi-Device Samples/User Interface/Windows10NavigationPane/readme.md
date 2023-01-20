FMX.Windows10NavigationPane Sample[]()
# FMX.Windows10NavigationPane Sample 


This sample illustrates how to use the [TMultiView](http://docwiki.embarcadero.com/Libraries/en/FMX.MultiView.TMultiView) component to create an application with the Master Pane in the `NavigationPane`[mode](http://docwiki.embarcadero.com/Libraries/en/FMX.MultiView.TCustomMultiView.Mode).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Run the Sample](#How_to_Run_the_Sample)
* [4 How It Works](#How_It_Works)
* [5 See Also](#See_Also)


## Location 

You can find the **FireMonkeyMobile Windows10NavigationPane** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either:

* `Object Pascal\Multi-Device Samples\User Interface\Windows10NavigationPane`
* `CPP\Multi-Device Samples\User Interface\Windows10NavigationPane`

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/Windows10NavigationPane](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/Windows10NavigationPane)
* **GitHub Repository for C++:**[https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/Windows10NavigationPane](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/Windows10NavigationPane)

## Description 

The Windows10NavigationPane sample shows how to create an application that implements the "master-detail" interface and illustrates how to use the [TImageList](http://docwiki.embarcadero.com/Libraries/en/FMX.ImgList.TImageList) component to display icons on the master panel. The used [styles](http://docwiki.embarcadero.com/RADStudio/en/Customizing_FireMonkey_Applications_with_Styles) are suitable for Windows 10 desktop applications.
## How to Run the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **NavigationPaneDemo.dproj**.
*  C++: **NavigationPaneCpp.cbproj**.

2.  In the [Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector), ensure that the [Mode](http://docwiki.embarcadero.com/Libraries/en/FMX.MultiView.TCustomMultiView.Mode) property of the [TMultiView](http://docwiki.embarcadero.com/Libraries/en/FMX.MultiView.TMultiView) component is set to `NavigationPane`.
3.  Press **Shift+Ctrl+F9** or choose **Run > Run Without Debugging**.

## How It Works 

After you start this sample application, it displays the following form:![Win10NavigationPane collapsed.png](Readme%20Files/Win10NavigationPane%20collapsed.png)

> **Note**: This screen displays the 64-bit Windows 7 desktop application form as an example. However, the forms for other target platforms provide similar functionality.

To expand the navigation pane, click the [master button](http://docwiki.embarcadero.com/Libraries/en/FMX.MultiView.TCustomMultiView.MasterButton)![Win10 MasterButton.png](Readme%20Files/Win10%20MasterButton.png):![Win10NavigationPane.png](Readme%20Files/Win10NavigationPane.png)

## See Also 


* [Mobile Tutorial: Using a MultiView Component to Display Alternate Views of Information (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_a_MultiView_Component_to_Display_Alternate_Views_of_Information_(iOS_and_Android))
* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [Customizing FireMonkey Applications with Styles](http://docwiki.embarcadero.com/RADStudio/en/Customizing_FireMonkey_Applications_with_Styles)





