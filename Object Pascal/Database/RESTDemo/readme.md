REST.RESTDemo Sample[]()
# REST.RESTDemo Sample 


This sample illustrates how to use the [DataSnap REST](http://docwiki.embarcadero.com/RADStudio/Denali/en/DataSnap_REST) components on source level.
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

You can find the **REST Demo** sample project at:
* **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and navigate to **Object Pascal\Database\RESTDemo**.
* **GitHub Repository for Delphi:**[http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Database/RESTDemo/](http://sourceforge.net/p/radstudiodemos/code/HEAD/tree/branches/RADStudio_Denali/Object%20Pascal/Database/RESTDemo/)

## Description 

This sample consists of several examples that show how to use the [REST Client Library](http://docwiki.embarcadero.com/RADStudio/Denali/en/REST_Client_Library). These examples connect to the **REST–service** from Discogs, Twitter, Google, or DropBox. The user can access the examples by going through each [tab](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.ComCtrls.TTabSheet) of the main form. The Twitter example demonstrates how to connect to Twitter API using the [OAuth1](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Authenticator.OAuth.TOAuth1Authenticator) and how you can send a tweet from your **Delphi** application. The use of [OAuth2](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Authenticator.OAuth.TOAuth2Authenticator) is shown in **Accessing Google Tasks API** example.

## How to Use the Sample 


1.  Navigate to **Start | Programs | Embarcadero RAD Studio 10.4 Denali | Samples** and open **Object Pascal\Database\RESTDemo\RESTDemos.dproj**.
2.  Press F9 or choose **Run > Run**.
3.  Select the **Twitter**[tab](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.ComCtrls.TTabSheet).

![TwitterTabRESTDemo.png](Readme%20Files/TwitterTabRESTDemo.png)


4.  Register the client as an application on Twitter [developer-console](https://dev.twitter.com/apps).**Note**: You need to sign in with your Twitter account or to create one if you don't have an account.
5.  Go back to the **REST Demo** application running and enter the **Consumer-Key** and the **Consumer-Secret** values.
6.  Click the **Get Request-Token and Auth-Code**[button](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.StdCtrls.TButton).**Note**: This example requires a SSL encrypted connection. You can install the [SSL library](http://indy.fulgan.com/SSL/) and copy the **libeay32.dll** and the **ssleay32.dll** files to your system path.

![OAuthWebViewRESTDemo.png](Readme%20Files/OAuthWebViewRESTDemo.png)


7.  Enter your Twitter account information in the **OAuth Web Login** page opened.
8.  Transfer the six-digit verification-code manually as it cannot be copied into the clipboard.
9.  Click the **Close**[button](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.StdCtrls.TButton).
10.  Enter the verification-code to **Auth-Verifier (PIN)**[TLabeledEdit](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.ExtCtrls.TLabeledEdit).
11.  Click the **Get Access-Token**[button](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.StdCtrls.TButton).
12.  Type a Tweet status or click the **Create tweet**[button](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.StdCtrls.TButton).
13.  Click the **Send a tweet**[button](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.StdCtrls.TButton).

![TwitterStatusRESTDemo.png](Readme%20Files/TwitterStatusRESTDemo.png)

## Files 



| **File**      | **Contains**            |
| ------------- | ----------------------- |
| **uMain_frm** | Contains the main form. |
| **RESTDemo**  | The project itself.     |


## Classes 

**Tfrm_Main** is the form of the application. This form contains objects like: [TTabSheet](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.ComCtrls.TTabSheet), [TRESTClient](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Client.TRESTClient), [TRESTRequest](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Client.TRESTRequest), [TRESTResponse](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Client.TRESTResponse), [TOAuth1Authenticator](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Authenticator.OAuth.TOAuth1Authenticator), [TOAuth2Authenticator](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Authenticator.OAuth.TOAuth2Authenticator) and defines a set of procedures as: **LoadConnectionData**, **OAuth2_Facebook_AccessTokenRedirect**, or **ResetRESTComponentsToDefaults**.
## Implementation 


*  The **btn_Twitter_RequestAuthPINClick** procedure transfers the **Consumer-Key** and the **Consumer-Secret** values to Twitter's request-token-endpoint and gets the **Request-Token** and the **Request-Token-Secret** values using the [GetSimpleValue](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Client.TCustomRESTResponse.GetSimpleValue) method of [TRESTResponse](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Client.TRESTResponse). In this procedure, the **Tfrm_OAuthWebForm** is created to allow the user to get the authentication verifier.
*  The **btn_Twitter_RequestAccessTokenClick** procedure gets the authentication verifier entered by the user, makes a request to the access-token-endpoint through the [AccessTokenEndpoint](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Authenticator.OAuth.TOAuth1Authenticator.AccessTokenEndpoint) property of the [TOAuth1Authenticator](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Authenticator.OAuth.TOAuth1Authenticator), and gets the **Access-Token** and the **Access-Token-Secret** values.
*  The **btn_TwitterClick** procedure sends a Twitter status using the **rmPost** value of the [TRESTRequest](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Client.TRESTRequest) method property. This procedure adds a **status** parameter to the Params property of [TRESTRequest](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Client.TRESTRequest).

## Uses 


* [TRESTClient](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Client.TRESTClient)
* [TRESTRequest](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Client.TRESTRequest)
* [TRESTResponse](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Client.TRESTResponse)
* [TOAuth1Authenticator](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Authenticator.OAuth.TOAuth1Authenticator)
* [TOAuth2Authenticator](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Authenticator.OAuth.TOAuth2Authenticator)
* [TRESTResponseDataSetAdapter](http://docwiki.embarcadero.com/Libraries/Denali/en/REST.Response.Adapter.TRESTResponseDataSetAdapter)
* [TClientDataSet](http://docwiki.embarcadero.com/Libraries/Denali/en/Datasnap.DBClient.TClientDataSet)
* [TMemo](http://docwiki.embarcadero.com/Libraries/Denali/en/Vcl.StdCtrls.TMemo)

## See Also 


* [REST Client Library](http://docwiki.embarcadero.com/RADStudio/Denali/en/REST_Client_Library)
* [Tutorial: Using the REST Client Library to Access REST-based Web Services](http://docwiki.embarcadero.com/RADStudio/Denali/en/Tutorial:_Using_the_REST_Client_Library_to_Access_REST-based_Web_Services)





