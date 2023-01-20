RTL.BeaconProximityColors Sample[]()
# RTL.BeaconProximityColors Sample 


The sample shows how to implement an application for detecting changes on the [proximity](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.IBeacon.Proximity) property of a detected [Beacon](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon). The sample indicates if a new beacon has gone into the [Inmediate](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconProximity) area. If a change is detected, the form changes its background color.To have this sample working and showing changes, you need a Bluetooth LE beacon compatible to one of the available [types](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconScanMode): **iBeacon** or **AltBeacon**.

## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **ColorBeaconProximity** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Bluetooth\Beacons\DemoProximityColors`
* `CPP\Multi-Device Samples\Device Sensors and Services\Bluetooth\Beacons\DemoProximityColors`

* **GitHub Repository:**

* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/DemoProximityColors](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/DemoProximityColors)
* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/DemoProximityColors](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/DemoProximityColors)

## Description 

This sample searches beacons that are advertising its manufacturer data according to one of the available [types](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconScanMode). This sample is developed using the Beacon framework directly instead of the [TBeacon](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.Components.TBeacon) component. In [Using Beacons](http://docwiki.embarcadero.com/RADStudio/Denali/en/Using_Beacons) you can find more information about how to implement a beacon application.![BeaconProximityColor.png](Readme%20Files/BeaconProximityColor.png)

## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **ColorsBeaconProximity.dproj**.
*  C++: **ColorsBeaconProximityCPP.cbproj**.

2.  Select as a platform, a device with a bluetooth LE sensor.**Note:** See [Using Bluetooth](http://docwiki.embarcadero.com/RADStudio/Denali/en/Using_Bluetooth) for more information about client platform support for Bluetooh LE.
3.  Press **F9** or choose **Run > Run**.
4.  Click **Start** to start to detect beacons.
5.  Click **Stop** to stop to detect beacons.

## Implementation 

When the form is initially shown, the application initializes and configures everything needed for receiving beacons:
*  Gets an instance of the [TBeaconManager](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager) for the beacon [type](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconScanMode). The sample is configured for **Standard** (iBeacon), you must get the instance for the type of your beacon.
*  Registers the event [OnBeaconProximity](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager.OnBeaconProximity).**Note:** The [OnBeaconProximity](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager.OnBeaconProximity) event occurs every time the proximity parameter of a detected beacon changes.
* [Registers](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager.RegisterBeacon) the beacons you want to detect.**Note:** The sample is registered for the UUID {B9407F30-F5F8-466E-AFF9-25556B57FE6D}. You must register the UUID of your own beacons.
*  Configures some parameters of the [TBeaconManager](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager):

* [CalcMode](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager.CalcMode)
* [ScanningTime](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager.ScanningTime)
* [ScanningSleepingTime](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager.ScanningSleepingTime)

* And [starts](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager.StartScan) scanning beacons.
Once the [OnBeaconProximity](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager.OnBeaconProximity) event occurs, if the new proximity parameter is [Inmediate](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconProximity), the color of the form changes. The color is associated to the beacon which proximity value changes. In this sample, the beacon is identified by its Major ID, you must use the Major ID and/or Minor ID of your beacon instead.
## Uses 


* [System.Beacon.TBeaconManager](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager)
* [System.Beacon.TBeaconProximityEvent](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconProximityEvent)
* [System.Beacon.TBeaconProximity](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconProximity)
* [System.Beacon.IBeacon.Major](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.IBeacon.Major)
* [System.Beacon.TBeaconManager.StartScan](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager.StartScan)
* [System.Beacon.TBeaconManager.StopScan](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager.StopScan)
* [System.Beacon.TBeaconManager.GetBeaconManager](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager.GetBeaconManager)
* [System.Beacon.TBeaconManager.RegisterBeacon](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Beacon.TBeaconManager.RegisterBeacon)
* [System.TGUID](http://docwiki.embarcadero.com/Libraries/Denali/en/System.TGUID)

## See Also 


* [Using Bluetooth Low Energy](http://docwiki.embarcadero.com/RADStudio/Denali/en/Using_Bluetooth_Low_Energy)
* [Using Beacons](http://docwiki.embarcadero.com/RADStudio/Denali/en/Using_Beacons)





