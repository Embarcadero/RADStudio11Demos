FMX.FireDAC.MongoDB.DataSet Sample[]()
# FMX.FireDAC.MongoDB.DataSet Sample 


This sample shows how to work with a sample MongoDB dataset in Delphi and C++Builder applications.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 Preliminary Steps](#Preliminary_Steps)
* [4 How to Use the Sample](#How_to_Use_the_Sample)

* [4.1 Search Query Examples](#Search_Query_Examples)

* [5 Files](#Files)
* [6 Implementation](#Implementation)
* [7 Uses](#Uses)
* [8 See Also](#See_Also)


## Location 

You can find the **DataSet** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Database\FireDAC\Samples\DBMS Specific\MongoDB\DataSet`
* `CPP\Database\FireDAC\Samples\DBMS Specific\MongoDB\DataSet`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/MongoDB/DataSet](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/MongoDB/DataSet)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP//Database/FireDAC/Samples/DBMS%20Specific/MongoDB/DataSet](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP//Database/FireDAC/Samples/DBMS%20Specific/MongoDB/DataSet)

## Description 

This sample application illustrates how to connect to a MongoDB server and select specific data from a sample collection "restaurants" using a select query. The select query helps you retrieve only the data that you want. Using this sample application, you can:

*  Create a simple select query to retrieve the specific data records from the sample MongoDB collection "restaurants".
*  Browse the retrieved data and optionally make changes to the retrieved data records.

## Preliminary Steps 

Before using the **DataSet** sample project, review the following checklist:
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
1.  Navigate to one of the locations given above and open:

*  Delphi: `Mongo_DataSet.dproj` project file.
*  C++Builder: `Mongo_DataSet.cbproj` project file.

2.  Press F9 or choose **Run > Run**.
3.  In the **JSON Query** text box, specify a search query, and then click **Fetch Restaurants** to select specific data from the "restaurants" collection.

### Search Query Examples 

The search query is a MongoDB JSON query. For detailed information on the search query syntax, see [MongoDB Manual](https://docs.mongodb.org/manual/reference/method/db.collection.find/).To clarify, consider the following examples:

*  A simple query that is a comma-separated list of the field-value pairs inside curly braces (it corresponds to an SQL query: `field1=value1 AND field2=value2 AND ...`. For example, to retrieve only restaurants with the Italian cuisine, which are located in Brooklyn, create the following select query: `{"cuisine": "Italian", "borough": "Brooklyn"}`
![MongoDB DataSet Demo.png](Readme%20Files/MongoDB%20DataSet%20Demo.png)
*  The following query retrieves the restaurants with either Italian or Chines cuisine, which are situated in the 8 Avenue street (Brooklyn): `{"cuisine":  {$in: ["Chinese", "Italian"]}, "borough": "Brooklyn", "address.street": "8 Avenue"} `
![MongoDB DataSet Demo 2.png](Readme%20Files/MongoDB%20DataSet%20Demo%202.png)**To make changes to the "restaurants" collection**

1.  Using the previous procedure, select the required data entries.
2.  In the restaurants list, make appropriate changes, and then click **Save Restaurants** to save these changes.

## Files 



| **File in Delphi**      | **File in C++**          | **Contains**                                    |
| ----------------------- | ------------------------ | ----------------------------------------------- |
| **Mongo_DataSet.dproj** | **Mongo_DataSet.cbproj** | The project itself.                             |
| **fMain.fmx**           | **fMain.fmx**            | The main form where the components are located. |
| **fMain.pas**           | **fmain.cpp**            | Implementation of the sample.                   |


## Implementation 


*  The project uses a [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) component to establish a connection with a sample database.
*  To select the data records from the database, the project uses a [TFDMongoQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDBDataSet.TFDMongoQuery), a [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource), and a [TFDPhysMongoDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDB.TFDPhysMongoDriverLink).
*  A [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) displays the retrieved data.
*  The [FDMongoQuery1.CachedUpdates](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.DataSet.TFDDataSet.CachedUpdates) property is set to `True` to enable the dataset to log changes to the data without immediately applying them to the database. The application applies changes from the change log to the database after you click the **Save Restaurants** button.
*  The created JSON query is assigned to [FDMongoQuery1.QMatch](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDBDataSet.TFDMongoQuery.QMatch).
*  The "Coords" and "Grades" grid datasources are connected to the "address.coord" and "grades" nested datasets, respectively, at run time.

## Uses 


* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [Vcl.DBGrids.TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid)
* [TFDMongoQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDBDataSet.TFDMongoQuery)
* [TFDPhysMongoDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDB.TFDPhysMongoDriverLink)

## See Also 


* [Connect to MongoDB Database](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_MongoDB_Database_(FireDAC))
* [Configuring Drivers](http://docwiki.embarcadero.com/RADStudio/en/Configuring_Drivers_(FireDAC))
* [TMongoDocument](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDBWrapper.TMongoDocument)
* [MongoDB Manual](http://docs.mongodb.org/)





