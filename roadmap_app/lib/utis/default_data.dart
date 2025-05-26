import 'package:roadmap_app/model/topic_model.dart';
import 'package:roadmap_app/model/week_model.dart';

final List<WeekModel> defaultData=[
  WeekModel(
    name: 'Week 1',
    topics: [
    TopicModel(
      tittle: '1.Dart Basic -Day 1', 
      isdone: false, 
      description: '''
      - What is Dart?
      - Study everything about dart 
      '''
      ),
      TopicModel(tittle: '2.Datatypes -Day 1',
       isdone: false,
       description: '''
      - Number
      - String
      - Boolean
      - List
      - Map
      - Set
      - Runes
      - Symbols
      - Enumeration
      '''
       
       ),
       TopicModel(tittle: '3.Variables -Day 1',
       isdone: false,
       description: '''
      - Var
      - Dynamic
      '''
       ),
        TopicModel(tittle: '4.constants -Day 1',
       isdone: false,
       description: '''
      - Final
      - Const
      '''
       ),
       TopicModel(tittle: '1.Decision making statements -Day 2', 
    description: '''
      - if
      - if - else
      - if else if
      '''
    ),
    TopicModel(tittle: '2.Decision making statements -Day 2', 
    description: '''
      - Switch case
      - Practice switch case
      '''
    ),
    TopicModel(tittle: '3.Looping Statement -Day 2', 
    description: '''
      - For loop
      - For in loop
      - While loop
      - Do while
      '''
    ),
    TopicModel(tittle: '4.Jump statement -Day 2', 
    description: '''
      - Break statement
      - Continue statement
      '''
    ),
    TopicModel(tittle: '5.Dart Operators -Day 2', 
    description: '''
      - Logical operators
      - Assignment operator
      - Arithmetic operator
      '''
    ),
    TopicModel(tittle: '1.Srting -Day 3', 
    description: '''
      - String methods and properties
      - Practice string methods and properties
      '''
    ),
    TopicModel(tittle: '2.List -Day 3', 
    description: '''
      - List methods and properties
      - Practice List methods and properties
      '''
    ),
    TopicModel(tittle: '3.Map -Day 3', 
    description: '''
      - Map methods and properties
      - Practice Map methods and properties
      '''
    ),
    TopicModel(tittle: '4.Set -Day 3', 
    description: '''
      - Set methods and properties
      - Practice Set methods and properties
      '''
    ),
    TopicModel(tittle: '1.Function -Day 4', 
    description: '''
      - Function Definition
      - Function Return Types
      - Arrow Functions
      - Anonymous Functions
      '''
    ),
    TopicModel(tittle: '2.Parameters and Arguments -Day 4', 
    description: '''
      - Function Parameters
      - Required parameters
      - Optional positional parameters
      - Named parameters
      - Default values
      - Argument
      '''
    ),
    TopicModel(tittle: '1.Asynchronous Function -Day 5', 
    description: '''
      - Isolates
      - Stream
      - Asynchronous Functions
      - async, await, and Future
      - Future and stream
      '''
    ),
    TopicModel(tittle: 'Review', 
    description: '''
      - Review all this week topics
      '''
    ),
    ]
  ),
  WeekModel(
    name: 'Week 2', 
  topics: [
    TopicModel(tittle: '1.Null Safety -Day 1', 
    description: '''
      - What is Null safety
      - What are Different types of null operators
      - Late keyword
      '''
    ),
    TopicModel(tittle: '2.Operators Safety -Day 1', 
    description: '''
      - ?? if null operator
      - ??= null aware assignment operator
      - ?. null aware access operator
      - ! null assertion operator
      - ?.. null aware cascade operator
      - ?[ ] null aware index operator
      - …? null aware spread operator
      '''
    ),
    TopicModel(tittle: '1.Classes and Objects -Day 2', 
    description: '''
      - Classes and Objects
      - Study the practical side also
      '''
    ),
    TopicModel(tittle: '1.Abstraction -Day 3', 
    description: '''
      - Abstraction
      - Learn practically
      - Abstract class
      '''
    ),
    TopicModel(tittle: '2.Polymorphism -Day 3', 
    description: '''
      - Polymorphism
      - Learn practically
      '''
    ),
    TopicModel(tittle: '3.Inheritance -Day 3', 
    description: '''
      - Inheritance
      - Learn practically
      - Types of inheritance
      - Inheritance of constructors in dart
      - Mixin in Dart
      - Super keyword
      '''
    ),
    TopicModel(tittle: '4.Encapsulation -Day 3', 
    description: '''
      - Encapsulation
      - Learn practically
      - Getter and setter
      '''
    ),
    TopicModel(tittle: 'Dart revise -Day 4', 
    description: '''
      - Practice problems using dart
      - learn more about dart
      '''
    ),
    TopicModel(tittle: 'Leetcode -Day 5', 
    description: '''
      - Practice problems in the 
        Leetcode or Codewars
      '''
    ),
  ]),
  WeekModel(
    name: 'Week 3', 
    topics:[
      TopicModel(tittle: '1.Flutter Installation -Day 1', 
    description: '''
      - Install the Flutter SDK & Android Studio
      - create Flutter application
      - Understanding the Project Structure
      - structure of the Flutter project 
        application and its purpose
      '''
    ),
    TopicModel(tittle: '2.Flutter -Day 1', 
    description: '''
      - What is Flutter?
      - Key Features of Flutter
      - Advantage of Flutter & 
        Disadvantages of Flutter
      '''
    ),
    TopicModel(tittle: '1.Widgets -Day 2', 
    description: '''
      - Have a clear idea about Widgets
      - stateless and stateful widgets
      - Scaffold
      - MaterialApp
      '''
    ),
    TopicModel(tittle: '2.Basic Widgets to build UI -Day 2', 
    description: '''
      - Text
      - Container
      - Row
      - Column
      - Asset Image
      - Network Image
      - Stack
      - SizedBox
      - TextField
      - Icon
      '''
    ),
    TopicModel(tittle: '3.Buttons -Day 2', 
    description: '''
      - Different type of buttons
      - Elevated
      - Floating action button
      - Icon Button
      - TextButton
      - Gesture Detector Image
      - Inkwell
      '''
    ),
    TopicModel(tittle: '4.Widgets -Day 2', 
    description: '''
      - Expanded
      - Flexible
      - Align
      - Positioned
      - Circle Avatar
      - Try as much as you can
      '''
    ),
    TopicModel(tittle: '1.Navigation -Day 3', 
    description: '''
      - Flutter Navigation and Routing
      - Navigator methods
      - Navigator.push()
      - Navigator.pop()
      - Navigator.pushReplacement()
      - Navigator.pushAndRemoveUntil()
      - Navigator.popUntil()
      - Navigator.pushNamed()
      - Navigator.pushReplacementNamed()
      '''
    ),
    TopicModel(tittle: '2.Media Query -Day 3', 
    description: '''
      - Media Query
      - Practice media query
      '''
    ),
    TopicModel(tittle: '3.Flutter Life Cycle -Day 3', 
    description: '''
      - Flutter life cycle(imp)
      - Have a detailed idea about life cycle
      '''
    ),
    TopicModel(tittle: 'Project', 
    description: '''
      - build an ui of any app
      '''
    ),
    ]),
    WeekModel(
      name: 'Week 4', 
    topics: [
      TopicModel(tittle: 'Project', 
    description: '''
      - Clone ui of Flipkart(1 week)
      '''
    ),
    ]),
    WeekModel(
      name: 'Week 5', 
    topics: [
      TopicModel(tittle: '1.What is Local Database? -Day 1', 
    description: '''
      - local storages, and local databases.
      '''
    ),
      TopicModel(tittle: '2.Shared Preference -Day 1', 
    description: '''
      - Shared Preference
      - Make a Login Page using shared preferences.
      '''
    ),
      TopicModel(tittle: '1.Database -Day 2', 
    description: '''
      - Learn the basics of sql and
         Nosql type databases. 
        (sqFlite and hive)
      - Learn deeply in the Local database.
        Understanding the workflow of 
        Hive and sharedpreferences,
      - Prepare a sample student record 
        using a local database(Hive).
      '''
    ),
      TopicModel(tittle: 'Project', 
    description: '''
      - Prepare a sample student record using a local database(Hive)
      '''
    ),
    TopicModel(tittle: '1.More in Hive -Day 5', 
    description: '''
      - Complete your project
      - Singleton
      - future builder streambuilder
      - valuelistenbale builder
      '''
    ),
    ]),
    WeekModel(
      name: 'Week 6', 
      topics: [
        TopicModel(tittle: 'Rewiew', 
        description: '''
      - Learn All previous the Topics 
      '''
 )
  ]),
  WeekModel(
      name: 'Week 7-9', 
      topics: [
        TopicModel(tittle: 'Project', 
        description: '''
      - Select a project using Hive
      - complete in 3 weeks 
      '''
 )
  ]),
  WeekModel(
      name: 'Week 10', 
      topics: [
        TopicModel(tittle: '1.State Management -Day 1', 
        description: '''
      - What is state in Flutter?
      - Why do we need state management?
      - Types of state: Ephemeral (local) vs 
        App state (global)
      - Understand why Provider is used 
        in Flutter apps.
      '''
    ),
        TopicModel(tittle: '2.Started with Provider -Day 2', 
        description: '''
      - Installing provider package
      - ChangeNotifier and 
        ChangeNotifierProvider
      - Consumer and Provider.of methods
      - notifyListeners() - how it updates UI
      - Understand the basic Provider setup
        and how UI updates work.
      '''
    ),
        TopicModel(tittle: '3.Managing Simple State -Day 3', 
        description: '''
      - Creating a counter app using 
        Provider
      - Separating logic into a 
        provider class
      - Using ChangeNotifierProvider
        and Consumer
      - Nesting multiple 
        ChangeNotifierProviders
      - Using MultiProvider for 
        cleaner setup
      '''
    ),
        TopicModel(tittle: '4.Listening to Changes -Day 4', 
        description: '''
      - Using Selector and context.select()
      - Optimizing performance by minimizing rebuilds
      '''
    ),
        TopicModel(tittle: '5.Provider with Async Operations -Day 5', 
        description: '''
      - Handling loading, success, and
        error states
      - Create small example loading states
      - CONTEXT.READ(),CONTEXT.WATCH(),
        SELECTORS AND EVERYTHNG
      '''
    ),
  ]),
  WeekModel(
    name: 'Week 11',
     topics: [
      TopicModel(tittle: 'API -Day 1', 
        description: '''
      - Learn about REST Web Service
      - Have a clear idea about HTTP methods
        (GET, POST, PUT .PATCH,DELETE)
      - Learn about DIO,
      - fromJson() & toJSon()
      - use try catch
      '''
    ),
      TopicModel(tittle: 'API -Day 2', 
        description: '''
      - Have well clear about URI,URL
      - types of URI 
      - types of Api
      - Practice all HTTP methods using 
        dummy api's -
        (eg:www.jsonplaceholder.typicode.com, 
        in this website.
        You can get free dummy api's).
      - fromJson() & toJSon()
      - Learn what is POSTMAN, and
        its working(imp)
      '''
    ),
      TopicModel(tittle: 'API -Day 3-5', 
        description: '''
      - Keep state management in your 
        assignment
      - using model classes 
      - Create at least two apps
      - Publish your project on GIT
      - Make a video about your project,
        Upload in LinkedIn.
      '''
    ),
     ]),
     WeekModel(
      name: 'Week 12', 
      topics: [
        TopicModel(tittle: 'project', 
        description: '''
      - Learn more about api's
      - create a netflix using api with 
        token passing
      '''
    ),
      ]),
     WeekModel(
      name: 'Week 13', 
      topics: [
        TopicModel(tittle: 'Firebase -Day 1', 
        description: '''
      - Learn what is Firebase  and how 
        its working in flutter.
      - Features of firebase.
      - Advantages of firebase.
      - Disadvantages of firebase.
      - Database in firebase.
      - Types of authentication in firebase.
      '''
    ),
        TopicModel(tittle: 'Firebase -Day 2-3', 
        description: '''
      - Connect a firebase project in 
        your flutter project.
      - Create a sample CRUD 
        (Create , Read , Update , Delete)
        using firebase as backend.
      - Prepare a sample student record 
        using firebase
        Use any state management - Important.
        Complete all UI parts in this project.
        Must have 4 data fields like 
        image , name , age, class , 
        address , etc…
      - Users should be able to add
        new students.
        All Students List will be listed 
        in the Homepage.
      - (Images are not compulsory in 
        Firebase due to 
        payment issues with its storage) 
      '''
    ),
        TopicModel(tittle: 'Supabase -Day 4', 
        description: '''
      - Learn what is Supabase  and 
        how its working in flutter.
      - Features of Supabase.
      - Advantages of Supabase.
      - Disadvantages of Supabase.
      - Database in Supabase.
      - Types of authentication in Supabase.
      '''
    ),
        TopicModel(tittle: 'Supabase -Day 5', 
        description: '''
      - create the same project with supabase.
      '''
    ),
      ]),
      WeekModel(name: 'Week 14', 
      topics: [
        TopicModel(tittle: 'Project', 
        description: '''
      - create a project in this week.
      '''
)
      ]),
      WeekModel(name: 'Week 15', 
      topics: [
        TopicModel(tittle: 'Animation -Day 1', 
        description: '''
      - Have a clear idea about animations.
        Eg:- Tween animation, Animated builder, etc.
      - Build Animated Widget
      - Control the Animation
      '''
      ),
        TopicModel(tittle: 'Animation -Day 2', 
        description: '''
      - Create a screen where the size of a 
        container will change
        from low to high and high to low 
        when pressed on a button 
        in an animated way.
      '''
      ),
        TopicModel(tittle: 'Animation -Day 3', 
        description: '''
      - Move a text from left to right and right 
        to left in an animated way.
      - Change the color of a text in 
        an animated way.
      '''
      ),
        TopicModel(tittle: 'Animation -Day 4', 
        description: '''
      - Have a clear idea about localization.
      - Create at least 3 text widgets 
        and user should be
        able to translate those texts into 
        any other language.
        Eg:- Log in => ലോഗിൻ ചെയ്യുക.
      -  Learn  more about  animations
      '''
      ),
      ]),
      WeekModel(
      name: 'Week 16', 
      topics: [
        TopicModel(tittle: 'Rewiew', 
        description: '''
      - Learn All the Topics until now
      '''
 ),
      ])
      
];