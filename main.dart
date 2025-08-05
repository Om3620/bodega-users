import 'package:flutter/material.dart';
import 'signup.dart'; // Make sure the file name matches

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const SignUpPage(), // Start from signup page
    );
  }
}

