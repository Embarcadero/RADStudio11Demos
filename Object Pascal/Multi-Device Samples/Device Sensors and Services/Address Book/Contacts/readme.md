FMX.Address Book Sample[]()
# FMX.Address Book Sample 


This demo is an FMX application that shows how to use the [TAddressBook](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TAddressBook) component to access the Address Book on an Android or iOS device. 
## Contents



* [1 Location](#Location)
* [2 Description](#Description)
* [3 How to Use the Sample](#How_to_Use_the_Sample)

* [3.1 The Address Book Tab](#The_Address_Book_Tab)
* [3.2 The Add Contact Tab](#The_Add_Contact_Tab)
* [3.3 The Add/Remove Group Tab](#The_Add.2FRemove_Group_Tab)

* [4 Implementation](#Implementation)

* [4.1 Requesting a Permission to Access Address Book](#Requesting_a_Permission_to_Access_Address_Book)
* [4.2 Filling the Contact and Group Lists](#Filling_the_Contact_and_Group_Lists)
* [4.3 Tracking Changes in Address Book](#Tracking_Changes_in_Address_Book)

* [5 Uses](#Uses)
* [6 See Also](#See_Also)


## Location 

You can find the **Address Book** sample project at:
* **Start | Programs | Embarcadero RAD Studio Rio | Samples**, and then navigate to:

* `Object Pascal\Multi-Device Samples\Device Sensors and Services\Address Book\Contacts`
* `CPP\Multi-Device Samples\Device Sensors and Services\Address Book\Contacts`

* **GitHub Repository:**

* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Address%20Book/Contacts](https://github.com/Embarcadero/RADStudio11Demos/tree/main/Object%20Pascal/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Address%20Book/Contacts)
* [https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Address%20Book/Contacts](https://github.com/Embarcadero/RADStudio11Demos/tree/main/CPP/Multi-Device%20Samples/Device%20Sensors%20and%20Services/Address%20Book/Contacts)

## Description 

This sample project illustrates how to display and interact with a device Address Book, including the following techniques:
*  Requesting a permission to access a mobile device Address Book (Android or iOS).
*  Retrieving contacts and groups from the default source in the Address Book.
*  Creation/deletion of contacts.
*  Creation/deletion of the contact groups.

## How to Use the Sample 


1.  Navigate to the location given above, and open:

*  Delphi: **Contacts_Delphi.dproj**
*  C++: **Contacts_CPP.cbproj**

2.  Select **Android** or **iOS Device** as the **Target Platform**.
3.  Select the device.
4.  Press **F9** or choose **Run > Run**.
When you run the sample demo, the application opens the **Address Book** tab that displays all contacts available in the device Address Book (default source):![Addr Book.png](Readme%20Files/Addr%20Book.png)
This sub-section describes all tabs you can use to manage the device Address Book.

### The Address Book Tab 

On this tab, you can perform the following operations:
*  Delete a currently selected contact:

*  Select a contact to delete, and then tap

![Addre Trash.png](Readme%20Files/Addre%20Trash.png)

*  Refresh the contact list:

*  Tap

![Addr Refresh.png](Readme%20Files/Addr%20Refresh.png)

### The Add Contact Tab 

On this tab, you can add a new contact to Address Book.![Add Contact.png](Readme%20Files/Add%20Contact.png)
**To add a contact**

1.  Enter the appropriate information in the **Enter First Name**, **Enter Last Name**, or **Enter Work Email** field.
2.  Optionally, select the contact person photo from a device photo library or take the photo from a device camera.To do this, use the icons next to **Add Photo**.
3.  Optionally, from the **Select Group** list, select a group where to add the newly created contact.
4.  Tap the **Add** button.

### The Add/Remove Group Tab 

On this tab, you can add or remove the contact groups.**To add a new group**

1.  In the **Enter Group Name** text box, enter the new group name.
2.  Tap

![Addr Add.png](Readme%20Files/Addr%20Add.png)
**To remove an existing group**
1.  From the **Select Group** list, select a group to remove.
2.  Tap

![Addre Trash.png](Readme%20Files/Addre%20Trash.png)

.

## Implementation 


### Requesting a Permission to Access Address Book 

The [OnShow](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TCommonCustomForm.OnShow) event triggers when the [application form](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TForm) is shown.[OnShow](http://docwiki.embarcadero.com/Libraries/en/FMX.Forms.TCommonCustomForm.OnShow) calls [RequestPermission](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TCustomAddressBook.RequestPermission).
The [RequestPermission](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TCustomAddressBook.RequestPermission) method of the [TAddressBook](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TAddressBook) requests a permission to read and change the Address Book of the mobile device if the Address Book is currently available on the current platform.

### Filling the Contact and Group Lists 

The [OnPermissionRequest](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TCustomAddressBook.OnPermissionRequest) event of the [TAddressBook](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TAddressBook) triggers when requesting for a permission to access the mobile device.
*  If the permission is granted:

* [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView) is filled with contacts.
* [TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox) is filled with groups defined in the Address Book.

*  If permission is not granted, the application displays a message box, which informs that the user is not allowed to access the Address Book.

### Tracking Changes in Address Book 

The [OnExternalChange](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TCustomAddressBook.OnExternalChange) event of the [TAddressBook](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TAddressBook) triggers after detecting a change to the Address Book. [OnExternalChange](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TCustomAddressBook.OnExternalChange) invokes the [RevertCurrentChangesAndUpdate](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TCustomAddressBook.RevertCurrentChangesAndUpdate) procedure. 
If the Address Book is currently available on the current platform, [RevertCurrentChangesAndUpdate](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TCustomAddressBook.RevertCurrentChangesAndUpdate) reverts all current changes and updates the instance of the [TAddressBook](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TAddressBook).

## Uses 


* [TAddressBook](http://docwiki.embarcadero.com/Libraries/en/FMX.AddressBook.TAddressBook)
* [TListView](http://docwiki.embarcadero.com/Libraries/en/FMX.ListView.TListView)
* [TListBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TListBox)
* [TComboBox](http://docwiki.embarcadero.com/Libraries/en/FMX.ListBox.TComboBox)
* [TActionList](http://docwiki.embarcadero.com/Libraries/en/FMX.ActnList.TActionList)
* [TTabControl](http://docwiki.embarcadero.com/Libraries/en/FMX.TabControl.TTabControl)
* [TTakePhotoFromLibraryAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromLibraryAction)
* [TTakePhotoFromCameraAction](http://docwiki.embarcadero.com/Libraries/en/FMX.MediaLibrary.Actions.TTakePhotoFromCameraAction)

## See Also 


* [Mobile Tutorial: Using an Address Book Component (iOS and Android)](http://docwiki.embarcadero.com/RADStudio/en/Mobile_Tutorial:_Using_an_Address_Book_Component_(iOS_and_Android))
* [Birthday Reminder Sample](http://docwiki.embarcadero.com/CodeExamples/en/FMX.Birthday_Reminder_Sample)





