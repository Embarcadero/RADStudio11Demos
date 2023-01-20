RTL.Proximity Client and Server Sample[]()
# RTL.Proximity Client and Server Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)

* [4.1 Scanning Devices](#Scanning_Devices)
* [4.2 Getting Services and Characteristics](#Getting_Services_and_Characteristics)
* [4.3 Reading and Writing Characteristics](#Reading_and_Writing_Characteristics)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)

This sample shows how to implement a client-server connection using the Bluetooth Low Energy framework. The sample demonstrates how to discover devices, get services and get their characteristics. The sample includes a **ProximityClient** and a **ProximityServer**. 
## Location 

You can find the **ProximityClient** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Bluetooth\ProximityClientServer`
* `CPP\Multi-Device Samples\Device Sensors and Services\Bluetooth\ProximityClientServer`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/ProximityClientServer](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/ProximityClientServer)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/ProximityClientServer](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/ProximityClientServer)

## Description 

This sample consists of a **ProximityClient** application that connects with a **ProximityServer** using Bluetooth LE.The client searches for Bluetooth LE sensor devices. If the server is active, the client allows you to connect to the server and get proximity information. The client application displays the **Tx Power**, **RSSI**, **Path Loss** values as well as the **Distance** to the server device. During the connection, the server and the client applications display in a [TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo) the information regarding the status of the connection, the events and some values for a characteristic, such as the UID.
The following table shows the different behaviors of the client-server connection having different distances between the client-server devices. When the devices are close, the client displays a **Near** message and the server a green flag meaning **No Alert**. If the distance increases, the client displays **Far** and the server a yellow flag meaning **Mild Alert**. Finally, if the devices are far enough, the client displays **So Far** and the server a red flag meaning **High Alert**.


|                     | **Near**                                         | **Far**                                        | **So Far**                                         |
| ------------------- | ------------------------------------------------ | ---------------------------------------------- | -------------------------------------------------- |
| **ProximityClient** | ![NearClient.png](Readme%20Files/NearClient.png) | ![FarClient.png](Readme%20Files/FarClient.png) | ![SoFarClient.png](Readme%20Files/SoFarClient.png) |
| **ProximityServer** | ![NearServer.png](Readme%20Files/NearServer.png) | ![FarServer.png](Readme%20Files/FarServer.png) | ![SoFarServer.png](Readme%20Files/SoFarServer.png) |


## How to Use the Sample 


1.  Navigate to the location given above and open **ProximityClientServer.groupproj**. It includes the **ProximityServer** and **ProximityClient** projects.
2.  Build the project group.
3.  To run the server:

1.  In the **ProximityServer** target platform, select a device with Bluetooth.**Note:** See [Using Bluetooth](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth) for more information about client platform support for Bluetooh LE.
2.  Run the application by clicking **Run > Run** in the IDE or by pressing **F9**.
3.  Click **Start announce** to start the server and create the services.

4.  To run the client:

1.  In the **ProximityClient** target platform, select a device with Bluetooth.**Note:** See [Using Bluetooth](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth) for more information about client platform support for Bluetooh LE.
2.  Run the application by clicking **Run > Run** in the IDE or by pressing **F9**.
3.  Click **Scan** to start discovering devices.
4.  Click **Connect** to connect the server device and get proximity information.

## Implementation 

To use the RTL Bluetooth feature, you must include the [System.Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth) unit in your application. 
### Scanning Devices 

To have this application running, the first thing needed is to find devices with Bluetooth LE sensor.The **Start Annnounce** button in the server application calls [TBluetoothLEManager.Current](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.Current) to get an instance of [TBluetoothLEManager](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager). TBluetoothManager is the main class of the Bluetooth Low Energy implementation of the RTL.
In the client application, the **Scan** button calls the [StartDiscovery](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.StartDiscovery) method using a single argument <Timeout> to start discovering devices. The <Timeout> specifies how much time you want to spend discovering remote devices using Bluetooth Low Energy. 
The [OnServicesDiscovered](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.OnServicesDiscovered) event is triggered when the discovery operation finishes. The **btnConnect** button is enabled and you can connect with the BluetoothLE service.

### Getting Services and Characteristics 

When you press the **btnConnect** button in the client interface, it calls a **GetServiceAndCharacteristics** method that access to [TBluetoothGattServiceList](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothGattServiceList) to get the UIDDName of the [Characteristic](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothGattCharacteristic.UUIDName) and the [Service](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothGattService.UUIDName). This information is displayed in the [TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo).
### Reading and Writing Characteristics 

The [OnCharacteristicRead](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.OnCharacteristicRead)/[OnCharacteristicWrite](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.OnCharacteristicWrite) events fire after reading/writing the characteristic.You can also [write](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.WriteCharacteristic) on a characteristic when this option is supported. 

## Uses 


* [System.Bluetooth](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth)
* [System.Bluetooth.TBluetoothLEDevice.OnServicesDiscovered](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.OnServicesDiscovered)
* [System.Bluetooth.TBluetoothLEDevice.DiscoverServices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.DiscoverServices)
* [System.Bluetooth.TBluetoothLEManager.LastDiscoveredDevices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.LastDiscoveredDevices)
* [System.Bluetooth.TBluetoothLEDevice.Services](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.Services)
* [System.Bluetooth.TBluetoothLEDevice.ReadCharacteristic](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.ReadCharacteristic)
* [System.Bluetooth.TBluetoothLEDevice.OnCharacteristicRead](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.OnCharacteristicRead)
* [System.Bluetooth.TBluetoothLEDevice.WriteCharacteristic](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEDevice.WriteCharacteristic)
* [System.Bluetooth.TBluetoothLEManager.OnDiscoveryEnd](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.OnDiscoveryEnd)
* [System.Bluetooth.TBluetoothLEManager.StartDiscovery](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.TBluetoothLEManager.StartDiscovery)
* [FMX.Types.TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer)

## See Also 


* [Using Bluetooth Low Energy](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth_Low_Energy)
* [Using Bluetooth](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth)
* [FMX.Heart Rate Monitor Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Heart_Rate_Monitor_Sample)
* [RTL.Explore BluetoothLE Devices Sample](http://docwiki.embarcadero.com/CodeExamples/en/RTL.Explore_BluetoothLE_Devices_Sample)
* [GATT Specifications for Standard Profiles](https://developer.bluetooth.org/gatt/profiles/Pages/ProfilesHome.aspx)
* [Heart Rate Measurement Data Package Structure](https://developer.bluetooth.org/gatt/characteristics/Pages/CharacteristicViewer.aspx?u=org.bluetooth.characteristic.heart_rate_measurement.xml)





