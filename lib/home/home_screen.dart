
import 'package:flutter/material.dart';
import 'package:to_do_app/home/Task_list/add_task_bottomSheet.dart';
import 'package:to_do_app/home/Task_list/task_list_tab.dart';
import 'package:to_do_app/home/settings/setting_tab.dart';
import 'package:to_do_app/my_theme.dart';

class HomeScreen extends StatefulWidget {
   HomeScreen({super.key});
  
  static const String routeName = 'home_screen';     // routename of this homeScreen:

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  
  int selectedIndex = 0;         // To control selected tab that user clicked it:

  @override
  Widget build(BuildContext context) {
    return Scaffold(
    
    appBar: AppBar(
    
       title: Text('To Do List',
       
       style:Theme.of(context).textTheme.displayLarge ,
       
       ),

    ),


    bottomNavigationBar: BottomNavigationBar(
    
      currentIndex: selectedIndex ,
      
       onTap: (index) {               // index => no.of tab that user clicked it:
        
       selectedIndex = index;
       setState(() {});              // To update UI:
    
      },
    
    

      items: const [
       
       BottomNavigationBarItem(
        icon:ImageIcon(AssetImage('assets/images/icon_list.png'),    // list tab:
        ),
       
       label: 'Task List',
    
        ),
    
    
         BottomNavigationBarItem(
        icon: ImageIcon(AssetImage('assets/images/icon_settings.png'),   // setting tab:
        ),
    
       label: 'Settings',
    
       ),
       
      ]
           
    ),
    

    floatingActionButton: FloatingActionButton(
      backgroundColor: MyThemeData.primaryLightColor,
      onPressed:() {     
        
        addTaskBottomSheet();            // function => To show Bottom sheet:

      },
      
          
      shape: const CircleBorder(               // To make border around Floating action button: 
        side: BorderSide(width: 4, color: MyThemeData.whiteColor),
        
      ),



      child: const Icon(Icons.add,size: 30,color: MyThemeData.whiteColor),


      ),
      
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,

    
     body:tabs[selectedIndex] ,




    );
  }

  List<Widget> tabs = [              // store in it tabs of bottombar:

    TaskListTab(),
    SettingsTab(),


  ];
  
  void addTaskBottomSheet() {

    showModalBottomSheet(                // Method => TO show bottom Sheet:
      context: context, 
      builder:(context)=> AddTaskBottomSheet(),
      
      
    );



  }

}