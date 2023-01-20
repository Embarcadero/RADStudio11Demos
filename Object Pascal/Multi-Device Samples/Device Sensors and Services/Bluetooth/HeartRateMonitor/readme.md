FMX.Heart Rate Monitor Sample[]()
# FMX.Heart Rate Monitor Sample 



## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Implementation](#Implementation)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)

The sample shows how to use the [TBluetoothLE](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE) component in a client application to connect to a Bluetooth LE sensor that implements the Heart Rate standard profile.To have this sample working and showing values, you need a heart rate monitor sensor with Bluetooh LE or Smart Bluetooth technology.

## Location 

You can find the **HeartRate Monitor** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Bluetooth\HeartRateMonitor`
* `CPP\Multi-Device Samples\Device Sensors and Services\Bluetooth\HeartRateMonitor`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/HeartRateMonitor](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/HeartRateMonitor)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/HeartRateMonitor](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Bluetooth/HeartRateMonitor)

## Description 

This is a sample of a client application that searches for a server publishing a particular standard service. In this specific case, the Heart Rate service.The majority of the functionality is implemented using the [TBluetoothLE](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE) component instead of using the framework directly.
![Heart Rate Monitor Bluetooth LE.png](Readme%20Files/Heart%20Rate%20Monitor%20Bluetooth%20LE.png)

## How to Use the Sample 


1.  Navigate to the location given above and open **HeartRateMonitor.dproj**.
2.  Select as a platform a device with a bluetooth sensor.**Note:** See [Using Bluetooth](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth) for more information about client platform support for Bluetooh LE.
3.  Press **F9** or choose **Run > Run**.
4.  Click **Scan** to discover server devices publishing the Heart Rate service.
5.  Click **Stop monitoring** to stop receiving information from the server.

## Implementation 

The **Scan** button starts searching for Bluetooth LE devices implementing the Heart Rate service. It uses the [DiscoverDevices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.DiscoverDevices) method with a timeout period and an array of TBluetoothUUID's, in this case, `BluetoothLE1.DiscoverDevices(2500, [HRSERVICE]) ` where **HRSERVICE** is the standard service for the heart rate measurement: `HRSERVICE: TBluetoothUUID = '{0000180D-0000-1000-8000-00805F9B34FB}'`.After the timeout period the [OnEndDiscoverDevices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.OnEndDiscoverDevices) event is triggered. When there is no available BluetoothLE sensor the `0 devices discovered:` appears on the [TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo), otherwise the number of devices is shown and the application starts searching for the services on the device.
To discover the services on a device it uses the [GetServices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.GetServices) method. If no service is found, the message `'No services found!'` appears on the [TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo), otherwise the application starts getting some specific characteristics for the service using the [GetCharacteristic](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.GetCharacteristic) method:

* **HRMEASUREMENT_CHARACTERISTIC**: `HRMEASUREMENT_CHARACTERISTIC: TBluetoothUUID  = '{00002A37-0000-1000-8000-00805F9B34FB}'`
* **BODY_SENSOR_LOCATION_CHARACTERISTIC**:`BODY_SENSOR_LOCATION_CHARACTERISTIC: TBluetoothUUID  = '{00002A38-0000-1000-8000-00805F9B34FB}'`
After getting the service and the characteristic, the monitoring starts and the values are shown. When the application successfully gets a value for the characteristic, it calls the [SubscribeToCharacteristic](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.SubscribeToCharacteristic) method to start receiving the values periodically. Click **Stop monitoring** to call the [UnSubscribeToCharacteristic](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.UnSubscribeToCharacteristic) method to stop receiving values from the device.The [OnCharacteristicRead](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.OnCharacteristicRead) event is triggered after reading the value of the characteristic.
The server device sends a package with raw data to the client. To extract the information in order to display the bmp's (beats per minute) the sample follows the specification on the GATT profile, extracting the flags from the first byte and then the value. For more information, see [Heart Rate Measurement Data Package Structure](https://developer.bluetooth.org/gatt/characteristics/Pages/CharacteristicViewer.aspx?u=org.bluetooth.characteristic.heart_rate_measurement.xml).

## Uses 


* [System.Bluetooth.Components.TBluetoothLE](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE)
* [System.Bluetooth.Components.TBluetoothLE.DiscoverDevices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.DiscoverDevices)
* [System.Bluetooth.Components.TBluetoothLE.OnEndDiscoverDevices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.OnEndDiscoverDevices)
* [System.Bluetooth.Components.TBluetoothLE.GetServices](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.GetServices)
* [System.Bluetooth.Components.TBluetoothLE.GetCharacteristic](http://docwiki.embarcadero.com/Libraries/en/System.Bluetooth.Components.TBluetoothLE.GetCharacteristic)
* [FMX.Memo.TMemo](http://docwiki.embarcadero.com/Libraries/en/FMX.Memo.TMemo)

## See Also 


* [Using Bluetooth Low Energy](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth_Low_Energy)
* [Using Bluetooth](http://docwiki.embarcadero.com/RADStudio/en/Using_Bluetooth)
* [GATT Specifications for Standard Profiles](https://developer.bluetooth.org/gatt/profiles/Pages/ProfilesHome.aspx)
* [Heart Rate Measurement Data Package Structure](https://developer.bluetooth.org/gatt/characteristics/Pages/CharacteristicViewer.aspx?u=org.bluetooth.characteristic.heart_rate_measurement.xml)





