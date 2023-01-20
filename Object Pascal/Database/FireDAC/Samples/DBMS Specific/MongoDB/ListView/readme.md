FireDAC.MongoDB.ListView Sample[]()
# FireDAC.MongoDB.ListView Sample 


This sample shows how to work with a sample MongoDB dataset in a Delphi application.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 Preliminary Steps](#Preliminary_Steps)
* [4 How to Use the Sample](#How_to_Use_the_Sample)
* [5 Files](#Files)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **ListView** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Database\FireDAC\Samples\DBMS Specific\MongoDB\ListView`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/MongoDB/ListView](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/MongoDB/ListView)

## Description 

This sample application illustrates how to connect to a MongoDB server, select specific documents from a sample collection "restaurants" using a select query, parse the selected document elements (JSON items), and then display the results using the [TListView](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls.TListView) component. Using this sample application, you can:

*  Create a select query to retrieve specific documents from the sample MongoDB collection "restaurants" using the [TMongoCollection.Find](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDBWrapper.TMongoCollection.Find) method.
*  Parse elements of the selected documents in one of the following ways:

*  using the [TJSONIterator.Find](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONIterator.Find) method.
*  using the [TJSONIterator.Next](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONIterator.Next), [TJSONIterator.Recurse](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONIterator.Recurse), and [TJSONIterator.Return](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONIterator.Return) methods.
*  using the [TJSONIterator.Iterate](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONIterator.Iterate) method.

*  Display the retrieved data using the [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) component.

## Preliminary Steps 

Before using this sample project, review the following checklist:
*  A MongoDB server is running and accessible from your host.

> **Note**: If the MongoDB server is not running on the machine where you want to run this sample application, or requires non-default connection parameters, such as a port other than 27017, configure the [FDConnection1](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) component accordingly. For details, see [Connect to MongoDB Database](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_MongoDB_Database_(FireDAC)).


*  The "restaurants" collection of the "test" database is provisioned with test data. To provision this collection, run the **MongoDB Restaurants Demo**, and click the **Load Data** button:


![MongoDB Restaurants Demo.png](Readme%20Files/MongoDB%20Restaurants%20Demo.png)


> You can find the **MongoDB Restaurants Demo** sample project at:
> 
> * **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:
> 
> * `Object Pascal\Database\FireDAC\Samples\DBMS Specific\MongoDB\Restaurants`
> * `CPP\Database\FireDAC\Samples\DBMS Specific\MongoDB\Restaurants`
> 
> * **GitHub Repository:**
> 
> * [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/MongoDB/Restaurants](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/MongoDB/Restaurants)
> * [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Database/FireDAC/Samples/DBMS%20Specific/MongoDB/Restaurants](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Database/FireDAC/Samples/DBMS%20Specific/MongoDB/Restaurants)


## How to Use the Sample 

**To run this project and select required data records**
1.  Navigate to one of the locations given in the [Location](#Location) section above and open:

*  Delphi: `Mongo_DataSet.dproj` project file.

2.  Press F9 or choose **Run > Run**.
3.  To display the elements of the selected documents, click one of the following buttons:

* **Read using Find**: selects all Italian restaurants from Manhattan, and then finds the required elements in a document using the [TJSONIterator.Find](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONIterator.Find) method.
* **Read using Next/Recurse/Return**: selects all Italian restaurants from Manhattan, and then iterates through the document elements using the [TJSONIterator.Next](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONIterator.Next)/[Recurse](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONIterator.Recurse)/[Return](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONIterator.Return) methods. This allows the application to analyze each element (a JSON item) and find the required items in the elements tree.
* **Read using Iterate**: selects all restaurants from Brooklyn, and then iterates through the document elements using the [TJSONIterator.Iterate](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONIterator.Iterate) method. For each element, the [TJSONIterator.Iterate](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONIterator.Iterate) method calls [a callback function](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONIterator.TIterateFunc).
![MongoDB ListView.png](Readme%20Files/MongoDB%20ListView.png)
## Files 



| **File in Delphi**       | **File in C++** | **Contains**                                    |
| ------------------------ | --------------- | ----------------------------------------------- |
| **Mongo_ListView.dproj** | --              | The project itself.                             |
| **fMain.fmx**            | --              | The main form where the components are located. |
| **fMain.pas**            | --              | Implementation of the sample.                   |


## Implementation 


*  The project uses a [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) component to establish a connection to a sample database.
*  To select specific documents from a sample database, the project uses the [TMongoCollection.Find](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDBWrapper.TMongoCollection.Find) method.
*  To parse elements of the selected documents, the project uses various methods of [TJSONIterator](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONIterator).
*  A [TListView](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls.TListView) component displays the retrieved and parsed data.

## Uses 


* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [TMongoCollection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDBWrapper.TMongoCollection)
* [TListView](http://docwiki.embarcadero.com/Libraries/en/Vcl.ComCtrls.TListView)
* [TJSONIterator](http://docwiki.embarcadero.com/Libraries/en/System.JSON.Builders.TJSONIterator)

## See Also 


* [Connect to MongoDB Database](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_MongoDB_Database_(FireDAC))
* [Configuring Drivers](http://docwiki.embarcadero.com/RADStudio/en/Configuring_Drivers_(FireDAC))
* [TMongoDocument](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDBWrapper.TMongoDocument)
* [MongoDB Manual](http://docs.mongodb.org/)





