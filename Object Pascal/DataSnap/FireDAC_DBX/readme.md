DataSnap.FireDAC DBX Sample[]()
# DataSnap.FireDAC DBX Sample 


This is a sample application that shows how to use [DataSnap](http://docwiki.embarcadero.com/RADStudio/en/Developing_DataSnap_Applications) in combination with [dbExpress](http://docwiki.embarcadero.com/RADStudio/en/dbExpress_Feature_Overview) for client-server communications and [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC) to handle data on the client side.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Uses](#Uses)
* [5 See Also](#See_Also)


## Location 

You can find the **DataSnap FireDAC dbExpress** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\DataSnap\FireDAC_DBX`

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/DataSnap/FireDAC_DBX](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/DataSnap/FireDAC_DBX)

## Description 

This is a client-server application where the server application is a DataSnap server which provides access to a database, and the client application uses dbExpress to communicate with the server, and FireDAC to shows the contents of two tables from the server application. You can perform modifications on the client application and apply them on the remote database.![DataSnapFireDACDbExpress.png](Readme%20Files/DataSnapFireDACDbExpress.png)

## How to Use the Sample 


1.  Navigate to the location given above and open `SampleDataSnapFireDAC_DBX_ProjectGroup.groupproj`.
2.  Double-click `SampleDataSnapFireDAC_DBX_Server.dproj` on the **[Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window)** to make it the active project, and press `SHIFT`+`CTRL`+`F9` or choose **Run > Run Without Debugging** to run the server application.
3.  Double-click `SampleDataSnapFireDAC_DBX_Client.dproj` on the **Project Manager** to make it the active project, and press `SHIFT`+`CTRL`+`F9` or choose **Run > Run Without Debugging** to run the client application.
4.  Select **Get Tables** on the client application to connect to the server application.
The client application shows two tables, a main table that shows a list of clients, and a second table below that shows a list of orders of a client selected in the main table.In addition to **Get Tables**, this sample application provides the following buttons:

* **Post Updates**, to send changes that you perform on the grids to the remote database.
* **Cancel Updates**, to reset changes that you perform on the grids, returning any modified cells to the value that they have on the remote database.
* **Reverse String**, which opens a dialog where you can enter a string, send it to the server application, and have the server application reverse the string character by character and return the reversed string.
The client application also provides two checkboxes to configure the communication between the client application and the server application:
* **REST** determines whether the client application uses a [DataSnap REST client](http://docwiki.embarcadero.com/Libraries/en/Datasnap.DSProxyRest.TDSAdminRestClient) (`True`) or a [regular DataSnao client](http://docwiki.embarcadero.com/Libraries/en/Datasnap.DSProxy.TDSAdminClient) (`False`). For details, see [DataSnap REST](http://docwiki.embarcadero.com/RADStudio/en/DataSnap_REST).
* **http** determines whether the communication with the server is encrypted using SSL (`True`) or not (`False`).

## Uses 


* [Datasnap.DSProxy.TDSAdminClient](http://docwiki.embarcadero.com/Libraries/en/Datasnap.DSProxy.TDSAdminClient)
* [Datasnap.DSProxyRest.TDSAdminRestClient](http://docwiki.embarcadero.com/Libraries/en/Datasnap.DSProxyRest.TDSAdminRestClient)

## See Also 


* [DataSnap.FireDAC Sample](http://docwiki.embarcadero.com/CodeExamples/en/DataSnap.FireDAC_Sample)
* [Connect to DataSnap Server](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_DataSnap_Server_(FireDAC))





