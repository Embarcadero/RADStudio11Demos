RTL.DesktopCast Sample[]()
# RTL.DesktopCast Sample 


**DesktopCast** is a sample application with a client-server architecture where a client application can connect to a server application and receive a screenshot taken by the server application once or every 5 seconds [using app tethering](http://docwiki.embarcadero.com/RADStudio/en/Using_App_Tethering). The server application is a [VCL](http://docwiki.embarcadero.com/RADStudio/en/VCL_Overview) application, and the client application is available both as a VCL application and as a [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey) application.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)

* [6.1 Server Application](#Server_Application)
* [6.2 FireMonkey Client Application](#FireMonkey_Client_Application)
* [6.3 VCL Client Application](#VCL_Client_Application)

* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **DesktopCast** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either of the following folders:

* **CPP\RTL\Tethering\DesktopCast**
* **Object Pascal\RTL\Tethering\DesktopCast**

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/RTL/Tethering/DesktopCast](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/RTL/Tethering/DesktopCast)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/RTL/Tethering/DesktopCast](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/RTL/Tethering/DesktopCast)

## Description 

This group of projects provides two client projects (VCL and FireMonkey) and a server project. The projects are designed so that at a given time you have one of the client projects and the server project running and reachable [using app tethering](http://docwiki.embarcadero.com/RADStudio/en/Using_App_Tethering).In the server application you have the following buttons:

* **TakeFullScreenShot** takes a screenshot and shows the screenshot.
* **StartLiveCast** starts taking screenshots each 5 seconds and showing them.
* **StopLiveCast** stops taking screenshots.
In the client application you have the following buttons:
* **Connect** establishes a connection to the running server application.
 When the connection finishes, you can see text at the top of the application, over the control buttons. If the connection failed, the message says "You are not connected". If the connection is successful, the message says "Working with: - TTetheringAppProfile1".
* **TakeFullScreenShot** or **TakeShot** executes the server action to take a screenshot remotely.
* **StartLiveCast** or **Start Cast** executes the server action to start taking screenshots every 5 seconds remotely.
* **StopLiveCast** or **StopCast** executes the server action to stop taking screenshots every 5 seconds remotely.
When the server application takes a screenshot, the server application shows the screenshot and shares the screenshot with the client application, that also shows the server screenshot.The window title of the VCL client application shows also information about the received screenshot (size and date).


![DesktopCast.png](Readme%20Files/DesktopCast.png)


## How to Use the Sample 


1.  Navigate to the location given above and open **DesktopCast.groupproj**.
2.  Double click the server application entry, **VCLTetherDesktop**, in the **[Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window)** to select the server application.
3.  Select **Run > Run** to run the server application.
4.  Double click one of the client application entries, **FMXClientTetherDesktop** or **VCLTetherClient**, in the **Project Manager** to select a client application.
5.  Select **Run > Run** to run the selected client application.

## Files 

Each application in the project group contains a single source file that contains the class for the main form of the application.
## Classes 

Each application defines a single class that implements the main form of the application.
## Implementation 


### Server Application 


* [ActionManager1](http://docwiki.embarcadero.com/Libraries/en/Vcl.ActnMan.TActionManager) defines the following [actions](http://docwiki.embarcadero.com/Libraries/en/Vcl.ActnList.TAction) (associated with the application buttons):

* `actFullShot` executes `actFullShotExecute`, which updates the screenshot in `Image1` using `Shot` and saves the screenshot to the [value](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalResource.Value) of the shared [local resource](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalResource).
* `actStartCast` executes `actStartCastExecute`, which enables `tmCast`.
* `actStopCast` executes `actStopCastExecute`, which disables `tmCast`.

* [DesktopTetherManager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager).[Password](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.Password) is "Desktop".
* [TTetheringAppProfile1](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile):

* [Actions](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Actions) contains three [local actions](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalAction) that are associated with the actions in `ActionManager1` and are shared with remote profiles.
*  The [Group](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfile.Group) is "TetherDesktop".
*  The [Manager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfile.Manager) is `DesktopTetherManager`.
* [Resources](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Resources) contains a single [local resource](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalResource) which is shared with remote profiles. The Kind property is [TTetheringRemoteKind.Shared](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringRemoteKind).

*  There are two methods to take screenshots:

* `ScreenShot` takes a screenshot and saves it into the specified [TBitmap](http://docwiki.embarcadero.com/Libraries/en/Vcl.Graphics.TBitmap) using [BitBlt](http://msdn.microsoft.com/en-us/library/dd183370).
* `Shot` takes a screenshot using `ScreenShot` and shows the screenshot on [Image1](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TImage).

*  The class contains the following members for timing:

* [tmCast](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TTimer) is disabled by default. When enabled, this timer runs the `tmCastTimer` procedure each 5 seconds.
* [tmCastTimer](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TNotifyEvent) executes the `actFullShot` action.

### FireMonkey Client Application 


* `CheckRemoteProfiles` updates [Label1](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TLabel) with information about the connected remote profiles, if any.
* [CommandManager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager).[OnRequestManagerPassword](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.OnRequestManagerPassword) is handled by `CommandManagerRequestManagerPassword`, which provides the password of the remote server application: "Desktop".
* [CommandApp](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile):

* [Actions](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Actions) contains three [local actions](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalAction) with `Mirror` as [Kind](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TCustomLocalItem.Kind) and the same names as the actions shared by the server application. These actions are associated with the actions in `ActionList1`.
*  The [Group](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfile.Group) is "TetherDesktop".
*  The [Manager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfile.Manager) is `CommandManager`.
* [Resources](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Resources) contains a single resource with `Mirror` as [Kind](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TCustomLocalItem.Kind) and the same name as the resource shared by the server application.

* [ActionList1](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList) defines the same [actions](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction) as the server application, with the same name, but no implementation as the actions just trigger their remote twins. These actions are associated with their corresponding buttons.
* [tmCheckConnection](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) is disabled by default. When enabled, this timer runs the `CheckRemoteProfiles` procedure each 2 seconds.
* [Button2](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) (**Connect**) when [clicked](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick):

1.  Calls [CommandManager.AutoConnect](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.AutoConnect).
2.  Enables `tmCheckConnection`.

### VCL Client Application 


* `CheckRemoteProfiles` updates [Label1](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TLabel) with information about the connected remote profiles, if any.
* [DesktopTetherManager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager):

* [OnEndAutoConnect](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.OnEndAutoConnect) is handled by `DesktopTetherManagerEndAutoConnect`, which calls `CheckRemoteProfiles`.
* [OnRequestManagerPassword](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.OnRequestManagerPassword) is handled by `DesktopTetherManagerRequestManagerPassword`, which provides the password of the remote server application: "Desktop".

* [TTetheringAppProfile1](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile):

* [Actions](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Actions) contains three [local actions](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalAction) with `Mirror` as [Kind](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TCustomLocalItem.Kind) and the same names as the actions shared by the server application. These actions are associated with the actions in `ActionManager1`.
*  The [Group](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfile.Group) is "TetherDesktop".
*  The [Manager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfile.Manager) is `DesktopTetherManager`.
* [Resources](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Resources) contains a single resource with `Mirror` as [Kind](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TCustomLocalItem.Kind) and the same name as the resource shared by the server application.

* [ActionManager1](http://docwiki.embarcadero.com/Libraries/en/Vcl.ActnMan.TActionManager) defines the same [actions](http://docwiki.embarcadero.com/Libraries/en/Vcl.ActnList.TAction) as the server application, with the same name, but no implementation as the actions just trigger their remote twins. These actions are associates with their respective buttons.
* [tmCheckConnection](http://docwiki.embarcadero.com/Libraries/en/Vcl.ExtCtrls.TTimer) is disabled by default. When enabled, this timer runs the `CheckRemoteProfiles` procedure each 2 seconds.
* [Button4](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton) (**Connect**) when [clicked](http://docwiki.embarcadero.com/Libraries/en/Vcl.Controls.TControl.OnClick):

1.  Calls [DesktopTetherManager.AutoConnect](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.AutoConnect).
2.  Enables `tmCheckConnection`.

## Uses 


* [System.Tether.AppProfile.TTetheringAppProfile](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile)
* [System.Tether.AppProfile.TTetheringAppProfile.Actions](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Actions)
* [System.Tether.AppProfile.TTetheringAppProfile.Group](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfile.Group)
* [System.Tether.AppProfile.TTetheringAppProfile.Manager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfile.Manager)
* [System.Tether.AppProfile.TTetheringAppProfile.Resources](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Resources)

* [System.Tether.AppProfile.TLocalAction](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalAction)
* [System.Tether.AppProfile.TLocalAction.Kind](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TCustomLocalItem.Kind)

* [System.Tether.AppProfile.TLocalResource](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalResource)
* [System.Tether.AppProfile.TLocalResource.Kind](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TCustomLocalItem.Kind)
* [System.Tether.AppProfile.TLocalResource.Value](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalResource.Value)

* [System.Tether.Manager.TTetheringManager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager)
* [System.Tether.Manager.TTetheringManager.AutoConnect](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.AutoConnect)
* [System.Tether.Manager.TTetheringManager.OnRequestManagerPassword](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.OnRequestManagerPassword)
* [System.Tether.Manager.TTetheringManager.Password](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.Password)

## See Also 


* [Using App Tethering](http://docwiki.embarcadero.com/RADStudio/en/Using_App_Tethering)

* [System.Tether](http://docwiki.embarcadero.com/Libraries/en/System.Tether) unit

* [BDShoppingList](http://docwiki.embarcadero.com/CodeExamples/en/RTL.BDShoppingList_Sample) sample
* [MediaPlayer](http://docwiki.embarcadero.com/CodeExamples/en/RTL.MediaPlayer_Sample) sample
* [PhotoWall](http://docwiki.embarcadero.com/CodeExamples/en/RTL.PhotoWall_Sample) sample





