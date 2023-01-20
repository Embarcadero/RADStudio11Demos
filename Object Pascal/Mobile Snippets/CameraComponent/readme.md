FMX.CameraComponent Sample[]()
# FMX.CameraComponent Sample 


This sample project shows how to use and manipulate the camera of a device. The sample demonstrates the use of the [TCameraComponent](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Implementation](#Implementation)

* [5.1 Viewing the Camera Captured Data](#Viewing_the_Camera_Captured_Data)
* [5.2 Ensuring the Camera is Released When Required](#Ensuring_the_Camera_is_Released_When_Required)
* [5.3 Changing the Camera Type](#Changing_the_Camera_Type)
* [5.4 Setting the Quality of the Captured Video Data](#Setting_the_Quality_of_the_Captured_Video_Data)

* [5.4.1 Preset Camera Quality](#Preset_Camera_Quality)
* [5.4.2 Custom Camera Quality](#Custom_Camera_Quality)

* [5.5 Using the Torch](#Using_the_Torch)

* [6 Uses](#Uses)
* [7 See Also](#See_Also)


## Location 

You can find the **CameraComponent** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* **CPP\Mobile Snippets\CameraComponent\**
* **Object Pascal\Mobile Snippets\CameraComponent\**

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Mobile%20Snippets/CameraComponent](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Mobile%20Snippets/CameraComponent)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Mobile%20Snippets/CameraComponent](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Mobile%20Snippets/CameraComponent)

## Description 

This sample demonstrates the use of the [TCameraComponent](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent), which is the nonvisual component for a camera device.The sample project shows how to manipulate the camera of a device, and how to set preset and custom quality capture settings for your camera. With this sample you can:

*  Turn on and off the camera of your device.
*  Select either the front facing camera or the back facing camera.
*  Set different resolution configurations for your camera.
*  Select whether to turn the flash on, off, or leave it in automatic mode.

## How to Use the Sample 


1.  Navigate to one of the [locations given above](#Location) and open:

*  Delphi: **CameraComponent.dproj**
*  C++: **CameraComponent.cbproj**

2.  In the [Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window), select the [target platform](http://docwiki.embarcadero.com/RADStudio/en/Target_Platforms_Overview).**Note:** The device where you run the application must have a camera.
3.  Press F9 or choose **Run > Run**.
4.  The available **Camera Resolutions** are automatically filled in the **cbResolutions** combo box.
5.  To interact with the sample:

*  Use the **Start Camera** and **Stop Camera** buttons to enable and disable the camera component.
*  Use the **Front** and **Back** buttons of the **Camera Type** section to change between the front and back camera of your device.
*  Change the **Camera Resolutions** by:


*  Using the **Low**, **Medium**, **High**, or **Photo** preset resolutions.
*  Selecting a resolution from the **cbResolutions** combo box to get a custom resolution based on the available ones. Use the **cbPriority** combo box to set how the resolutions must be arranged, either prioritizing the resolution or the frame rate.


*  Use the **On**, **Off**, and **Auto** buttons available in the **Camera Torch Type** section to manage the camera torch.


![CameraComponent 1.png](Readme%20Files/CameraComponent%201.png)



![CameraComponent 2.png](Readme%20Files/CameraComponent%202.png)

## Files 



| **File in Delphi**        | **File in C++**            | **Contains**                                                                   |
| ------------------------- | -------------------------- | ------------------------------------------------------------------------------ |
| **CameraComponent.dproj** | **CameraComponent.cbproj** | The project itself.                                                            |
| **uMain.fmx**             | **uMain.fmx**              | The main form where the components are located.                                |
| **uMain.pas**             | **uMain.h**, **uMain.cpp** | Delphi source file, C++ header file, and C++ implementation file respectively. |
| **Information.txt**       | **Information.txt**        | Basic information about this sample.                                           |


## Implementation 

The [Active](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.Active) property is used to turn on and off the camera.The [TVideoCaptureSetting](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TVideoCaptureSetting) record is used to store a single camera frame rate with its corresponding resolution.

### Viewing the Camera Captured Data 

The [SampleBufferToBitmap](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.SampleBufferToBitmap) method is used to display the captured data on a [bitmap](http://docwiki.embarcadero.com/Libraries/en/FMX.Graphics.TBitmap).The event handler written for the [OnSampleBufferReady](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.OnSampleBufferReady) event, [synchronizes](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TThread.Synchronize) the [CurrentThread](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TThread.CurrentThread), that represents the main thread, with the method to [capture and display the data](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.SampleBufferToBitmap). [Synchronize](http://docwiki.embarcadero.com/Libraries/en/System.Classes.TThread.Synchronize) is used to execute the [SampleBufferToBitmap](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.SampleBufferToBitmap) method within the main thread.

### Ensuring the Camera is Released When Required 

When the [form is created](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm.OnCreate), the sample checks whether the [IFMXApplicationEventService](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXApplicationEventService)[platform service is supported](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.TPlatformServices.SupportsPlatformService), this service will allow you to enable or disable the camera when the application goes to background.[TApplicationEvent](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.TApplicationEvent) is used to check the different application events to ensure the camera is released when the app goes away in the following cases: `WillBecomeInactive`, `EnteredBackground`, and `WillTerminate`.
**Warning:** It is important that the camera is released as required; otherwise the camera will remain engaged by the app (even after going to background), and other apps will not have access to use the camera.
### Changing the Camera Type 

The [Kind](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.Kind) property is used to select the front camera or the back camera of the device: `TCameraKind.FrontCamera` and `TCameraKind.BackCamera`.Since the front and back camera of a device tend to have different resolutions; when the camera changes, the [available resolutions](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.AvailableCaptureSettings) are updated.

### Setting the Quality of the Captured Video Data 

The [Quality](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.Quality) property is used to set the quality of the video capture. It is possible to set preset or custom camera quality:
#### Preset Camera Quality 

The `Quality` property is set to one of the following [TVideoCaptureQuality](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TVideoCaptureQuality) values: `LowQuality`, `MediumQuality`, `HighQuality`, and `PhotoQuality`, that represent the available preset camera quality values.
#### Custom Camera Quality 

To set a custom camera quality, the sample sets the `Quality` property to `CaptureSettings`. Then, the [AvailableCaptureSettings](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.AvailableCaptureSettings) property is used to capture the settings available in the selected camera. These settings are then displayed in the **cbResolutions**[TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) so the user can select the wanted custom camera quality. When [combo box changes](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox.OnChange) the [CaptureSetting](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.CaptureSetting) property is used to set the selected custom camera settings.To gather the [AvailableCaptureSettings](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.AvailableCaptureSettings), the sample determines the priority criterion to sort the results using the [CaptureSettingPriority](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.CaptureSettingPriority) property. The two possible [capture settings priorities](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TVideoCaptureSettingPriority) are `Resolution` and `FrameRate`.

### Using the Torch 

The [TorchMode](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.TorchMode) property is used to set the torch to one of the [possible torch modes](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TTorchMode): `ModeOff`, `ModeOn`, and `ModeAuto`.
## Uses 


* [FMX.Media.TCameraComponent](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent)
* [FMX.Media.TCameraComponent.Active](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.Active)
* [FMX.Media.TCameraComponent.Kind](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.Kind)
* [FMX.Media.TCameraComponent.TorchMode](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.TorchMode)
* [FMX.Media.TCameraComponent.Quality](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.Quality)
* [FMX.Media.TCameraComponent.AvailableCaptureSettings](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.AvailableCaptureSettings)
* [FMX.Media.TCameraComponent.CaptureSettingPriority](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.CaptureSettingPriority)
* [FMX.Media.TCameraComponent.CaptureSetting](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.CaptureSetting)
* [FMX.Media.TCameraComponent.OnSampleBufferReady](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.OnSampleBufferReady)
* [FMX.Media.TCameraComponent.SampleBufferToBitmap](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraComponent.SampleBufferToBitmap)

* [FMX.Media.TVideoCaptureSettingPriority](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TVideoCaptureSettingPriority)
* [FMX.Media.TVideoCaptureQuality](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TVideoCaptureQuality)
* [FMX.Media.TVideoCaptureSetting](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TVideoCaptureSetting)

* [FMX.Media.TCameraKind](http://docwiki.embarcadero.com/Libraries/en/FMX.Media.TCameraKind)
* [FMX.Controls.TControl.Repaint](http://docwiki.embarcadero.com/Libraries/en/FMX.Controls.TControl.Repaint)
* [FMX.Platform.IFMXApplicationEventService](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.IFMXApplicationEventService)
* [FMX.Platform.TPlatformServices.SupportsPlatformService](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.TPlatformServices.SupportsPlatformService)
* [FMX.Platform.TApplicationEvent](http://docwiki.embarcadero.com/Libraries/en/FMX.Platform.TApplicationEvent)

## See Also 


* [FMX.FlashLight Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.FlashLight_Sample)

* [Taking Pictures Using FireMonkey Interfaces](http://docwiki.embarcadero.com/RADStudio/en/Taking_Pictures_Using_FireMonkey_Interfaces)
* [Taking and Sharing Pictures and Text Using Action Lists](http://docwiki.embarcadero.com/RADStudio/en/Taking_and_Sharing_Pictures_and_Text_Using_Action_Lists)
* [Mobile Tutorial: Taking and Sharing a Picture, and Sharing Text (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Taking_and_Sharing_a_Picture,_and_Sharing_Text_(iOS_and_Android))





