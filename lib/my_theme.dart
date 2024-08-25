
// represent theme of App:

import 'package:flutter/material.dart';

class MyThemeData{

  // added all colors of App:

  static const Color primaryLightColor = Color(0xff5D9CEC);
  static const Color whiteColor = Color(0xffFFFFFF);
  static const Color greenColor = Color(0xff61E757); 
  static const Color redColor = Color(0xffEC4B4B); 
  static const Color blackColor = Color(0xff383838); 
  static const Color backgroundLightColor = Color(0xffDFECDB); 
  static const Color greyColor = Colors.grey;
  
  // write anything in Light Theme of App:
  static ThemeData lightTheme = ThemeData(              // object from type themedata:
   
   primaryColor: primaryLightColor,                   // color of light mode:
   
   scaffoldBackgroundColor: backgroundLightColor,    
    appBarTheme: const AppBarTheme(
      backgroundColor: primaryLightColor,           // color of Appbar:
      elevation: 0,
    ),
    
     bottomNavigationBarTheme: const BottomNavigationBarThemeData(

      selectedItemColor: primaryLightColor,       // color of selected items:
      unselectedItemColor: greyColor,
      //backgroundColor: Colors.transparent,

     ),


    
    // To make Style of any Text in any Screen of App:
    textTheme: const TextTheme(              
  
     displayLarge: TextStyle(    
     color: whiteColor,
     fontWeight: FontWeight.bold,
     fontSize: 22,

     ),

     displayMedium: TextStyle(
     color: blackColor,
     fontSize: 18,
     fontWeight: FontWeight.bold,


     ),

     displaySmall: TextStyle(
     color: blackColor,
     fontSize: 18,
     fontWeight: FontWeight.w500,

     ), 


     headlineMedium: TextStyle(
      color: primaryLightColor,
      fontWeight: FontWeight.bold,
      fontSize: 18,

     ),


     headlineSmall: TextStyle(
     color: greenColor,
     fontWeight: FontWeight.bold,
     fontSize: 22,

     ),



    ),


  );




}