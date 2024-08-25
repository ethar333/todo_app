
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/firebase_utils.dart';
import 'package:to_do_app/model/task.dart';

  
  // provider => to change list of tasks when add new task:


 class ListProvider extends ChangeNotifier{


   List<Task> taskList = [];       // To store in it list of docs that received from firestore:
   DateTime selectedDate = DateTime.now();       // To store in it date that will be selected:

   // Function => To Read Tasks(data) from database:
   // Function => get All tasks from Firestore:
   getAllTaskFromFireStore()async{
  
    // collection:
   // get() => get all data that existed in collection (task):

   QuerySnapshot<Task> querySnapshot = await getTaskCollection().get();

    taskList = querySnapshot.docs.map((doc) {
    
   return doc.data();                 // data of type task:

   }).toList();                      // map => return list of tasks:


 
    // filter List depend on selected date:

     taskList = taskList.where((task) {

     // convert date of task from int to datetime:
     DateTime dateTime = task.date; 

     if(selectedDate.day == dateTime.day &&
        selectedDate.month == dateTime.month &&
        selectedDate.year == dateTime.year ){

         return true;

        }

        return false;

    }).toList();                  // where => return filtered list:
   


      // todo Sort task list (date):

     taskList.sort((Task task1 , Task task2){

       // convert date of task1, task2 to DateTime:
       DateTime dateTime1 = task1.date;
       DateTime dateTime2 = task2.date;
       
       return dateTime1.compareTo(dateTime2);  // compare date of task1 with date of task2:

      });


      notifyListeners();
  

  }


  // function => change the date:
   
    void ChangeSelectedDate (DateTime newDate){

     selectedDate = newDate;

      notifyListeners(); 


    }

  // Function => To Update data in database(fireStore):
  
     Future<void> updateTaskAtFireStore(Task task){

      return getTaskCollection().doc(task.id).update({

          // fields that we want update in it:
          // Key : value 
          
          'id' : task.id,
          'title' : task.title,
          'description' : task.description,
          'date' : Timestamp.fromDate(task.date),       // convert date to timestamp:
          'isDone' : task.isDone,

         });
        

      }


   // Function => To Update isDone in database(fireStore):
    
    Future<void> updateIsDoneAtFireStore(Task task){

    return getTaskCollection().doc(task.id).update({
      
      // Map => Key : value 

      'isDone' : true             // update isDone in database:
 
    });


    }

 
}



  
