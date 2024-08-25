
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/model/task.dart';
import 'package:to_do_app/my_theme.dart';
import 'package:to_do_app/providers/list_provider.dart';

 class UpdateTaskScreen extends StatefulWidget {
   UpdateTaskScreen ({super.key});

   static const String routeName = 'update_screen';     // routeName of this screen:

  @override
  State<UpdateTaskScreen> createState() => _UpdateTaskScreenState();
}

class _UpdateTaskScreenState extends State<UpdateTaskScreen> {

   var formKey = GlobalKey<FormState>();           // Key of form widget:     

  String title = '';
  String description = '';

  DateTime selectedDate = DateTime.now();        // To control in seleted date from calender:


  @override
  Widget build(BuildContext context) {

    var provider = Provider.of<ListProvider>(context);     // object from provider:
 
     // args => object from Task:
    Task args = ModalRoute.of(context)!.settings.arguments as Task;   // receive data:


    return Scaffold(

     body:SingleChildScrollView(
       child: Column(
         
         children: [
          Stack(
        children: [
         
          AppBar(
         title: Text('To Do List',
          
          style:Theme.of(context).textTheme.displayLarge,
         
         ),
        
        ),
        
         Container(

         padding: const EdgeInsets.all(20),
              
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 80,
          ),
              
          decoration:BoxDecoration(
              
           color: MyThemeData.whiteColor,
           borderRadius: BorderRadius.circular(20),
              
          ) ,
         
              
         child: Column(
              
         crossAxisAlignment: CrossAxisAlignment.stretch,
              
               children: [
              
         Text('Edit Task',
         
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
              
             args.title = value;        // To update title of task:

            },
              
              
            // way of validation:
             validator: (value) {              // value => value that user enter it:
             
            if( value == null || value.isEmpty){
              
              return 'Please enter task title';       // return this when textfield is empty:    
              
            }
             
             return null;                           // validate:
               
           },
              
           
           decoration:  InputDecoration(
             hintText: '${args.title}',
            
            hintStyle: Theme.of(context).textTheme.displayMedium,


           ),
              
           ),
              
            const SizedBox(height: 18),
              
            TextFormField(
             
            onChanged:(value) {
              
               args.description = value;             // To update description of task: 
              
              
            },
              
             // determine way of validation:
             validator: (value) {
              
              if(value == null || value.isEmpty){
              
              return 'Please enter task description';       // invalid:
              
              }
           
               return null;                   // valid:
           
            },
              
           decoration:  InputDecoration(
             hintText: '${args.description}',
            hintStyle: Theme.of(context).textTheme.displayMedium,
              
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
              
                chooseDate(args);                            // To Show calender:
           
              
            },
            

             child: Text('${args.date.month}/${args.date.day}/${args.date.year}}',

             style:Theme.of(context).textTheme.displaySmall!.copyWith(
              color: Colors.grey,
             ) ,
             textAlign: TextAlign.center,
             
             ),
           ),
          
           const SizedBox(height: 18),
         
         ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: MyThemeData.primaryLightColor,
          ),
              
          onPressed:() {
            
            // To make validate on 2 textfield:
           // To make sure that user enter data in text field:

            if(formKey.currentState!.validate() == true){
  
             // call Function To Update Task in database: 
            // Timeout() => Use it Local Storage:
             provider.updateTaskAtFireStore(args).then((value){

                Navigator.pop(context);

             });
             
             /*timeout(  

              const Duration(milliseconds: 500),
              onTimeout: () {
                
               provider.getAllTaskFromFireStore();   // To update data in list of tasks:
               Navigator.pop(context);              // To return original screen:
                  

              },

             ) ;  */

            }

              
          },
              
           child:Text('Save Changes',
           
           style: Theme.of(context).textTheme.displayLarge,
           
               ),
                   
           
            ),
          
           ],
           
           ),
              
              
           ),
        
        
        ],

       ),
              
     ],

    ),

    ),

    );
 

  }

   
     // Function => To show Calender:

   void chooseDate(Task task) {

    var choosenDate =  showDatePicker(    // Method => responsible for showing calender:
            context: context, 
            initialDate: task.date ,         // date of task:
            firstDate: DateTime.now() , 
            lastDate: DateTime.now().add(const Duration(days: 365)),
      
      ).then((value) => {        // value => that return from this function: 
      
        task.date = value ?? task.date,         // condational operator:
        
       setState(() {}),

        

      });

    
  /* if(choosenDate != null){          // In case we choose a date:

    selectedDate = choosenDate;
    setState(() {});

    }*/

  }








}