
import 'package:flutter/material.dart';
import 'package:to_do_app/home/home_screen.dart';
import 'package:to_do_app/splash_screen.dart';

void main() {
  runApp(const ToDoApp());
}

class ToDoApp extends StatelessWidget {
  const ToDoApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    debugShowCheckedModeBanner: false,

    initialRoute:SplashScreen.routeName,
   
    routes:{
    SplashScreen.routeName : (context) => SplashScreen(),
    HomeScreen.routeName : (context) => HomeScreen(),

    } ,


    );



  }
}
     