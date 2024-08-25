
import 'package:calendar_timeline/calendar_timeline.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/firebase_utils.dart';
import 'package:to_do_app/home/Task_list/item_task_list_Widget.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/my_theme.dart';
import 'package:to_do_app/providers/list_provider.dart';

  // widget => responsible for body of taskList tab , that displayed in the body of scaffold:

 class TaskListTab extends StatefulWidget {
    TaskListTab({super.key});

  @override
  State<TaskListTab> createState() => _TaskListTabState();
}

class _TaskListTabState extends State<TaskListTab> {
 
 // List<Task> taskList = [];       // To store in it list of docs that received from firestore:

 // DateTime selectedDate = DateTime.now();       // To store in it date that will be selected:

  @override
  Widget build(BuildContext context) {
   
     var listProvider = Provider.of<ListProvider>(context);    // object from provider:
    
     listProvider.getAllTaskFromFireStore();


    return Container(

       child: Column(

       children: [
               CalendarTimeline(
                 initialDate: listProvider.selectedDate,            // date of now:
                 firstDate: DateTime.now().subtract(Duration(days: 365)),
                 lastDate: DateTime.now().add(Duration(days: 365)),

               // Function => To be executed when clicked on the date:
              // data => the date that clicked on it:
                 onDateSelected: (date) {
                 
                   listProvider.ChangeSelectedDate(date);
                 }, 

                  leftMargin: 20,
                  monthColor: MyThemeData.blackColor,
                  dayColor: MyThemeData.blackColor,
                  activeDayColor: Colors.white,
                  activeBackgroundDayColor: MyThemeData.primaryLightColor,
                  dotColor: MyThemeData.whiteColor,
                  selectableDayPredicate: (date) => true,
                   locale: 'en_ISO',      // English:
            ),
        

           Expanded(
            child: ListView.builder(
              itemBuilder: (context,index){
            
              return ItemTaskListWidget(task:listProvider.taskList[index]);     // return the Item that displayed in the listView:
            
            
             },
              
              
              itemCount: listProvider.taskList.length,
              
          ),
          
        ),

       ],

   ),

  );

 }
  

  // Function => To Read Tasks(data) from database:
  /* getAllTaskFromFireStore()async{
  
    // collection:
   // get() => get all data that existed in collection (task):

   QuerySnapshot<Task> querySnapshot = await getTaskCollection().get();

    taskList = querySnapshot.docs.map((doc) {
    
   return doc.data();                 // data of type task:

   }).toList();                      // map => return list of tasks:


 
    // filter List depend on selected date:

     taskList = taskList.where((task) {

     // convert date of task from int to datetime:
     DateTime dateTime = DateTime.fromMillisecondsSinceEpoch(task.date); 

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
       DateTime dateTime1 = DateTime.fromMillisecondsSinceEpoch(task1.date);
       DateTime dateTime2 = DateTime.fromMillisecondsSinceEpoch(task1.date);
       
       return dateTime1.compareTo(dateTime2);  // compare date of task1 with date of task2:

      });


      
     setState(() {});                 // To update UI :




  }*/


}

