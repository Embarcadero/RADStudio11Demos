FMX.Tabbed Map Sample[]()
# FMX.Tabbed Map Sample 


This sample shows how to use maps in different tabs in a Delphi/C++ application.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 Using Google Maps on Android](#Using_Google_Maps_on_Android)
* [4 How to Use the Sample](#How_to_Use_the_Sample)
* [5 Files](#Files)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **Tabbed Map** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Maps`
* `CPP\Multi-Device Samples\Device Sensors and Services\Maps`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Maps](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Maps)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Maps](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Maps)

## Description 

The sample demonstrates the use of the [TMapView](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView) class. The sample shows how to display and interact with the map, including:
*  Changing between two tabs that display different maps.
*  Showing the coordinates of the map center.
*  Zooming in and zooming out both maps.

## Using Google Maps on Android 

If you are running this sample on Android, in order to access the Google Maps servers, you have to add a Maps API key to the sample. To acquire the API key and add it in the sample you need to follow these [configuration steps](http://docwiki.embarcadero.com/RADStudio/en/Configuring_Android_Applications_to_Use_Google_Maps):
*  Getting your Google Maps API key:

* [Retrieving Your Application Certificate](http://docwiki.embarcadero.com/RADStudio/en/Configuring_Android_Applications_to_Use_Google_Maps#Retrieving_Your_Application_Certificate)
* [Creating an API Project in the Google APIs Console](http://docwiki.embarcadero.com/RADStudio/en/Configuring_Android_Applications_to_Use_Google_Maps#Creating_an_API_Project_in_the_Google_APIs_Console). This step requires you to have a [Google Account](https://accounts.google.com/signup).
* [Requesting the Maps API Key](http://docwiki.embarcadero.com/RADStudio/en/Configuring_Android_Applications_to_Use_Google_Maps#Requesting_a_Maps_API_Key)

*  Configuring the sample project options. Once you have the Maps API Key; in RAD Studio:

*  Go to **Project > Options > Version Info**
*  Select **Android platform** as Target (either in Debug, Release or All Configurations).
*  Add the Maps API Key value in the **apiKey** key, and click **OK**.

## How to Use the Sample 


1.  Navigate to one of the locations given above and open:

*  Delphi: **TabbedMapProject.dproj**.
*  C++: **TabMapProject.cbproj**.

2.  If you are running the sample on Android, ensure you first follow the steps indicated in [Using Google Maps on Android](#Using_Google_Maps_on_Android)
3.  Before you run the sample, ensure the device is connected to the Internet.
4.  Press F9 or choose **Run > Run**.
5.  When you run the sample, the TMapView loads the map.


![Tabbed Map Sample.png](Readme%20Files/Tabbed%20Map%20Sample.png)

 To interact with the map:
*  Use the **Saint-Pétersbourg** and **San Francisco** tabs to change between the two maps.
*  Change the zoom using the **Zoom out** and **Zoom in** buttons.
*  Move the map and see the coordinates of the map center in the **CameraInfo** TLabel, at the button of the app.

## Files 



| **File in Delphi**         | **File in C++**                    | **Contains**                                    |
| -------------------------- | ---------------------------------- | ----------------------------------------------- |
| **TabbedMapProject.dproj** | **TabMapProject.cbproj**           | The project itself.                             |
| **TabbedMap.fmx**          | **TabbedMap.fmx**                  | The main form where the components are located. |
| **TabbedMap.pas**          | **TabbedMap.h**, **TabbedMap.cpp** | Implementation of the sample.                   |


## Implementation 


*  The sample uses [TMapView](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView) to display and manage the maps.
* [TMapCoordinate](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapCoordinate) is used to create the initial coordinates with the indicated latitude and longitude. Then, the center of the maps are set to such coordinates with the [TMapView.Location](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.Location) property.
*  The [TMapView.Zoom](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.Zoom) property is used to set the initial zoom of both maps to 10. This same property, is also used to zoom in and zoom out both maps by adding or subtracting 1 to the Zoom property.
* [TMapView.OnCameraChanged](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.OnCameraChanged) updates the **CameraInfo** TLabel that indicates the [Latitude](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapCoordinate.Latitude) and [Longitude](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapCoordinate.Longitude) of the map [Location](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.Location).

## Uses 


* [FMX.Maps.TMapView](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView)
* [FMX.Maps.TMapView.Zoom](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.Zoom)
* [FMX.Maps.TMapView.Location](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.Location)
* [FMX.Maps.TMapCoordinate](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapCoordinate)
* [FMX.Maps.TMapView.OnCameraChanged](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.OnCameraChanged)

## See Also 


* [FMX.Map Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Map_Sample)

* [Configuring Android Applications to Use Google Maps](http://docwiki.embarcadero.com/RADStudio/en/Configuring_Android_Applications_to_Use_Google_Maps)
* [Mobile Tutorial: Using a Map Component to Work with Maps (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_a_Map_Component_to_Work_with_Maps_(iOS_and_Android))
* [Mobile Tutorial: Using Location Sensors (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Location_Sensors_(iOS_and_Android))





