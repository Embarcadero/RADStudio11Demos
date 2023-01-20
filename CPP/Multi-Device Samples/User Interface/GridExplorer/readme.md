FMX.GridExplorer Sample[]()
# FMX.GridExplorer Sample 


This sample demonstrates how to build a simple file browser using the [TGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGrid) and [TTreeView](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeView) components of [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Files](#Files)
* [5 Classes](#Classes)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **GridExplorer** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `CPP\Multi-Device Samples\User Interface\GridExplorer`

* **GitHub Repository:**

* **C++:**[https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/GridExplorer](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/User%20Interface/GridExplorer)

## Description 

The **GridExplorer** sample demonstrates how to build a simple file browser using [FireMonkey](http://docwiki.embarcadero.com/RADStudio/en/FireMonkey).The top bar of the sample application allows you to select a folder. You can either write a path manually and press Enter, or use the ellipsis button to select a folder from a file browser dialog box.
When you open a folder:

*  The left-hand sidebar shows a tree view with the folder that you opened. You can use the tree view to recursively navigate its subfolders.
*  The main view is a grid that shows information about the files in the selected folder (file name, size, and so on).
When you click a folder in the tree view, the grid shows the files of the clicked folder.

![GridExplorer.png](Readme%20Files/GridExplorer.png)


## How to Use the Sample 


1.  Navigate to the location given above and open `GridExplorer.cbproj`.
2.  Select a target platform in the **[Projects Window](http://docwiki.embarcadero.com/RADStudio/en/Projects_Window)**.
3.  Press `F9` or choose **Run > Run**.

## Files 



| File                                     | Contains            |
| ---------------------------------------- | ------------------- |
| `GridExplorer.cbproj``GridExplorer.cpp`  | The project itself. |
| `MainForm.h``MainForm.cpp``MainForm.fmx` | The main form.      |


## Classes 

`TFrmMain` is the main form that represents the main window of the sample. It contains the following components:
*  A [TScaledLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TScaledLayout) object that contains:

*  A [TRectangle](http://docwiki.embarcadero.com/Libraries/en/FMX.Objects.TRectangle) object, which contains a [TEdit](http://docwiki.embarcadero.com/Libraries/en/FMX.Edit.TEdit) control, which contains a [TSpeedButton](http://docwiki.embarcadero.com/Libraries/en/FMX.StdCtrls.TSpeedButton) control.
*  A [TTreeView](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeView) control.
*  A [TGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGrid) control.

*  A [TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog) dialog.

## Implementation 

The **GridExplorer** sample application uses:
* [TScaledLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TScaledLayout) for the layout of the main form.
*  A [TOpenDialog](http://docwiki.embarcadero.com/Libraries/en/FMX.Dialogs.TOpenDialog) dialog to let users select a folder path.
*  A [TTreeView](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeView) control to show a folder hierarchy.
*  A [TGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGrid) control to show data about the files within a folder.
* [TDirectory](http://docwiki.embarcadero.com/Libraries/en/System.IOUtils.TDirectory) to navigate the file system.

## Uses 


* [TScaledLayout](http://docwiki.embarcadero.com/Libraries/en/FMX.Layouts.TScaledLayout)
* [TTreeView](http://docwiki.embarcadero.com/Libraries/en/FMX.TreeView.TTreeView)
* [TGrid](http://docwiki.embarcadero.com/Libraries/en/FMX.Grid.TGrid)
* [TDirectory](http://docwiki.embarcadero.com/Libraries/en/System.IOUtils.TDirectory)

## See Also 


* [Controls](http://docwiki.embarcadero.com/CodeExamples/en/FMX.ControlsDemo_Sample) sample application
* [TGrid](http://docwiki.embarcadero.com/CodeExamples/en/TGrid_%28Delphi%29) code example





