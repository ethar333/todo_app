
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:to_do_app/firebase_options.dart';
import 'package:to_do_app/home/Task_list/update_task.dart';
import 'package:to_do_app/home/home_screen.dart';
import 'package:to_do_app/my_theme.dart';
import 'package:to_do_app/providers/list_provider.dart';
import 'package:to_do_app/splash_screen.dart';


  void main() async{                            
   WidgetsFlutterBinding.ensureInitialized();          // To Connect this project with firebase:
  await Firebase.initializeApp(
   options: DefaultFirebaseOptions.currentPlatform,

  );                    

   runApp(ChangeNotifierProvider(                 // wrap App with provider:
    
    create: (context) => ListProvider(),

    child: const ToDoApp()));

 }

 class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,

    initialRoute:HomeScreen.routeName,
   
    routes:{
    SplashScreen.routeName : (context) => SplashScreen(),
    HomeScreen.routeName : (context) => HomeScreen(),
    UpdateTaskScreen.routeName : (context) => UpdateTaskScreen(),

    } ,


    theme: MyThemeData.lightTheme,           // Light Mode:


    );



  }
}
     