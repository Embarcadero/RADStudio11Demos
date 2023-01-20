RTL.BeaconsProximity Sample[]()
# RTL.BeaconsProximity Sample 


The **BeaconProximityDemo** is a sample application for monitoring beacons. This sample provides a tool to register/unregister beacons, monitoring beacons events and checking the proximity of surrounding beacons.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)

* [2.1 Register Beacons](#Register_Beacons)
* [2.2 Detected Beacon](#Detected_Beacon)
* [2.3 Monitoring](#Monitoring)
* [2.4 Live View](#Live_View)

* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 How to register a beacon](#How_to_register_a_beacon)

* [4 Implementation](#Implementation)

* [4.1 Main Unit](#Main_Unit)
* [4.2 Render Unit](#Render_Unit)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **BeaconProximityDemo** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Bluetooth\Beacons\Beacons Proximity`
* `CPP\Multi-Device Samples\Device Sensors and Services\Bluetooth\Beacons\Beacons Proximity`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/Beacons%20Proximity](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/Beacons%20Proximity)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/Beacons%20Proximity](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/Beacons/Beacons%20Proximity)

## Description 

This sample provides a **FireMonkey** application which is based on [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) with four different [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) for four different functionalities: **Register Beacons**, **Detected Beacons**, **Monitoring** and **Live View**.
### Register Beacons 

The **Register Beacons**[TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) provides the possibility of registering/unregistering beacons. For registering a beacon, the **Register Beacons**[TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) includes the following controls:
* **Beacon Type:** The `ComoBox1` control is used for configuring the [ScanMode](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.ScanMode).
* **GUID:** The `EdGuid` control is used for configuring the [GUID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.GUID).
* **Major ID:** the `sbMajor` control is used for configuring the [MajorID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Major).
* **Minor ID:** the `sbMinor` control is used for configuring the [MinorID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Minor).
* **Add Region:** the `BtnAddRegion` control fires the `BtnAddRegionClick` event handler.
* **Delete Region:** the `BtnDeleteRegion` control fires the `BtnDeleteRegionClick` event handler.
* **Start:** the `Button1` control fires the `Button1Click` event handler.
* **Stop:** the `btnStop` control fires the `btnStopClick` event handler.
* **Clear Previous:** the `Button2` control fires the `Button2Click` event handler.
![BeaconsProximity01.png](Readme%20Files/BeaconsProximity01.png)

### Detected Beacon 

The **Detected Beacon**[TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) provides information about the different events which occur during the scanning. For monitoring the different event, the application includes another [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) on it. This [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl) includes 5 [TTabItems](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem), one for each of the possible beacon events:
* **Proximity Changed**: This [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) registers the [OnBeaconProximity](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnBeaconProximity) events.
* **Exit Region**: This [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) registers the [OnExitRegion](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnExitRegion) events.
* **Exited Beacon**: This [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) registers the [OnBeaconExit](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnBeaconExit) events.
* **Entered Beacon**: This [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) registers the [OnBeaconEnter](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnBeaconEnter) events.
* **Entered Region**: This [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) registers the [OnEnterRegion](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnEnterRegion) events.
![BeaconsProximity02.png](Readme%20Files/BeaconsProximity02.png)

### Monitoring 

The **Monitoring**[TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) provides the current information of every detected beacon. Detected beacons are those which were registered before the **Start** scanning button is pressed. Information provided for every beacon is:
* [GUID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.GUID)
* [Major](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Major)
* [Minor](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Minor)
* [Proximity](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Proximity)
* [Rssi](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Rssi)
* [Distance](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Distance)
The `Timer1Timer` event handler of the [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) updates the information of the **Monitoring**[TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem).![BeaconsProximity03.png](Readme%20Files/BeaconsProximity03.png)


### Live View 

The **Live View**[TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) provides a live view representation of the distance and proximity of the beacons related to the device position. It distributes the detected beacons along a straight line representing the distance and proximity to the device. This representation is done through a [TCanvas](http://docwiki.embarcadero.com/Libraries/en/FMX.Graphics.TCanvas). This [TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) also defines the following controls:
* `LbUUID`: Shows the [GUID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.GUID) of the beacon selected in the `BeaconsRectangle`.
* `LbMajor`: Shows the [MajorID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Major) of the beacon selected in the `BeaconsRectangle`.
* `LbMinor`: Shows the [MinorID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Minor) of the beacon selected in the `BeaconsRectangle`.
* `LbDistance`: Shows the [Distance](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Distance) of the beacon selected in the `BeaconsRectangle`.
* `LbRssi`: Shows the [Rssi](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Rssi) of the beacon selected in the `BeaconsRectangle`.
* `BeaconsRectangle`: Shows a representation of the proximity and the distance of the detected beacons. When you select a beacon, the `BeaconsRectangleMouseUp` event handler is fired.
![BeaconsProximity04.png](Readme%20Files/BeaconsProximity04.png)

## How to Use the Sample 


1.  Navigate to the location given above and open:

*  Delphi: **BeaconProximityDemo.dproj**.
*  C++: **BeaconProximityCPP.cbproj**.

2.  Select as a platform, a device with a Bluetooth LE sensor**Note:** See [Using Bluetooth](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth) for more information about client platform support for Bluetooth LE.
3.  Press **F9** or choose **Run > Run**.
4.  Register the beacons you want to detect.
5.  Click **Start** to start to detect beacons.
6.  Click **Stop** to stop to detect beacons.

### How to register a beacon 

As it is explained in [Using Beacons](http://docwiki.embarcadero.com/RADStudio/en/Using_Beacons), the beacons must be registered before being monitored. To register a beacon, the [GUID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.GUID) is mandatory while [MajorID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Major) and [MinorID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Minor) are optional. If you set [MajorID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Major) or [MinorID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Minor) with a value `<=-1`, you register all the possible values for this parameter.
## Implementation 

As a initialization, the `FormCreate` event handler calls the `CheckManager` method and registers some beacons by default which you may modify.
### Main Unit 


*  The application defines the following event handlers:

* `BtnAddRegionClick`: calls the `CheckManager` method and [registers](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.RegisterBeacon) a beacon with the parameters specified in `EdGuid`, `sbMajor`, and `sbMinor`.
* `BtnDeleteRegionClick`: calls the `CheckManager` method and [unregisters](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.UnregisterBeacon) the selected beacon in the `ListBox1`. The event handler also deletes the item from the `ListBox1`.
* `BtnStopClick`: calls the `CheckManager` method and [stops to scan](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.StopScan) beacons and disable the `Timer1` whose event handler is `Timer1Timer`.
* `Button1Click`: calls the `CheckManager` method, executes the [StartScan](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.StartScan) method and enables the `Timer1` in case the [StartScan](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.StartScan) execution success.
* `Button2Click`: Event handler for the **Clear Previous** control button. This event handler clears the following [TListViews](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView):

1. `LvEnteredBeacon`
2. `LvExitedBeacon`
3. `LvEnteredRegion`
4. `LvExitedRegion`
5. `LvMonitoring`

* `BeaconProximity`: Event handler which occurs when the proximity property of any of the registered beacons changes. The event handler adds the beacon whose proximity parameter has changed to the `LvProximity`[TListViews](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) and updates the color of the beacon representation which is shown in the `BeaconsRectangle` of the **Live View**. The colors are set according to the [Proximity](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Proximity) value:

1. [Immediate](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconProximity): Color set to [Green](http://docwiki.embarcadero.com/Libraries/en/System.UITypes.TAlphaColorRec).
2. [Near](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconProximity): Color set to [Yellow](http://docwiki.embarcadero.com/Libraries/en/System.UITypes.TAlphaColorRec).
3. [Far](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconProximity): Color set to [Red](http://docwiki.embarcadero.com/Libraries/en/System.UITypes.TAlphaColorRec).
4. [Away](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconProximity): Color set to [Black](http://docwiki.embarcadero.com/Libraries/en/System.UITypes.TAlphaColorRec).

* `BeaconsRectangleMouseUp`: Event handler related to the `BeaconsRectangle` of the **Live View**[TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem). The event handler sets the selected beacon representation as the `FSelectedBeacon`. The event handler [repaints](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Repaint) the [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle).
* `BeaconsRectanglePaint`: Event handler called when [repaints](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Repaint) is performed. This event handler sets the `LbUUID`, `LbMajor`, `LbMinor`, `LbDistance`, and `LbRssi` with the values of the `FSelectedBeacon`.
* `ComboBox1Change`: This event handler stops to scan beacons, release the [TBeaconManager](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager) instance and calls the `CheckManager` to create a new instance for the new selected **beacon type**. The event handler also register all the beacons included in the `ListBox1`.
* `ListBox1Click`: Event handler which updates the `EdGuid`, `sbMajor` and `sbMinor` with the values of the selected item of the `ListBox1`.
* `SpinBox1Click`: The event handler sets the value of the `SpinBox1` to the `FMaxDistance`.
* `Timer1Timer`: This event handler clears the `LvMonitoring`[TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) and adds an item to the `LvMonitoring` for every beacon which is currently reachable, including the information related to each beacon. This event handler also updates the `FList` and [repaints](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Repaint) the `BeaconsRectangle`.
* `EnterRegion`: The event handler adds a new item to the `LvEnteredRegion`[TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) with the data of the beacon related to the event.
* `ExitRegion`: The event handler adds a new item to the `LvExitedRegion`[TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) with the data of the beacon related to the event.
* `BeaconEnter`: This event handler adds a new item to the `LvEnteredBeacon`[TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) with the data of the beacon related to the event. The event also updates the `FCurrentBeaconList` field.
* `BeaconExit`: This event handler adds a new item to the `LvExitedBeacon`[TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) with the data of the beacon related to the event. The event also updates the `FCurrentBeaconList` field.

*  The application also defines the following methods:

* `CheckManager`: In case there is no instance in `FBeaconManager`, the method gets an instance of the [TBeaconManager](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager) for the beacon type specified in `ComboBox1`. If a new instance is got, the method also registers the following events:

1. [OnBeaconEnter](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnBeaconEnter).
2. [OnBeaconExit](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnBeaconExit).
3. [OnEnterRegion](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnEnterRegion).
4. [OnExitRegion](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnExitRegion).
5. [OnBeaconProximity](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnBeaconProximity).

* `StringToRegion`: This method parses the [GUID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.GUID), [Major](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Major), and [Minor](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Minor) from the input string.

### Render Unit 

The application uses the **BeaconsRender** unit created for this sample. This unit creates the `TBeaconGraphicInfo` record and the `TRender` class. `TRender` class includes the following two methods:
* `Render`: Called from the `BeaconsRectanglePaint` event handler. This method draws the representation of the different beacons in the **Live View** tab.
* `GetObjectUnderMouse`: Method which returns the object located under the mouse. The method is called from the `BeaconsRectangleMouseUp` event handler.

## Uses 


* [FMX.TabControl.TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl)
* [FMX.TabControl.TTabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem)
* [System.Beacon.IBeacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon)
* [System.Beacon.IBeacon.GUID](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.GUID)
* [System.Beacon.IBeacon.Major](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Major)
* [System.Beacon.IBeacon.Minor](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Minor)
* [System.Beacon.IBeacon.Distance](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Distance)
* [System.Beacon.TBeaconManager.ScanMode](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.ScanMode)
* [System.Beacon.IBeacon.Proximity](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Proximity)
* [System.Beacon.IBeacon.Rssi](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.IBeacon.Rssi)
* [System.Beacon.TBeaconManager](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager)
* [System.Beacon.TBeaconManager.OnBeaconEnter](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnBeaconEnter)
* [System.Beacon.TBeaconManager.OnBeaconExit](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnBeaconExit)
* [System.Beacon.TBeaconManager.OnEnterRegion](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnEnterRegion)
* [System.Beacon.TBeaconManager.OnExitRegion](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnExitRegion)
* [System.Beacon.TBeaconManager.OnBeaconProximity](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.OnBeaconProximity)
* [System.Beacon.TBeaconManager.StartScan](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.StartScan)
* [System.Beacon.TBeaconManager.StopScan](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.StopScan)
* [System.Beacon.TBeaconManager.UnregisterBeacon](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconManager.RegisterBeacon)
* [FMX.Types.TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer)
* [FMX.Graphics.TCanvas](http://docwiki.embarcadero.com/Libraries/en/FMX.Graphics.TCanvas)
* [FMX.ListView.TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView)
* [System.Beacon.TBeaconProximity](http://docwiki.embarcadero.com/Libraries/en/System.Beacon.TBeaconProximity)
* [System.UITypes.TAlphaColorRec](http://docwiki.embarcadero.com/Libraries/en/System.UITypes.TAlphaColorRec).
* [FMX.Controls.TControl.Repaint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Repaint)
* [FMX.Objects.TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle)

## See Also 


* [Using Bluetooth Low Energy](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth_Low_Energy)
* [Using Beacons](http://docwiki.embarcadero.com/RADStudio/en/Using_Beacons)





