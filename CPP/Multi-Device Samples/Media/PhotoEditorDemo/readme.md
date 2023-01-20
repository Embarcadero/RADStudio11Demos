FMX.PhotoEditorDemo Sample[]()
# FMX.PhotoEditorDemo Sample 


This sample illustrates how to apply effects to photos taken from the mobile device or from the built-in camera and how to save the customized photo to the library using **FireMonkey**.
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

You can find the **FireMonkeyMobile PhotoEditorDemo** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Media\PhotoEditorDemo`
* `CPP\Multi-Device Samples\Media\PhotoEditorDemo`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Media/PhotoEditorDemo](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Media/PhotoEditorDemo)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Media/PhotoEditorDemo](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Media/PhotoEditorDemo)

## Description 

The top [toolbar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) of the application has a set of [buttons](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) with different effects and a [button](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) to [take a photo from the local library](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromLibraryAction). The set of effects depends on the device on which the application runs. 
*  For iPhone, there are three effects available:

* [Blur](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TBlurEffect)
* [Pixelate](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TPixelateEffect)
* [Sharpen](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TSharpenEffect)

*  For iPad, there are eight effects available:

* [Blur](http://docwiki.embarcadero.com/Libraries/en/FMX.Effects.TBlurEffect)
* [Pixelate](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TPixelateEffect)
* [Swirl](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TSwirlEffect)
* [Wave](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TWaveEffect)
* [Emboss](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TEmbossEffect)
* [Contrast](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TContrastEffect)
* [Paper sketch](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TPaperSketchEffect)
* [Sharpen](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.Effects.TSharpenEffect)
The lower [toolbar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) contains three buttons: 
*  A button that opens the [share sheet](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TShowShareSheetAction) and offers the possibility to share or save the managed photo.
*  A button for [taking photos](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction).
*  A button that clears the image container.
This application demonstrates the use of media actions ([TShowShareSheetAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TShowShareSheetAction), [TTakePhotoFromCameraAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction) and [TTakePhotoFromLibraryAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromLibraryAction)), [TAction](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction) and [TFilterManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.TFilterManager).
## How to Use the Sample 


1.  Navigate to the one of the [locations](#Location) given above, and open:

*  Delphi: **PhotoEditorDemo.dproj**
*  C++: **PhotoEditorDemo.cbproj**

2.  Press **F9** or choose **Run > Run**.This is the application layout on an iPhone and an iPad:


![PhotoEditorDemoIPhone.png](Readme%20Files/PhotoEditorDemoIPhone.png)



![PhotoEditorDemoIPad.png](Readme%20Files/PhotoEditorDemoIPad.png)



*  Load or take a photo.
*  Edit the photo by applying an effect through the buttons on the top toolbar.
*  Save or share the edited image through the Share button on the lower toolbar.

## Files 



| **File**          | **Contains**                                                              |
| ----------------- | ------------------------------------------------------------------------- |
| **MainFrm**       | Contains the base form.                                                   |
| **MainFrm_Pad**   | Contains the form used when the application runs on an iPad.              |
| **MainFrm_Phone** | Contains the form used when the application runs on an iPhone.            |
| **Images**        | Contains the arrow images used as help when the application runs on iPad. |


## Classes 


1. **TBaseMainForm** is the base form of the application. This class contains the following:

*  Four [TButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TButton) objects for taking photos from camera, taking photos from local library, sharing the current used photo, and clearing the photo container.
*  Four [TSpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) objects to apply the image effects.
*  Two [TToolBar](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TToolBar) objects.
*  A [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) to display the used image.
*  An [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList) objects with:

*  Five [TAction](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction) objects, one for each button effect (_ActionBlurEffect_, _ActionPixelateEffect_, _ActionSharpenEffect_, _ActionResetEffect_) and one for the delete button (_ActionClearImage_).
*  A [TShowShareSheetAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TShowShareSheetAction).
*  A [TTakePhotoFromCameraAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction).
*  A [TTakePhotoFromLibraryAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromLibraryAction).

*  A [TLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TLayout).
*  A [TFloatAnimation](http://docwiki.embarcadero.com/Libraries/en/FMX.Ani.TFloatAnimation) used to animate the deletion process.

2.  The **TPadMainForm** class is derived from **TBaseMainForm**. It is the main form for the application when running on an iPad device. **TPadMainForm** extends the **TBaseMainForm** class with the following components:

*  Two [TImage](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TImage) objects to display the help arrows.
*  Two [TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText) objects to display the help text.
*  Five [TSpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) objects for four new effects.
*  Five [TAction](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction) objects, one for each new button effect (_ActionSwirlEffect_, _ActionWaveEffect_, _ActionEmbossEffect_, _ActionContrastEffect_, _ActionPaperSketchEffect_).

3.  The **TPhoneMainForm** class is derived from **TBaseMainForm**. It is the main form for the application when running on an iPhone device. **TPhoneMainForm** extends the **TBaseMainForm** class with the following component:

*  A [TText](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TText) to display the help text.

## Implementation 

This application uses [TAction](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction) and [TFilterManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.TFilterManager) to load and customize images. The **SetEffect** method of the **TBaseMainForm** class uses [TFilterManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.TFilterManager) to access FireMonkey image effects by name, through the [FilterByName](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.TFilterManager.FilterByName) method, and then sets the various effects attributes. Each action assigned to an effect button calls the **SetEffect** method. All the buttons on the application forms have attached actions.
The form to be open at run time is set in the **PhotoEditorDemo.dpr** file. To see the **PhotoEditorDemo.dpr**, right-click the project in the [Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window) and choose **View source**.

## Uses 


* [FMX.MediaLibrary.Actions.TShowShareSheetAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TShowShareSheetAction)
* [FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction)
* [FMX.MediaLibrary.Actions.TTakePhotoFromLibraryAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromLibraryAction)
* [FMX.ActnList.TAction](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TAction)
* [FMX.Filter.TFilterManager](http://docwiki.embarcadero.com/Libraries/en/FMX.Filter.TFilterManager)

## See Also 


* [FireMonkey Application Design](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey_Application_Design)
* [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey)
* [iOS Mobile Application Development](http://docwiki.embarcadero.com/RADStudio/en/iOS_Mobile_Application_Development)
* [Troubleshooting: Cannot Deploy to the iOS Simulator](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_iOS_App_to_iOS_Simulator)
* [Troubleshooting: Cannot Deploy to the iOS Device](http://docwiki.embarcadero.com/RADStudio/en/Troubleshooting:_Cannot_Deploy_to_the_iOS_Device)

### Samples 


* [FireMonkey Image Filters](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ImageFilters_Sample) sample





