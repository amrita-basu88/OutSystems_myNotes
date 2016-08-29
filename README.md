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



### Use Entities to Model Data:

