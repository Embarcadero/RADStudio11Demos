RTL.MediaPlayer Sample[]()
# RTL.MediaPlayer Sample 


**MediaPlayer** is a sample application with a client-server architecture where:
*  A client application is a remote control that can find media players (server applications) reachable [using app tethering](http://docwiki.embarcadero.com/RADStudio/en/Using_App_Tethering) and control them (play/pause and volume control).
*  A server application is a media player that you can control from the application itself or remotely using a remote control (client application).
The server application is a [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey) application, and the client application is available both as a [VCL](http://docwiki.embarcadero.com/RADStudio/en/VCL_Overview) application and as a FireMonkey application.The server application is based on the [MediaPlayerHD](http://docwiki.embarcadero.com/CodeExamples/en/FMX.MediaPlayerHD_Sample) sample application.

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

You can find the **MediaPlayer** project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to either of the following folders:

* **CPP\RTL\Tethering\MediaPlayer**
* **Object Pascal\RTL\Tethering\MediaPlayer**

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/RTL/Tethering/MediaPlayer](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/RTL/Tethering/MediaPlayer)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/RTL/Tethering/MediaPlayer](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/RTL/Tethering/MediaPlayer)

## Description 

This sample applications folder provides two client projects (VCL and FireMonkey) and a server project. The projects are designed so that you can run any number of instances of each at the same time. Many remote controls (client applications) may connect to the same media player (server application), and any remote control may connect to multiple media players, as long as they are reachable [using app tethering](http://docwiki.embarcadero.com/RADStudio/en/Using_App_Tethering).In the server application (**MediaPlayerHD**) you have the following controls:

* **Load…** lets you load a file to play. See [Audio-Video in FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/Audio-Video_in_FireMonkey) for file support information.
* **Play** pauses the playback, **Pause** resumes the playback.
* **Clear** unloads the currently-loaded media file.
*  If **Visible** is checked, the applications shows the video area. If **Visible** is not checked, the video is not visible.
*  The volume bar lets you adjust the playback volume.
*  The top-right corner shows information about the dimensions (`n`x`n`px) and the duration (`n`s) of the loaded media file.


![MediaPlayer.png](Readme%20Files/MediaPlayer.png)

In the client application (**MediaPlayerCommand** or **MediaPlayerVCLCommand**) you have the following controls:
*  You can click **Find Players** to fill the list on top with reachable media players (server applications).
*  On the media player selected on the top list:

* **Play** pauses the playback, **Pause** resumes the playback.
*  The volume bar lets you adjust the playback volume.


![MediaPlayerRemoteControl.png](Readme%20Files/MediaPlayerRemoteControl.png)


## How to Use the Sample 


1.  Navigate to the location given above and open **MediaPlayerHD\MediaPlayerHD.dproj** or **MediaPlayerHD\MediaPlayerHD.cbproj**.
2.  On the **[Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window)**:

1.  Double click the server application entry **MediaPlayerHD**.
2.  Select **Run > Run** to run the server application.
3.  Double click one of the client application entries, **MediaPlayerCommand** or **MediaPlayerVCLCommand**.
4.  Select **Run > Run** to run the selected client application.
**Note**: You can run any number of instances of each project at the same time.
## Files 

Each application in the project group contains a single source file that contains the class for the main form of the application.
## Classes 

Each application defines a single class that implements the main form of the application.
## Implementation 


### Server Application 


*  The application defines the following event handlers:

* `OpenButtonClick`:

1.  Changes the value of `OpenDialog1.Filter` to the return value of `TMediaCodecManager.GetFilterString`.
2. [Displays](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TCommonDialog.Execute)`OpenDialog1`. If you select a file:

1. [Enables](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton.Enabled)`PauseButton` and `ClearButton`.
2.  Changes the value of `MediaPlayer1.FileName` to `OpenDialog1.FileName`.
3.  If `MediaPlayer1` successfully loads the selected media file into its `Media` property:

1.  Fills `Label1.Text` with "`X`x`Y`px `Z`s", where:

* `X` is the value of `MediaPlayer1.Media.VideoSize.Truncate.X`.
* `Y` is the value of `MediaPlayer1.Media.VideoSize.Truncate.Y`.
* `Z` is the value of `MediaPlayer1.Media.Duration` divided by `MediaTimeScale` to get the duration in seconds.

2.  Changes the value of `TrackBar1.Max` to `MediaPlayer1.Media.Duration`.
3.  Changes the value of `VolumeTrack.Value` to `MediaPlayer1.Media.Volume`.
4. [Starts playing](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Play) the specified media file.

* `acPlayPauseExecute`. If the [State](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.State) of `MediaPlayer1` is [Playing](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaState), `acPlayPauseExecute` changes the [Text](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton.Text) of the `PauseButton` to "Play" and [stops the playback](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Stop). If the media player is paused, `acPlayPauseExecute` changes the text of the `PauseButton` to "Pause" and [resumes the playback](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Play).
* `acClearExecute`[clears](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Clear) the media player and [disables](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton.Enabled)`PauseButton` and `ClearButton`.
* `CheckBox1Change` changes `MediaPlayerControl1`.[Visible](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl.Visible) to the value of `CheckBox1`.[IsChecked](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox.IsChecked).
* `FMXAppProfileResourceReceived` changes the value of `VolumeTrack.Value` to the [value](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TRemoteResource.Value) of the incoming [remote resource](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TRemoteResource).
* `Timer1Timer` changes the value of `TrackBar1.Value` to `MediaPlayer1.CurrentTime`.
* `TrackBar1Change` changes the value of `MediaPlayer1.CurrentTime` to `TrackBar1.Value`.
* `VolumeTrackChange` changes the value of `MediaPlayer1.Volume` based on the value of `VolumeTrack.Value`.

*  The application defines the following nonvisual components:

* `ActionList1` defines the following [actions](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction):

* `acPlayPause`, which [executes](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction.OnExecute)`acPlayPauseExecute`.
* `acClear`, which executes `acClearExecute`.

* `FMXManager.Password` is "1234".
* `FMXAppProfile`:

* `Actions` contains two [local actions](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalAction) that are associated with the actions in `ActionList1` and are shared with remote profiles.
* `Manager` is `FMXManager`.
* `Text` is "FMXMediaPlayer".

* `MediaPlayer1`.
* `MediaPlayerControl1`.
* `OpenDialog1`.
* `Timer1`[executes](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer.OnTimer)`Timer1Timer` each [100 ms](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer.Interval).

*  The application defines the following controls:

* `OpenButton` executes `OpenButtonClick` when [clicked](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.OnClick).
* `PauseButton` executes `acPlayPause` when clicked.
* `ClearButton` executes `acClear` when clicked.
* `CheckBox1` (**Visible**) executes `CheckBox1Change` when [toggled](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TCheckBox.OnChange).
* `VolumeTrack` executes `VolumeTrackChange` when the user [changes](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar.OnChange) its value.
* `Label1`.
* `TrackBar1` executes `TrackBar1Change` when the user changes its value.

### FireMonkey Client Application 


*  The application defines the following methods:

* `CheckMediaPlayers` returns `True` if there is an item [selected](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox.ItemIndex) in `lbPlayers`. If there is no selected item, `CheckMediaPlayers` returns `False` and [shows a message](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.ShowMessage).

*  The application defines the following event handlers:

*  If `CheckMediaPlayers` returns `True`, `Button1Click`[runs](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.RunRemoteAction) the `acPlayPause` action on the remote media player selected in `lbPlayers`.
* `Button2Click`[clears](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TCustomListBox.Clear)`lbPlayers` and calls `CommandManager.DiscoverManagers`. `CommandManager.DiscoverManagers` eventually triggers `CommandManagerEndManagersDiscovery`.
* `CommandManagerEndManagersDiscovery`[attempts to pair](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.PairManager) with any remote manager, and if successful triggers `CommandManagerEndProfilesDiscovery`.
* `CommandManagerEndProfilesDiscovery`:

1.  Clears `lbPlayers`.
2.  If there is a discovered remote profile with "FMXMediaPlayer" as [description](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfileInfo.ProfileText), adds the profile to `lbPlayers`.
3.  If `lbPlayers` is not empty, selects the first remote profile in the the list and [connects](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Connect) to it.

* `CommandManagerRequestManagerPassword` provides the password of the remote server application: "1234".
* `lbPlayersItemClick`[connects](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Connect) to the remote profile selected in `lbPlayers`.
* `VolumeTrackChange`[sends](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.SendString)`VolumeTrack.Value` to the remote profile selected in `lbPlayers`.

*  The application defines the following nonvisual components:

* `CommandManager`:

* `OnEndManagersDiscovery` is handled by `CommandManagerEndManagersDiscovery`.
* `OnEndProfilesDiscovery` is handled by `CommandManagerEndProfilesDiscovery`.
* `OnRequestManagerPassword` is handled by `CommandManagerRequestManagerPassword`.

* `CommandApp`:

* `Manager` is `CommandManager`.

*  The application defines the following controls:

* `lbPlayers` executes `lbPlayersItemClick` when you [click](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TCustomListBox.OnItemClick) one of its items.
* `Button2` (**Find Players**) executes `Button2Click` when [clicked](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton.OnClick).
* `Button1` (**Play/Pause**) executes `Button1Click` when clicked.
* `VolumeTrack` executes `VolumeTrackChange` when the user changes its value.

### VCL Client Application 


*  The application defines the following methods:

* `CheckMediaPlayers` returns `True` if there is an item [selected](http://docwiki.embarcadero.com/Libraries/en/Vcl.Controls.TCustomListControl.ItemIndex) in `lbPlayers`. If there is no selected item, `CheckMediaPlayers` returns `False` and [shows a message](http://docwiki.embarcadero.com/Libraries/en/Vcl.Dialogs.ShowMessage).

*  The application defines the following event handlers:

*  If `CheckMediaPlayers` returns `True`, `Button1Click`[runs](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.RunRemoteAction) the `acPlayPause` action on the remote media player selected in `lbPlayers`.
* `Button2Click`[clears](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TCustomListBox.Clear)`lbPlayers` and calls `CommandManager.DiscoverManagers`. `CommandManager.DiscoverManagers` eventually triggers `CommandManagerEndManagersDiscovery`.
* `CommandManagerEndManagersDiscovery`[attempts to pair](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.PairManager) with any remote manager, and if successful triggers `CommandManagerEndProfilesDiscovery`.
* `CommandManagerEndProfilesDiscovery`:

1.  Clears `lbPlayers`.
2.  If there is a discovered remote profile with "FMXMediaPlayer" as [description](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfileInfo.ProfileText), adds the profile to `lbPlayers`.
3.  If `lbPlayers` is not empty, selects the first remote profile in the the list and [connects](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Connect) to it.

* `CommandManagerRequestManagerPassword` provides the password of the remote server application: "1234".
* `VolumeTrackChange`[sends](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.SendString)`VolumeTrack.Value` to the remote profile selected in `lbPlayers`.

*  The application defines the following nonvisual components:

* `CommandManager`:

* `OnEndManagersDiscovery` is handled by `CommandManagerEndManagersDiscovery`.
* `OnEndProfilesDiscovery` is handled by `CommandManagerEndProfilesDiscovery`.
* `OnRequestManagerPassword` is handled by `CommandManagerRequestManagerPassword`.

* `VCLCommandApp`:

* `Manager` is `CommandManager`.

*  The application defines the following controls:

* `lbPlayers`.
* `Button2` (**Find Players**) executes `Button2Click` when [clicked](http://docwiki.embarcadero.com/Libraries/en/Vcl.StdCtrls.TButton.OnClick).
* `Button1` (**Play/Pause**) executes `Button1Click` when clicked.
* `VolumeTrack` executes `VolumeTrackChange` when the user changes its value.

## Uses 


* [System.Tether.AppProfile.TLocalAction](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TLocalAction)

* [System.Tether.AppProfile.TRemoteResource](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TRemoteResource)
* [System.Tether.AppProfile.TRemoteResource.Value](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TRemoteResource.Value)

* [System.Tether.AppProfile.TTetheringAppProfile](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile)
* [System.Tether.AppProfile.TTetheringAppProfile.Actions](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Actions)
* [System.Tether.AppProfile.TTetheringAppProfile.Connect](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.Connect)
* [System.Tether.AppProfile.TTetheringAppProfile.Manager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfile.Manager)
* [System.Tether.AppProfile.TTetheringAppProfile.RunRemoteAction](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.RunRemoteAction)
* [System.Tether.AppProfile.TTetheringAppProfile.SendString](http://docwiki.embarcadero.com/Libraries/en/System.Tether.AppProfile.TTetheringAppProfile.SendString)
* [System.Tether.AppProfile.TTetheringAppProfile.Text](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfile.Text)

* [System.Tether.Manager.TTetheringProfileInfo.ProfileText](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringProfileInfo.ProfileText)

* [System.Tether.Manager.TTetheringManager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager)
* [System.Tether.Manager.TTetheringManager.DiscoverManagers](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.DiscoverManagers)
* [System.Tether.Manager.TTetheringManager.OnEndManagersDiscovery](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.OnEndManagersDiscovery)
* [System.Tether.Manager.TTetheringManager.OnEndProfilesDiscovery](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.OnEndProfilesDiscovery)
* [System.Tether.Manager.TTetheringManager.OnRequestManagerPassword](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.OnRequestManagerPassword)
* [System.Tether.Manager.TTetheringManager.PairManager](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.PairManager)
* [System.Tether.Manager.TTetheringManager.Password](http://docwiki.embarcadero.com/Libraries/en/System.Tether.Manager.TTetheringManager.Password)

* [FMX.Media.TMedia.Duration](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMedia.Duration)
* [FMX.Media.TMedia.VideoSize](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMedia.VideoSize)
* [FMX.Media.TMedia.Volume](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMedia.Volume)

* [FMX.Media.TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer)
* [FMX.Media.TMediaPlayer.Clear](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Clear)
* [FMX.Media.TMediaPlayer.CurrentTime](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.CurrentTime)
* [FMX.Media.TMediaPlayer.Media](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Media)
* [FMX.Media.TMediaPlayer.Play](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Play)
* [FMX.Media.TMediaPlayer.State](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.State)
* [FMX.Media.TMediaPlayer.Stop](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer.Stop)

* [FMX.Media.TMediaPlayerControl](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl)
* [FMX.Media.TMediaPlayerControl.Visible](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayerControl.Visible)

* [FMX.Media.TMediaState](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaState)

## See Also 


* [Using App Tethering](http://docwiki.embarcadero.com/RADStudio/en/Using_App_Tethering)
* [Audio-Video in FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/Audio-Video_in_FireMonkey)

* [System.Tether](http://docwiki.embarcadero.com/Libraries/en/System.Tether) unit

* [MediaPlayerHD](http://docwiki.embarcadero.com/CodeExamples/en/FMX.MediaPlayerHD_Sample) sample
* [VideoPlayback](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Mobile.VideoPlayback_Sample) sample

* [BDShoppingList](http://docwiki.embarcadero.com/CodeExamples/en/RTL.BDShoppingList_Sample) sample
* [DesktopCast](http://docwiki.embarcadero.com/CodeExamples/en/RTL.DesktopCast_Sample) sample
* [PhotoWall](http://docwiki.embarcadero.com/CodeExamples/en/RTL.PhotoWall_Sample) sample





