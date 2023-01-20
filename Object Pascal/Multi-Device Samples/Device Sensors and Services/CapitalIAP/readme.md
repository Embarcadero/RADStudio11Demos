FMX.CapitalIAP Sample[]()
# FMX.CapitalIAP Sample 


This is a sample that shows the use of in-app payment and advertisement services in mobile applications using **FireMonkey**.
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 Define the Required Products](#Define_the_Required_Products)
* [3.2 Configure Your Google Keys](#Configure_Your_Google_Keys)
* [3.3 Run the Sample Application on a Device](#Run_the_Sample_Application_on_a_Device)
* [3.4 Use the Application](#Use_the_Application)

* [4 Files](#Files)
* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **CapitalTrivia** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples** and navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\CapitalIAP`
* `CPP\Multi-Device Samples\Device Sensors and Services\CapitalIAP`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/CapitalIAP](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/CapitalIAP)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/CapitalIAP](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/CapitalIAP)

## Description 

This application illustrates how to use:
*  An in-app payment service such as **[Google Play In-app Billing](http://docwiki.embarcadero.com/RADStudio/en/Using_the_Google_Play_In-app_Billing_Service)** or **[iOS In-App Purchase](http://docwiki.embarcadero.com/RADStudio/en/Using_the_iOS_In-App_Purchase_Service)** using the **[TInAppPurchase](http://docwiki.embarcadero.com/Libraries/en/FMX.InAppPurchase.TInAppPurchase)** component.
*  An advertising service such as **[AdMob](http://docwiki.embarcadero.com/RADStudio/en/Using_the_AdMob_Service)** or **[iAd](http://docwiki.embarcadero.com/RADStudio/en/Using_the_iAd_Service)** using the **[TBannerAd](http://docwiki.embarcadero.com/Libraries/en/FMX.Advertising.TBannerAd)** component.
TBannerAd will connect to your ads services and display ads inside your app. Using the TInAppPurchase component you can disable these ads.The purchasable content must be registered in Google developer console for Android and iTunes connect for iOS and are managed by the store services. This sample demonstrates how to disable ads and how to add new content in your app, in our case European capitals questions for the trivia.

## How to Use the Sample 


1.  Navigate to the either of the locations given above.
2.  Open the project file:

*  Delphi: `CapitalTrivia.dproj`
*  C++: `CapitalTriviaCpp.cbproj`

3.  Follow the steps below.

### Define the Required Products 

On the constants definition section of the `Main` unit, the application defines the ID of two products. You must define in your store (Google Play, iTunes or both) two new products with the same properties as these two non-consumable products:**Delphi:**
```
const
  EuropeID = 'com.embarcadero.capitals.europe';
  NoAdsID = 'com.embarcadero.capitals.noads';

```



**C++:**
```
const String EuropeID = "com.embarcadero.capitals.europe";
const String NoAdsID = "com.embarcadero.capitals.noads";

```



To define these products in your store, follow the instructions bellow for your in-app payment service or services:

| Google Play In-app Billing                                                                                                                                                                                                | iOS In-App Purchase                                                                                                                                                                                                        |
| ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| [Prerequisites](http://docwiki.embarcadero.com/RADStudio/en/Using_the_Google_Play_In-app_Billing_Service#Prerequisites)                                                                                                   | [Prerequisites](http://docwiki.embarcadero.com/RADStudio/en/Using_the_iOS_In-App_Purchase_Service#Prerequisites)                                                                                                           |
| [Configuring Your Application for In-app Billing in Google Play](http://docwiki.embarcadero.com/RADStudio/en/Using_the_Google_Play_In-app_Billing_Service#Configuring_Your_Application_for_In-app_Billing_in_Google_Play) | [Configuring Your Application for In-App Purchase in iTunes Connect](http://docwiki.embarcadero.com/RADStudio/en/Using_the_iOS_In-App_Purchase_Service#Configuring_Your_Application_for_In-App_Purchase_in_iTunes_Connect) |

After you define these products in your store, update `Main.pas` with the actual IDs that you specified in your store for these four products.
### Configure Your Google Keys 

For the **Google Play In-app Billing** service, you must follow the instructions at **[Establishing a Connection to the Google Play In-app Billing Service](http://docwiki.embarcadero.com/RADStudio/en/Using_the_Google_Play_In-app_Billing_Service#Establishing_a_Connection_to_the_Google_Play_In-app_Billing_Service)**. You must provide your application license key in the [ApplicationLicenseKey](http://docwiki.embarcadero.com/Libraries/en/FMX.InAppPurchase.TCustomInAppPurchase.ApplicationLicenseKey) property, which the sample sets on the `FormCreate` event handler. See [Configuring the Connection Data for the Google Play In-app Billing Service](http://docwiki.embarcadero.com/RADStudio/en/Using_the_Google_Play_In-app_Billing_Service#Configuring_the_Connection_Data_for_the_Google_Play_In-app_Billing_Service).For the **AdMob** service, you must follow the instructions at **[Configuring the Connection Data for AdMob](http://docwiki.embarcadero.com/RADStudio/en/Using_the_AdMob_Service#Configuring_the_Connection_Data_for_AdMob)**. You must provide your ad unit ID in the [AdUnitID](http://docwiki.embarcadero.com/Libraries/en/FMX.Advertising.TCustomBannerAd.AdUnitID) property, which the sample sets on the `InAppPurchaseSetupComplete` event handler.

### Run the Sample Application on a Device 

Once your products are configured, you can proceed to run the application on an **Android** or **iOS** device. See:
* [Running Your Android Application on an Android Device](http://docwiki.embarcadero.com/RADStudio/en/Running_Your_Android_Application_on_an_Android_Device)
* [Running Your iOS Application on an iOS Device](http://docwiki.embarcadero.com/RADStudio/en/Running_Your_iOS_Application_on_an_iOS_Device)
**Note:** Android emulators and the iOS simulator do not support in-app purchases.To test this application without actually publishing it in your application store or incurring charges, see:

| Platform | Advertising service                                                                                           | In-app billing service                                                                                                                                                                            |
| -------- | ------------------------------------------------------------------------------------------------------------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| Android  | AdMob[Testing Your Ads](http://docwiki.embarcadero.com/RADStudio/en/Using_the_AdMob_Service#Testing_Your_Ads) | Google Play In-app Billing[Testing Your In-App Purchase Products](http://docwiki.embarcadero.com/RADStudio/en/Using_the_Google_Play_In-app_Billing_Service#Testing_Your_In-App_Purchase_Products) |
| iOS      | iAd[Testing Your iAds](http://docwiki.embarcadero.com/RADStudio/en/Using_the_iAd_Service#Testing_Your_iAds)   | iOS In-App Purchase[Testing Your In-App Purchase Products](http://docwiki.embarcadero.com/RADStudio/en/Using_the_iOS_In-App_Purchase_Service#Testing_Your_In-App_Purchase_Products)               |

Once you open the application on a device, you can see a screen that lets you choose the number of questions about state capitals that you want to answer. This screen also shows an ad on the bottom and an information icon on the bottom-right corner that gives you access to the application settings.

![CapitalTrivia.png](Readme%20Files/CapitalTrivia.png)


### Use the Application 

The basic use of the application is straightforward: you select the number of questions to answer and you try to answer them. More interesting are the settings.Tap the information icon on the bottom-right corner of the main screen to open the application settings screen. In the settings, you can purchase questions about European capitals, as well as disable the ads on the bottom of the application.


![CapitalTriviaSettings.png](Readme%20Files/CapitalTriviaSettings.png)


## Files 



| Unit       | Description                                                                                                                                                        |
| ---------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------ |
| `Answered` | Form that shows after you answer a question.                                                                                                                       |
| `Main`     | Main screen of the application.This screen lets you choose between quizzes with a different number of questions, and gives you access to the application settings. |
| `Option`   | Application settings.You can configure the questions here, as well as purchase questions about Europe or remove the ads from the application.                      |
| `Quiz`     | Form that shows a question during a quiz.                                                                                                                          |
| `Score`    | Screen that shows after you answer the last question of a quiz.                                                                                                    |


## Uses 


* [FMX.Advertising.TBannerAd](http://docwiki.embarcadero.com/Libraries/en/FMX.Advertising.TBannerAd)
* [FMX.InAppPurchase.TInAppPurchase](http://docwiki.embarcadero.com/Libraries/en/FMX.InAppPurchase.TInAppPurchase)
* [FMX.InAppPurchase.TProduct](http://docwiki.embarcadero.com/Libraries/en/FMX.InAppPurchase.TProduct)

## See Also 


* [Using the Google Play In-app Billing Service](http://docwiki.embarcadero.com/RADStudio/en/Using_the_Google_Play_In-app_Billing_Service)
* [Using the iOS In-App Purchase Service](http://docwiki.embarcadero.com/RADStudio/en/Using_the_iOS_In-App_Purchase_Service)

* [Using the AdMob Service](http://docwiki.embarcadero.com/RADStudio/en/Using_the_AdMob_Service)
* [Using the iAd Service](http://docwiki.embarcadero.com/RADStudio/en/Using_the_iAd_Service)





