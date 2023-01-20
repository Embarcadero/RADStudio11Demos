RTL.BDShoppingList Sample[]()
# RTL.BDShoppingList Sample 


**BDShoppingList** is a sample application with a client-server architecture where the server application keeps a table of products with the current and required units in stock, and a client application lets you increase the current units in stock remotely in batches of 100 units until you reach the required stock of a product.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)

* [6.1 Server Application](#Server_Application)
* [6.2 Client Application](#Client_Application)

* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **BDShoppingList** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either of the following folders:

* **CPP/RTL/Tethering/BDShoppingList**
* **Object Pascal/RTL/Tethering/BDShoppingList**

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/RTL/Tethering/BDShoppingList](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/RTL/Tethering/BDShoppingList)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/RTL/Tethering/BDShoppingList](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/RTL/Tethering/BDShoppingList)

## Description 

This sample applications folder provides a client project and a server project. The projects are designed so that you can run any number of instances of the client project, but only one server.In the server application (**TetherDatabase**) you have a grid with a table of products, and fields on top of the grid that you can use to edit records from the grid.


![TetherDBServer.png](Readme%20Files/TetherDBServer.png)

In the client application (**TetherDBClient**) you have a list of products without enough units in stock. There is also a **Connect** button that you can use to connect to the server. When you connect to the server, a label shows the name of the connected server.

![TetherDBClient.png](Readme%20Files/TetherDBClient.png)


## How to Use the Sample 


1.  Navigate to the location given above and open **TetherShopping.groupproj**.
2.  On the **[Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window)**, double-click **TetherDatabase** to activate the server application.
3.  Select **Run > Run** to run the server application.
4.  On the **Project Manager**, double-click **TetherDBClient** to activate the client application.
5.  Select **Run > Run** to run the client application.

## Files 

Each application in the project group contains a single source file that contains the class for the main form of the application.
## Classes 

Each application defines a single class that implements the main form of the application.
## Implementation 


### Server Application 


*  The application defines the following methods:

* `CreateShoppingList` iterates `CDSProducts`, builds a [string list](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TStringList) with the information from `CDSProducts` that clients need, and saves the information as the [value](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalResource.Value) of `ResShoppingList`.

*  The application defines the following event handlers:

* `actGetListExecute` calls `CreateShoppingList`.
* `CDSProductsAfterPost` calls `CreateShoppingList`.
* `TetherBDTestProfileResourceReceived` increases in 100 the number of units in stock of the product with the same ID as the [value](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TRemoteResource.Value) of the incoming [resource](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TRemoteResource).

*  The application defines several controls (input fields and a grid) that provide read and write access to the data in `CDSProducts`.
*  The application defines the following nonvisual components:

* `ActionList1` defines a single action, `actGetList`, which calls `actGetListExecute` when executed.
* `TetherBDTest.Password` is "TetherBDTest".
* `TetherBDTestProfile`:

* `Actions` contains a [local action](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalAction) that is associated with `actGetList` and is shared with remote profiles.
* `Group` is "TetherBDTestGroup".
* `Manager` is `TetherBDTest`.
* `OnResourceReceived` is handled by `TetherBDTestProfileResourceReceived`.
* `Resources` contains a single [local resource](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalResource), `ResShoppingList`, which is shared with remote profiles.

* `CDSProducts`:

* `AfterPost` is handled by `CDSProductsAfterPost`.
*  Handlers of `Form2`’s `OnCreate` and `OnClose` events load and save the `CDSProducts` data to a file, respectively.

### Client Application 


*  The application defines the following methods:

* `CheckRemoteProfiles` updates `Label2.Text` with the [list of connected remote profiles](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.RemoteProfiles) and runs the `actGetList` remote action if required.

*  The application defines the following event handlers:

* `TetherBDTestProfileResources0ResourceReceived`[clears](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAppearanceListViewItems) the list and [adds new items](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Appearances.TAppearanceListViewItems.Add) to `ListView1` with the updated data received on the `ResShoppingList` mirror resource.
* `tmCheckConnectionTimer` calls `CheckRemoteProfiles`.
* `TetherBDTestManagerEndAutoConnect` calls `CheckRemoteProfiles`.
* `TetherBDTestManagerRemoteManagerShutdown` calls `CheckRemoteProfiles`.
* `CommandManagerRequestManagerPassword` provides the password of the remote server application: "TetherBDTest".

*  The application defines the following controls:

