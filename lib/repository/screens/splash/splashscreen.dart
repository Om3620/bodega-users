import 'dart:async';

import 'package:bodega_delivery/domain/constants/appcolors.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

import '../Register/otpscreen.dart';
import '../Register/signup.dart';
import '../Register/welcomescreen.dart';
import '../bottomnav/bottomnavscreen.dart';


class SplashScreen extends StatefulWidget{
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 7),(){
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: Duration(milliseconds: 100),
          pageBuilder: (_, __, ___) => SignUpScreen(),
          transitionsBuilder: (_, animation, __, child) {
            const begin = Offset(1.0, 0.0); // Start from right
            const end = Offset.zero;
            const curve = Curves.easeInOut;

            var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
            return SlideTransition(position: animation.drive(tween), child: child);
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF221662),
      body: SizedBox.expand( // Makes the child take the full available space
        child: Image.asset(
          "assets/images/bodega.gif",
          fit: BoxFit.cover, // Cover entire screen
        ),
      ),
    );
  }

}