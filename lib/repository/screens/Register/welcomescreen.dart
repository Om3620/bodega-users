import 'dart:async';
import 'package:flutter/material.dart';

import '../bottomnav/bottomnavscreen.dart';

class WelcomeScreen extends StatefulWidget {
  @override
  _WelcomeScreenState createState() => _WelcomeScreenState();
}

class _WelcomeScreenState extends State<WelcomeScreen> {
  @override
  void initState() {
    super.initState();
    Timer(const Duration(milliseconds: 500), () { // Delay before navigation
      Navigator.pushReplacement(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 1500), // Animation duration
          pageBuilder: (_, __, ___) => BottomNavScreen(),
          transitionsBuilder: (_, animation, __, child) {
            return FadeTransition(
              opacity: animation, // simple fade in/out
              child: child,
            );
          },
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0XFF221662),
      body: SizedBox.expand(
        child: Image.asset(
          "assets/images/Welcome.png",
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}