* `Button1` (**Connect**) starts `tmCheckConnection` and calls `AutoConnect` on `TetherBDTestManager`.
*  When you [click](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView.OnButtonClick) a **Buy 100** button in `ListView1`, the list [sends](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.SendString) the product ID of the list item to the server application.

*  The application defines the following nonvisual components:

* `TetherBDTestManager`:

* `OnEndAutoConnect` is handled by `TetherBDTestManagerEndAutoConnect`.
* `OnRemoteManagerShutdown` is handled by `TetherBDTestManagerRemoteManagerShutdown`.
* `OnRequestManagerPassword` is handled by `TetherBDTestManagerRequestManagerPassword`.

* `TetherBDTestProfile`:

* [Actions](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Actions) contains a single [local action](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalAction) with `Mirror` as [Kind](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TCustomLocalItem.Kind) and the same name as the action shared by the server application. This action is associated with the action in `ActionList1`, `actGetList`.
* `Group` is "TetherBDTestGroup".
* `Resources` contains a single [local resource](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalResource), `ResShoppingList`, with `Mirror` as [Kind](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TCustomLocalItem.Kind) and the same names as the resource shared by the server application. The `OnResourceReceived` event of this local resource is handled by `TetherBDTestProfileResources0ResourceReceived`.

* `tmCheckConnection` triggers `tmCheckConnectionTimer` each two seconds.

## Uses 


* [System.Tether.AppProfile.TLocalAction](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalAction)
* [System.Tether.AppProfile.TLocalAction.Kind](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TCustomLocalItem.Kind)

* [System.Tether.AppProfile.TLocalResource](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalResource)
* [System.Tether.AppProfile.TLocalResource.Kind](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TCustomLocalItem.Kind)
* [System.Tether.AppProfile.TLocalResource.OnResourceReceived](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalResource.OnResourceReceived)
* [System.Tether.AppProfile.TLocalResource.Value](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalResource.Value)

* [System.Tether.AppProfile.TRemoteResource](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TRemoteResource)
* [System.Tether.AppProfile.TRemoteResource.Value](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TRemoteResource.Value)

* [System.Tether.AppProfile.TTetheringAppProfile](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile)
* [System.Tether.AppProfile.TTetheringAppProfile.Actions](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Actions)
* [System.Tether.AppProfile.TTetheringAppProfile.Group](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfile.Group)
* [System.Tether.AppProfile.TTetheringAppProfile.Manager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfile.Manager)
* [System.Tether.AppProfile.TTetheringAppProfile.OnResourceReceived](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.OnResourceReceived)
* [System.Tether.AppProfile.TTetheringAppProfile.Resources](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Resources)
* [System.Tether.AppProfile.TTetheringAppProfile.SendString](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.SendString)

* [System.Tether.Manager.TTetheringManager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager)
* [System.Tether.Manager.TTetheringManager.AutoConnect](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.AutoConnect)
* [System.Tether.Manager.TTetheringManager.OnEndAutoConnect](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.OnEndAutoConnect)
* [System.Tether.Manager.TTetheringManager.OnRemoteManagerShutdown](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.OnRemoteManagerShutdown)
* [System.Tether.Manager.TTetheringManager.OnRequestManagerPassword](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.OnRequestManagerPassword)
* [System.Tether.Manager.TTetheringManager.Password](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.Password)
* [System.Tether.Manager.TTetheringManager.RemoteProfiles](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.RemoteProfiles)

* [Datasnap.DBClient.TClientDataSet](http://docwiki.embarcadero.com/Libraries/en/Datasnap.DBClient.TClientDataSet)
* [Datasnap.DBClient.TClientDataSet.AfterPost](http://docwiki.embarcadero.com/Libraries/en/Datasnap.DBClient.TClientDataSet.AfterPost)

## See Also 


* [Using App Tethering](http://docwiki.embarcadero.com/RADStudio/en/Using_App_Tethering)

* [System.Tether](http://docwiki.embarcadero.com/Libraries/en/System.Tether) unit

* [DesktopCast](http://docwiki.embarcadero.com/CodeExamples/en/RTL.DesktopCast_Sample) sample
* [MediaPlayer](http://docwiki.embarcadero.com/CodeExamples/en/RTL.MediaPlayer_Sample) sample
* [PhotoWall](http://docwiki.embarcadero.com/CodeExamples/en/RTL.PhotoWall_Sample) sample





