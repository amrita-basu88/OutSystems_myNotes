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







##  Similarities Between OutSystems and Appian from a Developer Perspective:

1. Both provide an **Expression Editor**.
2. The TableRecords widget has properties that you can set that are similar to the properties that we need to specify for a `gridField` or a `a!dataSubset` in Appian. Both have `startIndex`, `batchSize`, a configurable message when there are no records etc.
3. Both provide a visual way to create Database entities. 
4. Both have the concept of **Roles**.  We have Anonymous Role, Registered Role, and a role per Application in OutSystems. This is like Groups in Appian.





## OutSystems Developer Terminology:

These are some terms used in OutSystems Platform.

- **Preparation** - a preparation is always associated with a Web Screen. It has the logic to execute to render that Web Screen. It may also have the logic to execute after a Web Screen is submitted.
- **Web Screen** - This is a counter-part to the  `SAIL UI Interface` or `User Input Task` in Appian. It can take input variables. You can have `if` expressions on a Web Screen to conditionally show or hide UI components based on the input variables. The logic for rendering a Web Screen depends on the input variables that it takes.
- **NullIdentifier** - This is used for stating that the Identifier (Id of some entity) is null. This is a special variable.
- **Action** - An Action encapsulates custom logic to be executed. Multiple actions can be used in a **Preparation**. In a way, an Action is like a Smart Service in Appian. These are black-boxes whose implementation is usually hidden. Example: An Action maybe like "CreateOrUpdateContact", "DeleteContact" etc. An Action is shown by an Orange icon in the Service Studio.



## Areas where OutSystems Out-Smarts Appian:

1. The data modelling is very flexible. It is totally visual. We can model the entities and the relationships among them visually and also update the UI accordingly. It can be done very quickly - at-least for the most basic use cases. You can denote relationships using Foreign Key constraint visually in the Service Studio.  OutSystems outsmarts Appian (as of version 16.2) in this aspect.
2. OutSystems has a lot of variety in Charts/Reports when it comes to Analytics (seen in the demo). There are many different charts to choose from. Also a great amount of customization is possible with those charts in OutSystems. This is an Advantage over Appian. Although, it  would not be so difficult for Appian to bring in more charts(and more options to customize them) in the later versions. 









