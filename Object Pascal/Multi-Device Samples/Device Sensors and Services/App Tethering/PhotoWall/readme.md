RTL.PhotoWall Sample[]()
# RTL.PhotoWall Sample 


**PhotoWall** is a sample application with a client-server architecture where a client application lets you take a picture and send that picture to a server application, which displays the picture.The client application is a [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey) application, and the server application is available both as a [VCL](http://docwiki.embarcadero.com/RADStudio/en/VCL_Overview) application and as a FireMonkey application.

## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)

* [6.1 FireMonkey Server Application](#FireMonkey_Server_Application)
* [6.2 VCL Server Application](#VCL_Server_Application)
* [6.3 FireMonkey Client Application](#FireMonkey_Client_Application)

* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **PhotoWall** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either of the following folders:

* `Object Pascal\RTL\Tethering\PhotoWall`
* `Object Pascal\Multi-Device Samples\Device Sensors and Services\App Tethering\PhotoWall`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/RTL/Tethering/PhotoWall](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/RTL/Tethering/PhotoWall)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/App%20Tethering/PhotoWall](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/App%20Tethering/PhotoWall)

## Description 

This sample applications folder provides two server projects (FireMonkey and VCL) and a client project. The projects are designed so that you can run any number of instances of each at the same time. Many client applications may connect to the same server application, and any client application may connect to multiple server applications, as long as they are reachable [using app tethering](http://docwiki.embarcadero.com/RADStudio/en/Using_App_Tethering).**Notes:**
*  The client application is intended for mobile platforms while the server application is only supported on desktop platforms.
*  The VCL server application is only available in `Object Pascal\RTL\Tethering\PhotoWall` folder.
In the server application (**DesktopWallApp** or **DesktopWallVCLApp**) you have an empty image area that you can fill remotely with a picture using a client application.

![PhotoWallDesktop.png](Readme%20Files/PhotoWallDesktop.png)

In the client application (**MainMobileApp**) you have the following controls:
*  An image area that shows the last picture taken and sent to a server application.
*  A list of connected server applications under **Select Photo Wall**, and a **Refresh** button to refresh the list.
*  A **Take Photo** button to take a picture to send to the server application selected from the list.


![PhotoWallMobile.png](Readme%20Files/PhotoWallMobile.png)


## How to Use the Sample 


1.  Navigate to the location given above and either one of the server applications in any of the locations given above:

* **DesktopWall\DesktopWallApp.dproj**
* **DesktopWall\DesktopWallApp.cbproj**
* **DesktopWallVCL\DesktopWallVCLApp.dproj**
* **DesktopWallVCL\DesktopWallVCLApp.cbproj**

2.  Select **Run > Run** to run the selected server application.
3.  On the **[Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window)**:

1.  Right-click the project group entry.
2.  Select **Add Existing Project**.
3.  Open either **Mobile\MobilePhotoApp.dproj** or **Mobile\MobilePhotoApp.cbproj** in any of the locations given above.

4.  Select **Run > Run** to run the client application.

## Files 

Each application in the project group contains a single source file that contains the class for the main form of the application.
## Classes 

Each application defines a single class that implements the main form of the application.
## Implementation 


### FireMonkey Server Application 


* `MediaReceiverManager.Password` is "1234".
* `MediaReceiverProfile`:

* `Manager` is `MediaReceiverManager`.
* `Text` is "MediaReceiverApp".
* `OnResourceReceived` is handled by `MediaReceiverProfileResourceReceived`, which loads the `Value` of the received [remote resource](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TRemoteResource) into the image area.

### VCL Server Application 


* `VCLMediaReceiver.Password` is "1234".
* `VCLMediaReceiverApp`:

* `Manager` is `VCLMediaReceiver`.
* `Text` is "VCLMediaReceiverApp".
* `OnResourceReceived` is handled by `VCLMediaReceiverAppResourceReceived`, which loads the `Value` of the received [remote resource](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TRemoteResource) into the image area.

### FireMonkey Client Application 


*  The application defines the following methods:

* `CheckPhotoWalls` returns `True` if there is an item [selected](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox.ItemIndex) in `lbWalls`. If there is no selected item, `CheckPhotoWalls` returns `False` and [shows a message](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.ShowMessage).
* `SendImage`[sends](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.SendStream) a previously-taken picture, or [shows a message](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.ShowMessage) asking you to take a picture first.
* `FindWalls`[clears](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TCustomListBox.Clear)`lbWalls` and calls `TakePhotoManager.DiscoverManagers`. `TakePhotoManager.DiscoverManagers` eventually triggers `TakePhotoManagerEndManagersDiscovery`.

*  The application defines the following event handlers:

*  If `CheckPhotoWalls` returns `True`, `lbWallsClick`[connects](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Connect) to the remote profile selected in `lbWalls` and calls `SendImage`.
* `BtRefreshClick` calls `FindWalls`.
* `TakePhotoManagerEndManagersDiscovery`[attempts to pair](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.PairManager) with any remote manager, and if successful triggers `TakePhotoManagerEndProfilesDiscovery`.
* `TakePhotoManagerEndProfilesDiscovery`:

1.  Clears `lbWalls`.
2.  If there is a discovered remote profile with "MediaReceiverApp" or "VCLMediaReceiverApp" as [description](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfileInfo.ProfileText), adds the profile to `lbWalls`.
3.  If `lbWalls` is not empty, selects the first remote profile in the the list and [connects](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Connect) to it.

* `TakePhotoManagerRequestManagerPassword` provides the password of the remote server application: "1234".
* `TakePhotoFromCameraAction1DidFinishTaking` loads the taken image into the image area and calls `SendImage` if `CheckPhotoWalls` returns `True`.

*  The application defines the following nonvisual components:

* `acActions` defines `TakePhotoFromCameraAction1`. The `OnDidFinishTaking` event of `TakePhotoFromCameraAction1` is handled by `TakePhotoFromCameraAction1DidFinishTaking`.
* `TakePhotoManager`:

* `OnEndManagersDiscovery` is handled by `TakePhotoManagerEndManagersDiscovery`.
* `OnEndProfilesDiscovery` is handled by `TakePhotoManagerEndProfilesDiscovery`.
* `OnRequestManagerPassword` is handled by `TakePhotoManagerRequestManagerPassword`.

* `TakePhotoAppProfile`:

* `Manager` is `TakePhotoManager`.

*  The application defines the following controls:

* `lbWalls` executes `lbWallsClick` when you [click](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TCustomListBox.OnItemClick) one of its items.
* `btRefresh` executes `BtRefreshClick` when [clicked](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton.OnClick).
* `ButtonTakePhotoFromCamera` executes the `TakePhotoFromCameraAction1` action.

## Uses 


* [System.Tether.AppProfile.TRemoteResource](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TRemoteResource)
* [System.Tether.AppProfile.TRemoteResource.Value](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TRemoteResource.Value)

* [System.Tether.AppProfile.TTetheringAppProfile](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile)
* [System.Tether.AppProfile.TTetheringAppProfile.Connect](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Connect)
* [System.Tether.AppProfile.TTetheringAppProfile.Manager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfile.Manager)
* [System.Tether.AppProfile.TTetheringAppProfile.OnResourceReceived](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.OnResourceReceived)
* [System.Tether.AppProfile.TTetheringAppProfile.SendStream](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.SendStream)
* [System.Tether.AppProfile.TTetheringAppProfile.Text](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfile.Text)

* [System.Tether.Manager.TTetheringProfileInfo.ProfileText](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfileInfo.ProfileText)

* [System.Tether.Manager.TTetheringManager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager)
* [System.Tether.Manager.TTetheringManager.DiscoverManagers](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.DiscoverManagers)
* [System.Tether.Manager.TTetheringManager.OnEndManagersDiscovery](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.OnEndManagersDiscovery)
* [System.Tether.Manager.TTetheringManager.OnEndProfilesDiscovery](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.OnEndProfilesDiscovery)
* [System.Tether.Manager.TTetheringManager.OnRequestManagerPassword](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.OnRequestManagerPassword)
* [System.Tether.Manager.TTetheringManager.PairManager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.PairManager)
* [System.Tether.Manager.TTetheringManager.Password](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.Password)

* [FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction)
* [FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction.OnDidFinishTaking](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction.OnDidFinishTaking)

## See Also 


* [Using App Tethering](http://docwiki.embarcadero.com/RADStudio/en/Using_App_Tethering)

* [System.Tether](http://docwiki.embarcadero.com/Libraries/en/System.Tether) unit

* [BDShoppingList](http://docwiki.embarcadero.com/CodeExamples/en/RTL.BDShoppingList_Sample) sample
* [DesktopCast](http://docwiki.embarcadero.com/CodeExamples/en/RTL.DesktopCast_Sample) sample
* [MediaPlayer](http://docwiki.embarcadero.com/CodeExamples/en/RTL.MediaPlayer_Sample) sample





