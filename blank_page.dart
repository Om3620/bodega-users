// blank_page.dart
import 'package:flutter/material.dart';

class BlankPage extends StatelessWidget {
  const BlankPage({super.key}); // ✅ required for using `const BlankPage()`

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const Center(
        child: Text(
          "This is a blank page",
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}


