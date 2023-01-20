FireDAC.MongoDB Explore Sample[]()
# FireDAC.MongoDB Explore Sample 


This is a sample that connects to a MongoDB server and lets you explore its content.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)
* [4 Uses](#Uses)
* [5 See Also](#See_Also)


## Location 

You can find the **ToggleSwitch** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and then navigate to:

* `Object Pascal\Database\FireDAC\Samples\DBMS Specific\MongoDB\Explore`

* **GitHub Repository for Delphi:**[https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/MongoDB/Explore](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Database/FireDAC/Samples/DBMS%20Specific/MongoDB/Explore)

## Description 

This sample application shows how to connect to a MongoDB server and access databases, collection and collection data. You can use this application to browse the data of any existing MongoDB server.![MongoDBExplore.png](Readme%20Files/MongoDBExplore.png)

## How to Use the Sample 


1.  Navigate to the location given above and open `Mongo_Explore.dproj`.
2.  If your MongoDB server is not running on the machine where you want to run the sample application, or requires non-default connection parameter such as a port other than 27017, configure the [FDConnection1](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Comp.Client.TFDConnection) component accordingly. For details, see [Connect to MongoDB Database](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_MongoDB_Database_(FireDAC)).
3.  Press `F9` or choose **Run > Run**.
4.  Select databases or collections on the grids to browse your MongoDB server data.

## Uses 


* [FireDAC.Phys.MongoDBDataSet.TFDMongoDataSet](http://docwiki.embarcadero.com/Libraries/en/FireDAC.Phys.MongoDBDataSet.TFDMongoDataSet)

## See Also 


* [Connect to MongoDB Database](http://docwiki.embarcadero.com/RADStudio/en/Connect_to_MongoDB_Database_(FireDAC))





