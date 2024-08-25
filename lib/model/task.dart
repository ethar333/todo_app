
  // Model class: represent the date that we want to add it to the database:
 // Model => Task:
 
 import 'package:cloud_firestore/cloud_firestore.dart';

class Task{
  
  // attributes of each task:

  String id;
  String title;
  String description;
  DateTime date;                           // date of task:
  bool isDone;

 
  // constructor:

  Task({ this.id ='',
   required this.title,
   required this.description,
   required this.date,
   this.isDone = false 
  
  });


  // map => task  (from Firebase)
 // task => map (To firestore)
 


    // Function => To convert from Map to task (Model class):
   // this Function => Use it when we want to read data From firebasefirestore:
   // named Constructor:  // Function => return object from Task:
    Task.fromJson(Map<String,dynamic> json):this        // call default constructor:
    (

     id: json['id'] as String  ,             // casting to convert from dynamic to string:
     title: json['title'] as String ,
     description: json['description'] as String ,
     date: (json['date'] as Timestamp).toDate() ,       // convert date (as timestamp) to datetime:
     isDone: json['isDone'] as bool

    );   


    // Function => To convert from task to Map(Json):
   // this Function => Use it when we want to send data to firebasefirestore:
    
    Map<String,dynamic> toJson(){

      return {
 
       // key : value (attributes of class)
      
       "id" : id,
       "title" : title,
       "description" : description,
       "date" : Timestamp.fromDate(date),            // convert date (DateTime) to timestamp:
       "isDone" : isDone,


     };

  }
  
}

