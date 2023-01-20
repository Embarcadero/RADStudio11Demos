RTL.ConwaysLifeFMX Sample[]()
# RTL.ConwaysLifeFMX Sample 


**ConwaysLifeFMX** is a sample application that implements a parallelized Conways Game of Life. This game is a zero-player game that evolves from an initial state with no further input. 
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

You can find the **ConwaysLifeFMX** project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and then navigate to either of the following folders:

* `CPP\RTL\Parallel Library\FMX`
* `CPP\Multi-Device Samples\Parallel Library\FMX`
* `Object Pascal\RTL\Parallel Library\FMX`
* `Object Pascal\Multi-Device Samples\Parallel Library\FMX`

* **GitHub Repository:**

* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/RTL/Parallel%20Library/FMX](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/CPP/RTL/Parallel%20Library/FMX)
* [http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/RTL/Parallel%20Library/FMX](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/RTL/Parallel%20Library/FMX)

## Description 

This sample is an implementation of the Conways Game of Life that shows the performance of the [TParallel.For](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Threading.TParallel.For) versus the serial running.In the application interface you have the following controls:

* **Parallel** checkbox lets you switch from the serial version (not checked) to the parallel version (checked).
* **Start** button runs the life generation, **Stop** resumes the game.
* **Clear** button cleans the board of cells.
* **Re Center** focuses the grid board centering both scrollbars.
* **Load** button allows you to load `.LIF` files. These files are different starting points for the simulation. They are contained in the `Lifs` folder in the project.

## How to Use the Sample 


1.  Navigate to the location given above and open **ConwaysLifeFMX.dproj** or **ConwaysLifeFMXCpp.cbproj**.
2.  Select **Run > Run** to run the application.
3.  On the application interface:

1.  Click the **Start** button (with the **Parallel** checkbox unchecked).
2.  Look at the number of `Generations per seconds` displayed in the interface (these are values of the serial version of the game implementation).
3.  Click the **Stop** button.
4.  Now check the **Parallel** option and click the **Start** button again.
5.  Look again at the number of `Generations per seconds` displayed and see how this value has now increased.
> **Note:**You can check the CPU performance on the task manager in your computer to see the use that the parallel version does.


6.  Click again the **Stop** button.
7.  Click the **Load** button and select any `.LIF` file from the **\RTL\Parallel Library\Lifs\** folder, for example `ACORN.LIF`.
8.  Click again the **Start** button to see the life generation.
> **Tip:**To visualize the evolution of the game you might **Stop**, then **Re Center** and finally **Start** again the application.


![Conwayslifesample.png](Readme%20Files/Conwayslifesample.png)


## Files 



| **File**                                             | **Contains**                                                                         |
| ---------------------------------------------------- | ------------------------------------------------------------------------------------ |
| **ConwaysLifeFMX**                                   | The ConwaysLife FireMonkey project.                                                  |
| **LifeUnitFMX.fmx**                                  | The main form that is the user interface for the Conways Game of Life sample.        |
| **LifeUnitFMX.pas**                                  | The container holding source code for the methods used in the ConwaysLifeFMX sample. |
| **\RTL\Parallel Library\Shared_Code\LifeEngine.pas** | The container holding source code for the life engine of the Conways Game of Life.   |
| **\RTL\Parallel Library\Lifs\*.LIF**                 | The `.LIF` files containg different starting points for the simulation.              |


## Classes 

Each application defines a single class that implements the main form of the application.
* **TLifeForm** is the main form that handles all controls.
* **TLifeEngine** implements the different threads for updating generations.
* **ELifeEngine** implements exceptions for the life engine.

## Implementation 


*  A `ProcessCells` function will run in the serial version of the application (**Parallel** option unchecked). It will process on one generation at the time.
*  The [TParallel.For](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Threading.TParallel.For) method is implemented to increase the efficiency of the application. It runs having the **Parallel** option checked. [TParallel.For](http://docwiki.embarcadero.com/Libraries/Denali/en/System.Threading.TParallel.For) processrs a lot of cells of the board simultaneously.

## Uses 

LifeEngine
## See Also 


* [Using App Tethering](http://docwiki.embarcadero.com/RADStudio/Denali/en/Using_App_Tethering)





