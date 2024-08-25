
import 'package:flutter/material.dart';
import 'package:to_do_app/firebase_utils.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/my_theme.dart';

 // Widget => is responsible for the components that will displayed in bottomSheet:

 class AddTaskBottomSheet extends StatefulWidget {
   AddTaskBottomSheet({super.key});

  @override
  State<AddTaskBottomSheet> createState() => _AddTaskBottomSheetState();
}

class _AddTaskBottomSheetState extends State<AddTaskBottomSheet> {
  
   String title = '';                  // To Store in it the title that user enter it:
   String description = '';

   var formKey = GlobalKey<FormState>();       // Key of form widget:     

  DateTime selectedDate = DateTime.now();     // To control in seleted date from calender:


  @override
  Widget build(BuildContext context) {
    return Container(
    margin: const EdgeInsets.all(15),

    width: double.infinity,
    height: double.infinity,
   
    child: Column(

       crossAxisAlignment: CrossAxisAlignment.stretch,

      children: [

       Text('Add new Task',
       
       style: Theme.of(context).textTheme.displayMedium,
       textAlign: TextAlign.center,                // To make text in center:

       ),

     const SizedBox(height: 18),
       
       Form(

         key: formKey,                             // ref. on the form:

        child: Column(
          children: [
         
         TextFormField(
        

          onChanged: (value) {         // value => value that user enter it:
            
           title = value;

          },


          // way of validation:
           validator: (value) {              // value => value that user enter it:
           
          if( value == null || value.isEmpty){

            return 'Please enter task title';       // return this when textfield is empty:    

          }
           
           return null;                           // validate:
 
         },

         
         decoration: const InputDecoration(
           hintText: 'Enter task title',

         ),

         ),

          const SizedBox(height: 18),

          TextFormField(
           
          onChanged:(value) {
            
          description = value;


          },

           // way of validation:
           validator: (value) {
            
            if(value == null || value.isEmpty){

            return 'Please enter task description';       // invalid:

            }
         
             return null;                   // valid:
         
          },

         decoration: const InputDecoration(
           hintText: 'Enter task description',

         ),

         minLines: 4,                    // lines of description:
         maxLines: 4,

         ),
         

        ],
        ),  
        
      ),
        

        const SizedBox(height: 18,),


         Text('Select Date',
         
         style: Theme.of(context).textTheme.displayMedium ,
         
         ),

         const SizedBox(height: 18),

         GestureDetector(
          onTap: () {
            
           chooseDate();                         // To Show calender:
         

          },
           child: Text('${selectedDate.month}/${selectedDate.day}/${selectedDate.year}',
           
           style:Theme.of(context).textTheme.displaySmall ,
           textAlign: TextAlign.center,
           
           ),
         ),
   
         const SizedBox(height: 18),
       
       ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: MyThemeData.primaryLightColor,
        ),

        onPressed:() {
          

         addTask();              // call Function To add Task:


        },

         child:Text('Add',
         
         style: Theme.of(context).textTheme.displayLarge,
         
      ),
                 
         
      ),

      ],
    ),

    );

  }

   // Function => To Show Calender:
  
  void chooseDate() async{

    var choosenDate = await showDatePicker(    // Method => responsible for showing calender:
            context: context, 
            initialDate: selectedDate ,
            firstDate: DateTime.now() , 
            lastDate: DateTime.now().add(const Duration(days: 365)),
      
      );

    
   if(choosenDate != null){          // In case we choose a date:

    selectedDate = choosenDate;
    setState(() {});

    }

  }
  
    void addTask() {

       if(formKey.currentState?.validate() == true){   // To make validate on 2 textfield:
        
          // Validate    add Task:
       
          
          Task task = Task(                 // object from class(Task):
          title: title, 
          description: description, 
          date: selectedDate,       // to convert to int:
          
          );


         addTaskToFireStore(task).then((value){ 

          Navigator.of(context).pop();          // to remove bottomSheet:

         }) ;
         
         
         
         /*
         timeout(     

          const Duration(milliseconds: 500),       // use this function => LocalStorge:
          onTimeout: (){

          Navigator.pop(context);                // to remove bottomSheet:

          }

         );*/
         
         
 
    }

  }

}


