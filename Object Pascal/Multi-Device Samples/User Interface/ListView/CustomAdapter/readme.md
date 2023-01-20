FMX.ListViewCustomAdapter[]()
# FMX.ListViewCustomAdapter 


This sample illustrates how to create a custom [list view adapter](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Adapters.Base.TAbstractListViewAdapter).
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Run the Sample](#How_to_Run_the_Sample)
* [4 How It Works](#How_It_Works)
* [5 See Also](#See_Also)


## Location 

You can find the **CustomAdapter** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\User Interface\ListView\CustomAdapter`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ListView/CustomAdapter](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/User%20Interface/ListView/CustomAdapter)

## Description 

The **CustomAdapter** sample shows how to create a custom [list view adapter](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Adapters.Base.TAbstractListViewAdapter). This specific implementation of a custom adapter obtains image files from a remote server.
## How to Run the Sample 


1.  Run the server:

1. [Install Python 2](https://www.python.org/downloads/) to run the server script.
2.  On the project folder, open `server.py` using a text editor, and update the values of the `HOST` and `PORT` variables.**Notes:**

*  The default values should let you test this sample application on your development PC.
*  To run this sample application on a mobile device, you must update `HOST` so that it contains the IP address where your mobile devices can reach your development PC.
*  If the default post is busy in your development PC, you must change the value of `PORT`.

3.  Run `server.py`.

2.  Run the sample application:

1.  Open the sample application project file.
2.  Open the main form of the sample application in the [Code Editor](http://docwiki.embarcadero.com/RADStudio/en/Code_Editor) and update the value of the `Host` constant, so that the host and port match those that you configured on the server script.
3.  Run the sample application.

## How It Works 

After you start this sample application, it displays the following form:![ListViewCustomAdapterFirstExecution.png](Readme%20Files/ListViewCustomAdapterFirstExecution.png)
Click the **Load Pictured** button to load 30 list view items from the custom list view adapter.

## See Also 


* [FMX.ListView.TListView.Adapter](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TAdapterListView.Adapter)
* [FMX.ListView.Adapters.Base.TAbstractListViewAdapter](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Adapters.Base.TAbstractListViewAdapter)
* [FMX.ListView.Types.IListViewAdapter](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Types.IListViewAdapter)
* [FMX.ListView.Types.IListViewTextProvider](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Types.IListViewTextProvider)
* [FMX.ListView.Types.IListViewTextButtonProvider](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.Types.IListViewTextButtonProvider)





