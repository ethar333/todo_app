
  // This file => contain all Functions that will execute in database(firestore):

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:to_do_app/model/task.dart';

  
 // this Function => is used when we want to add , delete ,update in database(firestore):
  CollectionReference<Task> getTaskCollection(){

    // withConverter => determine the type of collection:
    // withConverter => it Knows FirebaseFirestore type of data that store in collection:
    return FirebaseFirestore.instance.collection('task')  // To Create collection(task) in Firestore:
    .withConverter<Task>(
    fromFirestore: ((Snapshot,Options) => Task.fromJson(Snapshot.data()!)),

    toFirestore: ((task,options) => task.toJson()));
    
  }

 
  // Function => add Task in database:

   Future<void> addTaskToFireStore(Task task){
   
      var collection = getTaskCollection();  // create collection(task) in database:
    
      var docRef = collection.doc();    // create document in collection,(Store document in docRef):
     
      task.id = docRef.id ;            // get Auto generate (Document ID) :

      return docRef.set(task);         // added attributes of task in document:

  
 }


   // Function => delete data (task) from database:

   Future<void> deleteTaskFromFireStore(Task task){

      return getTaskCollection().doc(task.id).delete();


  }



