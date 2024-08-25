
import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/firebase_utils.dart';
import 'package:to_do_app/home/Task_list/update_task.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/my_theme.dart';
import 'package:to_do_app/providers/list_provider.dart';

 // widget => responsible for container Task:

 class ItemTaskListWidget extends StatelessWidget {
   ItemTaskListWidget({super.key,required this.task});

  Task task;             // object from Task:

  @override
  Widget build(BuildContext context) {

     var provider = Provider.of<ListProvider>(context);         // object from provider:

    return Container(           // To make margin from left:

      margin: const EdgeInsets.only(left: 18),

      child: Slidable(                // To make slidable action:
      
       // The start action pane is the one at the left or the top side.
       startActionPane: ActionPane(        // show from left:
         // A motion is a widget used to control how the pane animates.
        motion: const ScrollMotion(),
        extentRatio: 0.25,             // To control in size of slidable action:
      
      // All actions are defined in the children parameter.
       children: [
        
        // A SlidableAction can have an icon and/or a label.
        
        SlidableAction(
        
          borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(20),
          bottomLeft: Radius.circular(20)
        
          ),
        
          onPressed: (context){
        
           // To delet task from database:
            deleteTaskFromFireStore(task).timeout(
              const Duration(seconds: 500),
              onTimeout:(){
               
                print('Task was deleted Successfully');

              }

            );    
        
          },
        
          backgroundColor: MyThemeData.redColor,
          foregroundColor: Colors.white,
          icon: Icons.delete,
          label: 'Delete',
        ),
       
      
      ],
      
      ),
      
      
      
        child: GestureDetector(

            onTap: () {
              
             Navigator.of(context).pushNamed(UpdateTaskScreen.routeName,
             arguments: task,
              
             );

            },

          child: Container( 
           
           margin: const EdgeInsets.all(12),
           padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
            decoration:  BoxDecoration(
            color: MyThemeData.whiteColor,
            borderRadius: BorderRadius.circular(18),
          
            ),
          
            child: Row(
             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  
              children: [
                  
            Container(
             height: 60,
             width: 4,
             decoration:  BoxDecoration(

              color: task.isDone? MyThemeData.greenColor      // if isDone is True:
              
               :                // else:
              
               MyThemeData.primaryLightColor,

             ),
                  
              ),
               
                  
                  
             Column(
                children: [
                  
                 Text(task.title,
                 
                  style: task.isDone? Theme.of(context).textTheme.headlineSmall     // if isdone is True:

                   :
                  
                   Theme.of(context).textTheme.headlineMedium,
                 
                 ),
                  
                 const SizedBox(height: 8),
                  
                 Text(task.description,
                  
                 style: task.isDone? Theme.of(context).textTheme.headlineSmall   // if isDone is true:

                 :                         // else:
                 
                 Theme.of(context).textTheme.displayMedium,
                 
                 ),
                  
                ],
              ),
                  
              
              
             GestureDetector(

             onTap: () {

              if(!task.isDone)
              {

               // Update isDone in database:
                provider.updateIsDoneAtFireStore(task).timeout(
                const Duration(milliseconds: 500),    // After half second execute a specific action:
                onTimeout: () {
                 
                 provider.getAllTaskFromFireStore();       // To update data in list of tasks:


               },

              ) ;              

              }               

             },

               // condational operator:
               child: task.isDone? Text('Done!',           // if task isDone(True):
               
                style: Theme.of(context).textTheme.headlineSmall,

               )

               :               // else (if not isDone):
               
               Container(
               padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 20),
               decoration: BoxDecoration(
               
               borderRadius: BorderRadius.circular(15),
               color: MyThemeData.primaryLightColor,
               
               ),
               
               child: const Icon(Icons.check,size: 40,color: MyThemeData.whiteColor,),
                    
                    
               ),
             ),
                  
                  
            ],
                   
            ),
          ),
        ),
      ),
    );


  }
}

