DataSnap.FireDAC Sample[]()
# DataSnap.FireDAC Sample 


This is a sample application that shows how to use [DataSnap](http://docwiki.embarcadero.com/RADStudio/en/Developing_DataSnap_Applications) in combination with [FireDAC](http://docwiki.embarcadero.com/RADStudio/en/FireDAC).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 See Also](#See_Also)


## Location 

You can find the **DataSnap FireDAC** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\DataSnap\FireDAC`

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/DataSnap/FireDAC](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/DataSnap/FireDAC)

## Description 

This is a client-server application where the server application is a DataSnap server which provides access to a database, and the client application uses FireDAC to shows the contents of two tables from the server application. You can perform modifications on the client application and apply them on the remote database.![DataSnapFireDAC.png](Readme%20Files/DataSnapFireDAC.png)

## How to Use the Sample 


1.  Navigate to the location given above and open `SampleDataSnapFireDAC_ProjectGroup.groupproj`.
2.  Double-click `SampleDataSnapFireDAC_Server.dproj` on the **[Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window)** to make it the active project, and press `SHIFT`+`CTRL`+`F9` or choose **Run > Run Without Debugging** to run the server application.
3.  Double-click `SampleDataSnapFireDAC_Client.dproj` on the **Project Manager** to make it the active project, and press `SHIFT`+`CTRL`+`F9` or choose **Run > Run Without Debugging** to run the client application.
4.  Select **Get Tables** on the client application to connect to the server application.
The client application shows two tables, a main table that shows a list of clients, and a second table below that shows a list of orders of a client selected in the main table.In addition to **Get Tables**, this sample application provides the following buttons:

* **Post Updates**, to send changes that you perform on the grids to the remote database.
* **Cancel Updates**, to reset changes that you perform on the grids, returning any modified cells to the value that they have on the remote database.
* **Reverse String**, which opens a dialog where you can enter a string, send it to the server application, and have the server application reverse the string character by character and return the reversed string.

## See Also 


* [DataSnap.FireDAC DBX Sample](http://docwiki.embarcadero.com/CodeExamples/en/DataSnap.FireDAC_DBX_Sample)
* [Tutorial: Using a REST DataSnap Server with an Application and FireDAC](http://docwiki.embarcadero.com/RADStudio/en/Tutorial:_Using_a_REST_DataSnap_Server_with_an_Application_and_FireDAC)
* [Connect to DataSnap Server](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_DataSnap_Server_(FireDAC))





