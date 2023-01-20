FMX.FireDAC.MongoDB.BatchMove Sample[]()
# FMX.FireDAC.MongoDB.BatchMove Sample 


This sample shows how to copy data from a SQLite dataset to a MongoDB dataset in Delphi and C++Builder applications.
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

You can find the **BatchMove** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Database\FireDAC\Samples\DBMS Specific\MongoDB\BatchMove`
* `CPP\Database\FireDAC\Samples\DBMS Specific\MongoDB\BatchMove`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/MongoDB/BatchMove](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/MongoDB/BatchMove)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP//Database/FireDAC/Samples/DBMS%20Specific/MongoDB/BatchMove](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP//Database/FireDAC/Samples/DBMS%20Specific/MongoDB/BatchMove)

## Description 

This sample application illustrates how to work with SQLite and MongoDB databases.Using this sample application, you can:

*  Connect to an SQLite database
*  Connect to a MongoDB server
*  Copy data records from the specified table in SQLite to a MongoDB database.

## Preliminary Steps 

Before using the **BatchMove** sample project, review the following checklist:
*  A MongoDB server is running and accessible from your host.

> **Note**: If the MongoDB server is not running on the machine where you want to run this sample application, or requires non-default connection parameters, such as a port other than 27017, configure the [FDConnection1](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) component accordingly. For details, see [Connect to MongoDB Database](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_MongoDB_Database_(FireDAC)).


## How to Use the Sample 

**To run this project**
1.  Navigate to one of the locations given above and open:

*  Delphi: `Mongo_BatchMove.dproj` project file.
*  C++Builder: `Mongo_BatchMove.cbproj` project file.

2.  Press F9 or choose **Run > Run**.
3.  Click the **Move Data** button.
![BatchMove Demo.png](Readme%20Files/BatchMove%20Demo.png)
## Files 



| **File in Delphi**        | **File in C++**            | **Contains**                                    |
| ------------------------- | -------------------------- | ----------------------------------------------- |
| **Mongo_BatchMove.dproj** | **Mongo_BatchMove.cbproj** | The project itself.                             |
| **fMain.fmx**             | **fMain.fmx**              | The main form where the components are located. |
| **fMain.pas**             | **fmain.cpp**              | Implementation of the sample.                   |


## Implementation 


*  The project uses a [TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) component to establish a connection with sample databases (SQLite and MongoDB).
*  To select the data records from the database, the project uses a [TFDMongoQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDBDataSet.TFDMongoQuery), a [TFDPhysSQLiteDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.SQLite.TFDPhysSQLiteDriverLink), a [TDataSource](http://docwiki.embarcadero.com/Libraries/en/Data.DB.TDataSource), and a [TFDPhysMongoDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDB.TFDPhysMongoDriverLink) components.
*  In the [TFDBatchMoveSQLDriver.TableName](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.BatchMove.SQL.TFDBatchMoveSQLDriver.TableName) property, the project sets the source table name (**Orders** in a given case) that contains the data to copy.
*  In the [TFDBatchMoveDataSetDriver.DataSet](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.BatchMove.DataSet.TFDBatchMoveDataSetDriver.DataSet) property, the project sets the destination dataset (**FDMongoQuery1** in a given case) where to copy the data records.
*  To copy data from the SQLite database to the MongoDB database, the project calls the [TFDBatchMove.Execute](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.BatchMove.TFDBatchMove.Execute) method.
*  A [TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid) displays the retrieved data.

## Uses 


* [FireDAC.Comp.Client.TFDConnection](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection)
* [Vcl.DBGrids.TDBGrid](http://docwiki.embarcadero.com/Libraries/en/Vcl.DBGrids.TDBGrid)
* [TFDMongoQuery](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDBDataSet.TFDMongoQuery)
* [TFDPhysMongoDriverLink](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDB.TFDPhysMongoDriverLink)
* [TFDBatchMoveSQLDriver](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.BatchMove.SQL.TFDBatchMoveSQLDriver)
* [TFDBatchMoveDataSetDriver](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.BatchMove.DataSet.TFDBatchMoveDataSetDriver)
* [TFDBatchMove](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.BatchMove.TFDBatchMove)

## See Also 


* [Connect to MongoDB Database](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_MongoDB_Database_(FireDAC))
* [Configuring Drivers](http://docwiki.embarcadero.com/RADStudio/en/Configuring_Drivers_(FireDAC))
* [TMongoDocument](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDBWrapper.TMongoDocument)
* [MongoDB Manual](http://docs.mongodb.org/)





