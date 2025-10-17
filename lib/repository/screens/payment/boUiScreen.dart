import 'dart:async';
import 'package:bodega_delivery/repository/screens/payment/paymentcompletedscreen.dart';
import 'package:flutter/material.dart';

class BOAnimationScreen extends StatefulWidget {
  @override
  State<BOAnimationScreen> createState() => _BOAnimationScreenState();
}

class _BOAnimationScreenState extends State<BOAnimationScreen> {
  bool showUnderlineOnB = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Switch underline every 300ms
    _timer = Timer.periodic(Duration(milliseconds: 400), (timer) {
      setState(() {
        showUnderlineOnB = !showUnderlineOnB;
      });
    });

    Future.delayed(const Duration(milliseconds: 5000), () {

      Navigator.push(
          context,
          PageRouteBuilder(
            transitionDuration: const Duration(milliseconds: 500), // Figma: 500ms
            pageBuilder: (_, __, ___) => PaymentCompletedScreen(),
            transitionsBuilder: (context, animation, secondaryAnimation, child) {
              // Smart Animate effect with fade + slide
              final offsetAnimation = Tween<Offset>(
                begin: const Offset(0.0, 0.1), // Slight slide up
                end: Offset.zero,
              ).animate(CurvedAnimation(
                parent: animation,
                curve: Curves.easeOut, // Figma: Ease Out
              ));

              return FadeTransition(
                opacity: animation,
                child: SlideTransition(
                  position: offsetAnimation,
                  child: child,
                ),
              );
            },
              ),
          );
      });
  }


  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Row(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "B",
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF221662),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 25,
                  height: 3,
                  color: showUnderlineOnB ? Color(0xFF221662) : Color(0XFFFFFFFF),
                ),
              ],
            ),
            SizedBox(width: 4),
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "O",
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF221662),
                  ),
                ),
                AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  curve: Curves.easeInOut,
                  width: 25,
                  height: 3,
                  color: showUnderlineOnB ? Color(0XFFFFFFFF) : Color(0xFF221662),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

