FireDAC.MoniLayerClients Sample[]()
# FireDAC.MoniLayerClients Sample 


This sample demonstrates how to use different [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC) monitor clients such as FlatFile client or Remote client.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Define the trace / monitor output of a connection definition](#Define_the_trace_.2F_monitor_output_of_a_connection_definition)
* [5.2 Enable / Disable the tracing](#Enable_.2F_Disable_the_tracing)
* [5.3 Controlling the output](#Controlling_the_output)
* [5.4 Output user messages](#Output_user_messages)
* [5.5 Output example](#Output_example)

* [6 See Also](#See_Also)


## Location 

You can find the **MoniLayerClients** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\Moni Layer\Clients`

* **GitHub Repository:**

* **Delphi:**[https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Database/FireDAC/Samples/Moni%20Layer/Clients](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Database/FireDAC/Samples/Moni%20Layer/Clients)

## Description 

The **MoniLayerClients** sample shows you how to use the FireDAC [tracing and monitoring](http://docwiki.embarcadero.com/RADStudio/en/Tracing_and_Monitoring_(FireDAC)) capabilities to show how an application is communicating with a FireDAC monitor client. To this end, the sample uses two different FireDAC monitor clients: FlatFile-client and Remote-client. To use both monitor clients, the sample uses two client link components: the TFDMoniFlatFileClientLink component and the [TFDMoniRemoteClientLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Moni.RemoteClient.TFDMoniRemoteClientLink) component.
## How to Use the Sample 


1.  Navigate to the location given above and open `Clients.dproj`.
2.  Press F9 or choose **Run > Run**.
3.  Click on the **Use Connection Definition** combo box and select an option; for example: `EMPLOYEE`.
4.  Select a monitor client.

## Files 



| File in Delphi               | Contains            |
| ---------------------------- | ------------------- |
| `Clients.dproj``Clients.dpr` | The project itself. |
| `fClients.pas``fClients.fmx` | The main form.      |


## Implementation 

The following steps are needed to implement the sample.
### Define the trace / monitor output of a connection definition 

Type the following code to set up a [connection definition](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC)) using none, remote or flat file monitoring.
```
var
  oConnectionDef: IFDStanConnectionDef;
begin
  oConnectionDef := ...
  ...
  // Set up connection def to use none client
  oConnectionDef.Params.MonitorBy := 'None';
  ...

```


or
```
  ...
  // Set up connection def to use Remote client
  oConnectionDef.MonitorBy := 'Remote'
  ...

```


or
```
  ...
  // Set up connection def to use Remote client
  oConnectionDef.Params.MonitorBy := 'FlatFile';
  ...

```



### Enable / Disable the tracing 

To enable the tracing, set the **Tracing** property of the component to `True`. To disable the tracing, set the **Tracing** property of the component to `False`.
```
FDMoniRemoteClientLink1: TFDMoniRemoteClientLink;
FDMoniFlatFileClientLink1: TFDMoniFlatFileClientLink;
// ...
// ...
FDMoniRemoteClientLink1.Tracing := True;
FDmoniFlatFileClientLink1.Tracing := True;
// ...

```


or
```
// ...
FDMoniRemoteClientLink1.Tracing := False;
FDMoniFlatFileClientLink1.Tracing := False;
//...

```



### Controlling the output 

To control the output of each client link component, use the **[Object Inspector](http://docwiki.embarcadero.com/RADStudio/en/Object_Inspector)** to make some settings in design time.The [TFDMoniRemoteClientLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Moni.RemoteClient.TFDMoniRemoteClientLink) component controls the remote trace output. It outputs the trace to the [FDMonitor](http://docwiki.embarcadero.com/RADStudio/en/FDMonitor) utility and allows to monitor the application. [FDMonitor](http://docwiki.embarcadero.com/RADStudio/en/FDMonitor) must be running before activating a trace output. To control the output, set up the following properties:

```
...
// Use the Host property to specify the FDMonitor host IP addres
FDMoniRemoteClientLink1.Host := '127.0.0.1';
// Use the Port property to specify the IP port where FDMonitor is listening
ADMoniRemoteClientLink1.Port := 8050;
// The EventKinds property specifies the information set to send to FDMonitor
ADMoniRemoteClientLink1.EventKinds := [ekLiveCycle (...) ekVendor];
...

```


The TFDMoniFlatFileClientLink component outputs the trace to a flat text file. When the application finishes, it shows the list of produced trace files. By default, the trace file name is automatically generated in the Temp folder of your system. To control the output, set up the following properties:
```
...
// You may specify trace file name here
FDMoniFlatFileClientLink1.FileName := 'C:\Users\test\AppData\Local\Temp\trace.txt';
// Set up whether append or not the records to your file
FDMoniFlatFileClientLink1.FileAppend := False;
...

```



### Output user messages 

Use this code to produce custom trace outputs.
```
var
  oMoni: IFDMoniClient;
begin
  //...
  oMoni.Tracing := True;
  oMoni.Notify(ekVendor, esStart,    Self, 'Start monitoring',        ['Form', 'frmClients']);
  oMoni.Notify(ekVendor, esProgress, Self, 'Progress monitoring',     ['Form', 'frmClients']);
  oMoni.Notify(ekVendor, esEnd,      Self, 'End monitoring',          ['Form', 'frmClients']);
  oMoni.Notify(ekError,  esProgress, Self, 'Error during monitoring', ['Form', 'frmClients']);
  oMoni.Tracing := False;
  //...

```



### Output example 

The following image is an example of the trace output produced with a flat file monitor client.

![FlatFileTrace.png](Readme%20Files/FlatFileTrace.png)


## See Also 


* [Defining Connection (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Defining_Connection_(FireDAC))
* [Common Connection Parameters (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Common_Connection_Parameters_(FireDAC))
* [Tracing and Monitoring (FireDAC)](http://docwiki.embarcadero.com/RADStudio/en/Tracing_and_Monitoring_(FireDAC))





