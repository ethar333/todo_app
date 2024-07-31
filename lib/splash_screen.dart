
import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:to_do_app/home/home_screen.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});
  
   static const String routeName = 'splash_screen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(

     body: AnimatedSplashScreen(
      splashIconSize: double.infinity,
      splashTransition: SplashTransition.rotationTransition,
      animationDuration: const Duration(seconds: 3),

      splash: Image.asset('assets/images/splash@3x.png',
       height: double.infinity,
       width: double.infinity,
       fit: BoxFit.cover              

      ), 

      nextScreen: HomeScreen(),
          
      ),


    );


  }
}