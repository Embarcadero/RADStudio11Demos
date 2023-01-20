RTL.Explore BluetoothLE Devices Sample[]()
# RTL.Explore BluetoothLE Devices Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 Finding Devices](#Finding_Devices)
* [4.2 Finding and Getting Services](#Finding_and_Getting_Services)
* [4.3 Reading and Writing Characteristics](#Reading_and_Writing_Characteristics)
* [4.4 Enabling Notifications](#Enabling_Notifications)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This sample shows how to use the Bluetooth Low Energy framework to discover devices, get services and get their characteristics with the corresponding values and available options.Part of the sample can be implemented using the [TBluetoothLE](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE) component as in the [FMX.Heart Rate Monitor Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Heart_Rate_Monitor_Sample) but this sample is focused on using only the framework.
To have this sample working and showing values, you need a heart rate monitor sensor with Bluetooh LE or Smart Bluetooth technology.

## Location 

You can find the **Explore Devices LE** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Bluetooth\ExploreDevicesLE`
* `CPP\Multi-Device Samples\Device Sensors and Services\Bluetooth\ExploreDevicesLE`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/ExploreDevicesLE](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/ExploreDevicesLE)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/ExploreDevicesLE](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/ExploreDevicesLE)

## Description 

This sample is a client application that searches for Bluetooth LE sensor devices. The application allows selecting a device to see all the services on the device and also all the characteristics for a particular service. 
On the right-hand panel you can see some values for a characteristic, such as the name, UID, and current value. On the **Available operations** panel the available options for the current characteristic are selected. The application allows writing on the values for the characteristics that allow writing.
The functionality is implemented using the [System.Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth) framework directly.
![BluetoothLE Device Explorer.png](Readme%20Files/BluetoothLE%20Device%20Explorer.png)

## How to Use the Sample 


1.  Navigate to the location given above and open **ExploreDevicesLE.dproj**.
2.  Select as a platform a device with Bluetooth.**Note:** See [Using Bluetooth](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth) for more information about client platform support for Bluetooh LE.
3.  Press **F9** or choose **Run > Run**.
4.  Click **Find devices** to start discovering devices.
5.  After the timeout period you can select one of the found devices from the drop-down menu and then click **Select**.
6.  Click **Get services** to get all the services for the selected device.
7.  Select a characteristic from a service to see on the right-hand panel the details including the UUID and the available operations for the selected characteristic.

## Implementation 

To use the RTL Bluetooth feature, you must include the [System.Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth) unit in your application. 
### Finding Devices 

To have this application running the first thing needed is to find devices with Bluetooth LE sensor. The **Find devices** button calls [TBluetoothLEManager.Current](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.Current) to get an instance of [TBluetoothLEManager](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager). TBluetoothManager is the main class of the Bluetooth Low Energy implementation of the RTL.The [StartDiscovery](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.StartDiscovery) method is called with a single argument <Timeout>, to start discovering devices. The <Timeout> specifies how much time you want to spend discovering remote devices using Bluetooth Low Energy. 
The [OnDiscoveryEnd](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.OnDiscoveryEnd) event is triggered when the discovery operation finishes. The **tmAnimateFindDevices** timer is set to **False** and the [TProgressBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar) is completed. This timer is used to increment the toolbar using the specified time on the [Interval](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer.Interval) property of the timer.

### Finding and Getting Services 

After selecting a discovered device from the drop-down menu, click the **Select** button to fill the **text** property of the **EdCurrentDevice** label. The **Get Services** button gets the current device using the **EdCurrentDevice** label. The [DiscoverServices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.DiscoverServices) method is called to search for the available services on the device. The [OnServicesDiscovered](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.OnServicesDiscovered) event fires when the discovery operation finishes and the [TTreeView](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeView) shows all the characteristics for all the services on the devices in a hierarchical way.
The **tmAnimateFindServices** timer is used to increment the toolbar while searching the services for the current device.

### Reading and Writing Characteristics 

Click the **Get all Values...** button to get the information for the selected characteristic on the [TTreeView](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeView).The [OnCharacteristicRead](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.OnCharacteristicRead) event fires after reading the characteristic. The [TBluetoothGattService.Characteristics](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothGattService.Characteristics) is called with the current characteristic as a parameter to fill the values and the **available operations** on the right-hand side of the application.
You can also write on a characteristic when this option is supported. The **Write** button calls the [WriteCharacteristic](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.WriteCharacteristic) method for this purpose.

### Enabling Notifications 

The **Subscribe** button calls [SetCharacteristicNotification](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.SetCharacteristicNotification) to enable notifications when the characteristics supports it, otherwise the `"This characteristic doesn't allow notifications"` message is shown.
## Uses 


* [System.Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth)
* [System.Bluetooth.TBluetoothLEDevice.OnServicesDiscovered](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.OnServicesDiscovered)
* [System.Bluetooth.TBluetoothLEDevice.DiscoverServices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.DiscoverServices)
* [System.Bluetooth.TBluetoothLEManager.LastDiscoveredDevices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.LastDiscoveredDevices)
* [System.Bluetooth.TBluetoothLEDevice.Services](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.Services)
* [System.Bluetooth.TBluetoothGattService.Characteristics](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothGattService.Characteristics)
* [System.Bluetooth.TBluetoothLEDevice.ReadCharacteristic](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.ReadCharacteristic)
* [System.Bluetooth.TBluetoothLEDevice.OnCharacteristicRead](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.OnCharacteristicRead)
* [System.Bluetooth.TBluetoothLEDevice.SetCharacteristicNotification](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.SetCharacteristicNotification)
* [System.Bluetooth.TBluetoothLEDevice.WriteCharacteristic](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.WriteCharacteristic)
* [System.Bluetooth.TBluetoothLEManager.OnDiscoveryEnd](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.OnDiscoveryEnd)
* [System.Bluetooth.TBluetoothLEManager.StartDiscovery](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.StartDiscovery)
* [System.Bluetooth.TBluetoothLEDevice.SetCharacteristicNotification](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.SetCharacteristicNotification)
* [FMX.Types.TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer)
* [FMX.StdCtrls.TProgressBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar)
* [FMX.TreeView.TTreeView](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeView)

## See Also 


* [Using Bluetooth Low Energy](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth_Low_Energy)
* [Using Bluetooth](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth)
* [FMX.Heart Rate Monitor Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Heart_Rate_Monitor_Sample)
* [GATT Specifications for Standard Profiles](https://developer.bluetooth.org/gatt/profiles/Pages/ProfilesHome.aspx)
* [Heart Rate Measurement Data Package Structure](https://developer.bluetooth.org/gatt/characteristics/Pages/CharacteristicViewer.aspx?u=org.bluetooth.characteristic.heart_rate_measurement.xml)





