FMX.MusicPlayer Sample[]()
# FMX.MusicPlayer Sample 


This sample illustrates basic music player functionality in a **Multi-Device Application**.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)

* [8.1 Samples](#Samples)


## Location 

You can find the **MusicPlayer** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Media\MusicPlayer`
* `CPP\Multi-Device Samples\Media\MusicPlayer`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Media/MusicPlayer](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Media/MusicPlayer)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Media/MusicPlayer](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Media/MusicPlayer)

## Description 

The **MusicPlayer** application uses controls such as [TProgressBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar), and [TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar), and platform-specific technologies such as [MPMusicPlayerController](https://developer.apple.com/library/ios/#documentation/MediaPlayer/Reference/MPMusicPlayerController_ClassReference/Reference/Reference.html) for iOS, to show how to create a music player.Your device needs to have at least one song so that you can see the application functionality. The sample allows the audio files listing and standard media controls like play, pause, and volume.

> **Note:** The FireMonkey library contains a **[TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer)** component that you can use instead of writing your own media player. The [FMX.MediaPlayerHD Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.MediaPlayerHD_Sample) shows how to use **[TMediaPlayer](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TMediaPlayer)**.


## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **FMMusicPlayer.dproj**
*  C++: **FMMusicPlayer.cbproj**

2.  Press **F9** or choose **Run > Run**.
3.  Click an item from the [list](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox) on your mobile device.
4.  Click the **Play** button.


![IMG 0016.png](Readme%20Files/IMG%200016.png)


5.  Click the **Pause** button to pause the song, or the **Stop** button to stop playing the song.
6.  Click the **Previous** button, or the **Next** button to go through the [list items](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBoxItem).
7.  On the top [toolbar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar), click the **Settings**[SpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton).

*  Check an item from the **Repeat Modes**[list](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox): **All**, **One**, **None**, or **Default**.


![IMG 0017.png](Readme%20Files/IMG%200017.png)



*  Check the [TSwitch](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSwitch) control to enable **Shuffle Mode**.
*  Use the **VolumeTrackBar** to adjust the volume for the music player.

8.  Click the **Back**[SpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) to go back to the song [list](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox).

## Files 



| **File**         | **Contains**            |
| ---------------- | ----------------------- |
| **MediaPlayerU** | Contains the base form. |
| **MediaPlayer**  | The project itself.     |


## Classes 

**TFMXMusicPlayerFrm** is the form of the application. This class contains objects like: [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList), [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl), [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer), [TSpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton), or [TTrackBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TTrackBar).
## Implementation 


*  The **GetSongsFromLibrary** procedure is used to populate **PlayListBox** with the songs from the library device. It shows the title and the artist of each song.
*  The application components are placed on the **TabItem1** and **TabItem2** pages. You can change between the two pages by setting the **ActiveTab** property of the **TabControl1**. Each [TabItem](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabItem) of the application has an attached [action](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TChangeTabAction).
*  The **SongProgressBar**[value](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TProgressBar.Value) is calculated in the **OnTimer** event of [TTimer](http://docwiki.embarcadero.com/Libraries/en/FMX.Types.TTimer) based on the **MPMediaItemPropertyPlaybackDuration** and **currentPlaybackTime** methods results.

## Uses 


* [ActnList Unit](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList)
* [Layouts Unit](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout)
* [ListBox Unit](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [TabControl Unit](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl)

## See Also 


* [FireMonkey MobileApplication](http://docwiki.embarcadero.com/RADStudio/en/Multi-Device_Application)
* [Building a Basic Media Player](http://docwiki.embarcadero.com/RADStudio/en/Building_a_Basic_Media_Player)
* [Using Tab Components to Display Pages in an iOS Application](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_Tab_Components_to_Display_Pages_(iOS_and_Android))
* [Using ListBox Components to Display a Table View in an iOS Application](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_ListBox_Components_to_Display_a_Table_View_(iOS_and_Android))

### Samples 


* [FireMonkey Media Player HD](http://docwiki.embarcadero.com/CodeExamples/en/FMX.MediaPlayerHD_Sample) sample
* [FireMonkey Play Audio File](http://docwiki.embarcadero.com/CodeExamples/en/FMX.PlayAudioFile_Sample) sample
* [FireMonkey Audio Rec-Play](http://docwiki.embarcadero.com/CodeExamples/en/FMX.AudioRecPlay_Sample) sample





