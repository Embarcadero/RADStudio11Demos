FMX.Map Sample[]()
# FMX.Map Sample 


This sample shows how to use maps in a Delphi/C++ application.
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

You can find the **Map** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Map Type Selector`
* `CPP\Multi-Device Samples\Device Sensors and Services\Map Type Selector`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Map%20Type%20Selector](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Map%20Type%20Selector)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Map%20Type%20Selector](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Map%20Type%20Selector)

## Description 

The sample demonstrates the use of the [TMapView](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView) class. The sample shows how to display and interact with the map, including:
*  Changing to different map types: Normal, Satellite and Hybrid.
*  Centring the map using a given coordinate.
*  Rotating the map.
*  Working with map markers.

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

*  Delphi: **Map_ObjectPascal.dproj**.
*  C++: **map_cpp.cbproj**.

2.  If you are running the sample on Android, ensure you first follow the steps indicated in [Using Google Maps on Android](#Using_Google_Maps_on_Android)
3.  Before you run the sample, ensure the device is connected to the Internet.
4.  Press F9 or choose **Run > Run**.
5.  When you run the sample, the TMapView loads the map.


![Map Sample.png](Readme%20Files/Map%20Sample.png)

To interact with the map:
*  Use the **Normal**, **Satellite** and **Hybrid**[TSpeedButtons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) to change among the different map types.
*  Write latitude and longitude map coordinates, and click the **Go** button to move the center of the map to the indicated coordinates.
*  Rotate the map up to 180 degrees using the [TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar).
*  Click on a point in the map to add a map marker.
*  Long-click on a marker to drag that marker.

## Files 



| **File in Delphi**         | **File in C++**              | **Contains**                                    |
| -------------------------- | ---------------------------- | ----------------------------------------------- |
| **Map_ObjectPascal.dproj** | **map_cpp.cbproj**           | The project itself.                             |
| **Maps.fmx**               | **Unit1.fmx**                | The main form where the components are located. |
| **Maps.pas**               | **Unit1.h**, **map_cpp.cpp** | Implementation of the sample.                   |


## Implementation 


*  The sample uses [TMapView](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView) to display and manage the map.
*  The [TMapView.Bearing](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.Bearing) property is used to change the inclination of the map in degrees according to [TTrackBar.Value](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar.Value). Since the [maximum value](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar.Max) of the track bar is 180, the maximum map rotation allowed is 180 degrees.
*  The [TMapView.MapType](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.MapType) property is used to change among the different [map types](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapType); this sample uses **Normal**, **Satellite** and **Hybrid**.
*  The [TMapView.OnMapClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.OnMapClick) event is used to add a [map marker](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapMarkerDescriptor) on the position clicked by the user.
*  The [TMapView.Location](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.Location) is used to center the view of the map to a particular [map coordinate](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapCoordinate) with the indicated latitude and longitude.

## Uses 


* [FMX.Maps.TMapView](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView)
* [FMX.Maps.TMapView.Bearing](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.Bearing)
* [FMX.Maps.TMapView.MapType](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.MapType)
* [FMX.Maps.TMapView.OnMapClick](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.OnMapClick)
* [FMX.Maps.TMapView.Location](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapView.Location)
* [FMX.Maps.TMapMarkerDescriptor](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapMarkerDescriptor)
* [FMX.Maps.TMapCoordinate](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapCoordinate)
* [FMX.Maps.TMapType](http://docwiki.embarcadero.com/Libraries/en/FMX.Maps.TMapType)

## See Also 


* [Tabbed Map Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Tabbed_Map_Sample)

* [Configuring Android Applications to Use Google Maps](http://docwiki.embarcadero.com/RADStudio/en/Configuring_Android_Applications_to_Use_Google_Maps)
* [Mobile Tutorial: Using a Map Component to Work with Maps (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_a_Map_Component_to_Work_with_Maps_(iOS_and_Android))
* [Mobile Tutorial: Using Location Sensors (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Location_Sensors_(iOS_and_Android))





