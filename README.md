## OutSystems: Notes on Development in OutSystems

OutSystems is a low code platform for developing applications - which can be mobile enabled, and also be deployed in the Cloud. 

Development can be done in the **Service Studio IDE** which is available for Windows OS.

The local changes are pushed to the cloud environment provided by **1-click** deployment. The platform generates all the required SQL scripts and the C#/.NET code (if you are using the C# stack as the backend).  Java/J2EE stack is also supported. On mobile, the applications generated are a mix of native and hybrid capabilities. As mentioned in the demo, the platform actually uses Apache Cordova libraries for generating mobile apps. The HTML/JS generated is actually generated using ReactJS behind the scenes (the presenter attributed it to faster UI performance in the latest version of the platform). It is also possible to develop directly in the Cloud environment. 

Currently going through the __Phone-Book__ application given in the free video tutorials. Below are my notes/summaries per video (in the same order)

Every application has objects which can be categorized into - **Process**, **Interface**, **Logic** and **Data**.



### OutSystems Learning Resources:

1. [The Phone-book app video tutorials](http://www.outsystems.com/learn/training/15/1698/647/start-from-a-ui-template/#VideoTitle) - Start from here if you are totally new to this platform. 
2. After you complete Phone Book app tutorial, you need to work on a small application on your own.  Develop a To-Do App for Task management. The problem statement with requirements is [here.](http://www.outsystems.com/learn/training/15/1698/655/todo-challenge/#VideoTitle) You can also submit the application developed. 
3. [Development Fundamentals](http://www.outsystems.com/academy/13/development-fundamentals/) - These are video tutorials with more deeper dive into all the technical aspects. Things like Customizing the CSS, charts/reports, Ajax, user roles etc. are here
4. [Advanced Topics](http://www.outsystems.com/academy/14/mastering-outsystems/) - More advanced topics. Probably no need to dive into this immediately.
5. [Instructor-Led Training class](http://www.outsystems.com/learn/instructor-assisted-training/online-class/) - This is an online class - for two weeks. It is instructor led. You can complete the course within those two weeks. There is no fixed time for taking those classes - you can complete at your own timing and flexibility. But, it has to be done in two weeks. You have to sign up for it. 



### Video1 (Bootstrapping your application from a UI template):

1. Each application is made up of Modules. 
2. Whenever you create a new Module, you can select a predefined responsive theme. In this video, the presenter chose the **London Responsive Theme**
3. An application can have Entities - which are nothing but the Data-Types used in your application. These are similar to the CDTs in Appian. Entities are under the "Data" tab.
4. You can **Bootstrap an Entity** - meaning you can quickly pull some data - from an Excel file.



### Video2 (List Records from the Database):

1. To fetch the data from the database, you will need to create an action called **Preparation**. A preparation is associated with a Web Screen/UI. A preparation will contain an **aggregate**. An aggregate can involve one or more entities.  A **Preparation** allows you to prepare all the information/logic required to render the screen.	
2. A **TableRecord**  UI widget is provided for **Web Screen** . Think of it as the Record List View in Appian. You need to bind this widget to the agreegate that you created.  You have to specify the Source Record List for this widget. In the video, it was set to the value `GetContacts.List` using the Expression Editor.
3. You can set the **Roles** for a Web Screen. If you allow Anonymous role, you do not need to login to view the app in the cloud. 


### Video3 (Create a Detail Screen for a Record):

1. Think of this as creating a Record Summary View in Appian.
2. You can link each Contact to the relevant `ContactDetail` screen.
3. The `ContactDetail` screen will take a Input Parameter called `ContactId` - to show the details of the clicked Contact. Think of it like a `Rule Parameter - ri!` in Appian. You can create multiple Input parameters for each Web Screen.
4. Instead of having something called a `a!recordLink()` , you can use the `Link to` feature from the UI, then select the destination web screen. 
5. You need to provide the `CurrentRecord.ContactId` - which will be set to the property of the Link.



### Video4 (Edit a Record from the Database):

1. You can have Buttons - Save and Cancel on the `ContactDetail` screen.
2. A Button can have an associated **Screen Action** which encapsulates the logic to execute when that Button is clicked. For eg: You may have a Screen Action to save the data to a database. The logic is executed at the Server side.
3. A Button can also have a Destination Web Screen instead of a Screen Action. For eg: you can redirect the user back to the `Contacts` screen after he clicks on the `Cancel` button.
4. Inside a Screen Action, you can call other Actions - like `UpdateContact` action which updates a record in the database.



### Video5 (Create a new Record in the Database):

1. You need to use a UI "If" conditional to conditionally display or hide a UI Element on a Web Screen.
2. There is also a "IF" that you can use while creating the Actions.
3. In this example, we are calling either the `CreateContact` or `UpdateContact` actions. If the `ContactId` equals `NullIdentifier` then we call the `CreateContact` action.
4. You can also link some text on Web Screen to an Action or another Web Screen.



### Video6 (Add Company Table, create pages and logic):

1. In this video, we created a new Entity - Company. We also added the pages for Companies and Company Detail. We created a preparation and Save actions for them.
2. We also added them to the main workflow. 
3. Now, you can add a link in the common menu bar. We added a link in the Contacts page to the Companies page.
4. To quickly setup a link from the Contacts page to the Companies page, you just have to drop the Web Screen for the Companies in the Menu bar of the Contacts page. Caveat: The common menu bar does not appear until you preview your page in the desktop/tablet mode. You can add the menu and then turn off the preview.




### Video7 (Create and Display a Relationship):

1. You can generate Entity Diagram by going under "Data". You can click on "Add Entity Diagram". Then you can add Entities in it.
2. To add a relationship between Company and Contact, we created a `CompanyId` attribute in the Contact entity. The platform understands automatically that you mean to create a foreign key that references the Id in the Company Entity. It updates the data model accordingly. The  Entity diagram will get updated automatically and display the updated relationship.  Note: It is possible to view what SQL query will actually be executed and the type of  Join that will be used.
3. In the Contact Details Web Screen, you can now add the `CompnayId` attribute in the Form Widget. The platform will automatically create a combo box with the associated Company Names.  The platform infers that the Name attribute of the Company is the appropriate attribute to show in the combo box.
4. Thus, you can now associate a Contact with a Company on the UI. For every contact, you will be presented with the available Companies to choose from. 



### Video8 (Page Lifecycle Overview | Using the Debugger):

1. To add a Breakpoint to any object, just select it and press the key **F8**.
2. After adding the Breakpoints, you can start the debugger and then start the application using 1-click publish.
3. Use **F9** to step at a time.
4. To see a value of a variable under `Locals`, you need to double click on the variable name. It will show all the values for that variable, even if it is a complex aggregate. For simple values, the variables are displayed inline.








##  Similarities Between OutSystems and Appian from a Developer Perspective:

1. Both provide an **Expression Editor**.
2. The TableRecords widget has properties that you can set that are similar to the properties that we need to specify for a `gridField` or a `a!dataSubset` in Appian. Both have `startIndex`, `batchSize`, a configurable message when there are no records etc.
3. Both provide a visual way to create Database entities. 
4. Both have the concept of **Roles**.  We have Anonymous Role, Registered Role, and a role per Application in OutSystems. This is like Groups in Appian.





## OutSystems Developer Terminology:

These are some terms used in OutSystems Platform.

- **Preparation** - a preparation is always associated with a Web Screen. It has the logic to execute to render that Web Screen. It may also have the logic to execute after a Web Screen is submitted.
- **Web Screen** - This is a counter-part to the  `SAIL UI Interface` or `User Input Task` in Appian. It can take input variables. You can have `if` expressions on a Web Screen to conditionally show or hide UI components based on the input variables. The logic for rendering a Web Screen depends on the input variables that it takes. This is shown by a Rectangle with blue border.
- **Web Block** - a re-usable screen that can be used in other Web Screens
- **NullIdentifier** - This is used for stating that the Identifier (Id of some entity) is null. This is a special variable.
- **Action** - An Action encapsulates custom logic to be executed on the server side. Multiple actions can be used in a **Preparation**. In a way, an Action is like a Smart Service in Appian. These are black-boxes whose implementation is usually hidden. Example: An Action maybe like "CreateOrUpdateContact", "DeleteContact" etc. An Action is shown by an Orange icon in the Service Studio.
- **Screen Action** - A screen action is used for things like submitting the data from a form to the server.
- **UI IF** - A UI If conditional allows you to conditionally display or hide a UI component.





## Areas where OutSystems Out-Smarts Appian:

1. The data modelling is very flexible. It is totally visual. We can model the entities and the relationships among them visually and also update the UI accordingly. It can be done very quickly - at-least for the most basic use cases. You can denote relationships using Foreign Key constraint visually in the Service Studio.  OutSystems outsmarts Appian (as of version 16.2) in this aspect.
2. OutSystems has a lot of variety in Charts/Reports when it comes to Analytics (seen in the demo). There are many different charts to choose from. Also a great amount of customization is possible with those charts in OutSystems. This is an Advantage over Appian. Although, it  would not be so difficult for Appian to bring in more charts(and more options to customize them) in the later versions. 
3. The development can be done on a local environment as well as in the cloud. It can be published to the cloud with one click from your local machine. When developing on the local environment, it downloads the code to your machine by connecting to the cloud. This allows flexibility - it makes it possible to develop offline.
4. The Debugger is a very good tool for the developers. It is better than the `Monitor Process Instance` in Appian (which does not have all the features of a debugger). It lets you set breakpoints, step in, step over etc. It enables the developers to closely look at how their application is behaving and inspect all the variables of interest.
5. You need not create a process model for everything.  You can have a workflow without having a process. In Appian, every workflow needs to be backed by a process model.




### OutSystems Architecture

Service Studio - The IDE commonly used by OutSystems Developers

Integration Studio - IDE used to write connection points with OutSystems. eg: if you want to integrate some existing library, or build connector to SAP you can use it

Platform Server Management Console -  A web application which enables you to look how your server behaves, enables you to check logs etc. It is the face of your Outsystems Platform server. 

Platform Server - The server which takes in the blueprint of our application when you use "one-click publish" and generates, optimizes the code, makes any changes required to the database model, then pushes it to the application server. 

Application Server - This is the server/container in which your application is deployed. This can be IIS/JBoss/Websphere etc.

LifeCycle Management - Enables you to look at different environments - for eg: you can look at QA env, Dev env etc. You come here when you want to push something to QA or Production..



Course Format

Video Lessons and Assignments:

Checkpoint sessions

Expected time to complete: 25 hours (two weeks)

Student Dashboard Application 

Some lessons are without videos - they are more like assignments



Assignments Materials - contains CSS, images, JS required





### Shortcuts:

Pressing F1 takes you to the Help page of that object.

Ctrl + N when creating Entity Attributes helps you to quickly add a New Attribute to Entity



### Use Entities to Model Data:

The Is Mandatory property of Entity attribute does not actually make a required constraint in DB.

It just makes sure that the platform server ensures that the value is filled at run-time. The platform uses it for input field validation



#### Calculated Attribute - to be noted

CurrDate() function gives todays date

Concat(t1, t2) - concatenate two strings



#### Delete rule property

Determines if the associated entity should also be deleted. If set to "Protected" it wont delete.



### Structure

A Structure is like a Entity. It also has attributes. But it does not have Identifier and it cannot be saved to database. The output of raw SQL queries can be stored in Structure. Structures are not persistent.



#### Assign Node:

Used to assign the output of an action to a variable



OrderForm.Record - references the mapped Record on OrderForm. If only one record is mapped it will automatically point to it. ELse you need to be specific.



### Static Entity/ Look up Table

Contains rows which are assigned at design time only. Example: you may have a Static Entity to store the Status - with Only three values: New, Shipped, Cancelled



We need to set special value for options like 'None', 'Please Select' for Combo box



Form.Valid property indicates if a form is Valid i.e if all the fields on the form are valid

using ValidationMessage property of the Widget you can show custom validations for the fields.



Set the Validation to "Client and Server" to enable Client side validations.



In OutSystems, Business logic is done in Preparation, or in Screen Action or user actions.. under Logic tab you can add Actions.



### About Web Blocks

A web block can have its own Preparation.

You can just drag the web block to a web screen. 

The preparation of the parent Web screen is executed first. The preparation of the Web block is followed later.

You can have nested web blocks (a web block based on another web block). You can nest web blocks as much as possible. Only restriction - you cannot nest a web block in itself.

Actually the Menu, the Application Header are itself made of Web Blocks.

These Web Blocks can also have preparation and customized using CSS.

A web block cannot have an output parameter.  The outwards communication is achieved by using the Notify and ScreenActions (like OnNotify). Even a Web Screen cannot have Output parameter.

The widget needs to have the "Name" property set for a 'Ajax Submit'.





### Difference Between a Screen Action and an Action

A screen action always has access to the local variables or the widgets used in that Web Screen.

An action does not have access to the local variables of a screen action. It can however have input parameters.



### Aggregates vs Advanced Query

Aggregates are the recommended way for DB queries. Use the "Refresh Data" query when you want to re-execute a agreegate or an advanced query.



### Notify Widget Action

The NotifyWidget action is a [System  Action](http://www.outsystems.com/help/servicestudio/9.0/Language_Reference/System_Actions_and_Functions/Overview_of_System_Actions_and_Functions.htm) that allows Web Blocks to notify their parent ([Web  Screen](http://www.outsystems.com/help/servicestudio/9.0/Web_User_Interface/About_Web_Screens.htm) or [Web  Block](http://www.outsystems.com/help/servicestudio/9.0/Miscellaneous/Reuse_screens/About_Screen_Blocks.htm)) that a relevant event has occurred. When a Web Block uses the  Notify Widget, the parent element needs to specify a screen action that  will be called after the notification is sent.To use the Notify Widget, proceed as follows:

1. In the Web Block use the Notify Widget as part of the logic;
   2. On every usage of the Web Block (in both Web Screens and Web Blocks)  specify the [Screen 	 Action](http://www.outsystems.com/help/servicestudio/9.0/Designing_Actions/Create_a_Screen_Action.htm) that will handle the notification by setting the On Notify property of the Web Block. 

   Notify Widget cannot be used in Screen Action. It can be used only inside the Web Blocks.



### A good comparison of Ajax Submit and Server Submit

https://youtu.be/5myb1yveUNc





































​            

 

​	9.2. Sort Columns in a List - OutSystems            

You need to use the function List_SortColumn_GetOrderBy in Aggregates for Dynamic sorting.





### Pop-up Editor

Widget - Popup_Editor

Actions - PopEditor_Close() and PopupEditor_Notify()

Notify action always notifies the parent WebBlock or parent Screen. Yes, you can have cascading Notifies.





### Charts:

Need a `DataPoint` structure. You need to convert the data to represent in a DataPoint Structure to display in a Chart. All charts basically take a List of DataPoints as input



### Roles and Groups:

To create a new User in your personal cloud, go to http://yourpersonalcloud.com/Users

A group can be associated with multiple roles.

Roles are the mechanism by which you can control what operations can be done by users.

Using groups, you can grant or revoke the roles to multiple users(belonging to the same group) in one go.

So, a Group can have multiple roles.



### Re-using Elements from other Applications/Modules:

You can reuse the objects from other applications/modules in your application/module.

You have to make the object as "Public" if you want it to be able to be used in other applications.

Then you can click on "Manage Dependencies" icon in the IDE, enter the name of the application from which you want to select the element. Service Studio will pick that element along with its dependencies and make it available to your application.



When a element which is being reused from another application(the Producer application) and if it gets changed, the consumer (dependent) application will show warning when you open it next time. It will say "the application contains outdated references. You can use Manage Dependencies for updating the references". You can then open the "Manage Dependencies" tool and find the elements which are outdated and refresh them. This will cause the elements to be updated in the Consumer application.

To Debug logic used from another application, you need to "Select entry eSpace" from the "Debugger" menu. This will set a different entry point from the producer application. 

Every application has a different eSpace.



### (OutSystems Forge)[http://outsystems.com/forge]

Forge is a repository of Open-Source and Pre-built OutSystems components, widgets and Applications.

You can use the ready-made applications directly in your application.



### Some quick facts:

1. A Mandatory attribute on a entity does not create a database constraint.
2. An Action is a reusable logic.  A User defined action can also be exposed as a function optionally.



### Security in OutSystems:

1. By using Roles
2. By Integrated Authentication - uses Windows Authentication - works only with the .NET stack.
3. Internal Access - you can specify the IP range which should be allowed the access.
4. HTTPS: To use SSL protocol on top of HTTP with or without client certificates.



### Business Process Technology in OutSystems:

1. You can create process in OutSys.
2. A process can be launched by either an action or by some event on an Entity.
3. A process contains Activities. Some activities may be automated one, some may be "Human Activities" - similar to "User Input Tasks" in Appian.



### Sample Application to create:

Employee Skills Management.

an application which will allow to track employees by their skills. Each employee can update, add and edit their skills. An employee can have a developer, QA or a managerial track. The skill sets are different for each track (which means a skill belongs to only a particular track). Also have a Project allocation team which will track the employees which have relevant skills for a project. Each skill of an employee will have attributes like - recently worked on, total experience, highest certification  for that skill, date of certification etc..

An employee should be able to:

1. Update his skills
2. Add, edit or remove them.

Project allocation team should be able to raise a request for number of employees they need for a project.

The system should use an algorithm and return the employees which match the criteria and show those employees. Once an employee is mapped to a project, that employee should not be considered for the next request. Project allocation team should also be able to de-allocate an employee from a project.



A skill can be associated with only one career track



### Questions:

1. Can we have cascading notifications between widgets? Let's say I have notified a parent widget from a child widget to re-render. I want the parent widget in-turn to notify its own parent. Can this be done?
2. Can an aggregate have an output like an advanced query?
3. Does OutSystems have any in-built features/third-party connectors for Document management and versioning? Also does it have any features for generating or manipulating documents(especially word/excel and PDF)?
4. How can we use the ListAppendAll action instead of the ListAppend action to  create DataPoints? What is the syntax to create a literal List in OutSystems
5. I tried to find the usages of the RichWidget "Feedback_Message" using the "Find usages". It returned "No usages" in the results. I don't see that widget used anywhere in the headers of common screenflows. Still, I used the "Feedback_Message" action in my screen action and I was able to get the feedback message in my application. Can anyone let me know if they can find the usages for "Feedback Message" richwidget on OutSystems 9?





