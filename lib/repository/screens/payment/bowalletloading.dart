import 'dart:async';
import 'dart:ui'; // 👈 For ImageFilter.blur
import 'package:flutter/material.dart';
import 'package:bodega_delivery/repository/screens/payment/walletmoneyaddcomplete.dart';

class BOWalletLoadingScreen extends StatefulWidget {
  @override
  State<BOWalletLoadingScreen> createState() => _BOWalletLoadingScreenState();
}

class _BOWalletLoadingScreenState extends State<BOWalletLoadingScreen> {
  bool showUnderlineOnB = true;
  late Timer _timer;

  @override
  void initState() {
    super.initState();

    // Switch underline every 400ms
    _timer = Timer.periodic(const Duration(milliseconds: 400), (timer) {
      setState(() {
        showUnderlineOnB = !showUnderlineOnB;
      });
    });

    // Navigate after 5 seconds
    Future.delayed(const Duration(milliseconds: 5000), () {
      Navigator.push(
        context,
        PageRouteBuilder(
          transitionDuration: const Duration(milliseconds: 500),
          pageBuilder: (_, __, ___) => WalletMoneyCompletedScreen(),
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            final offsetAnimation = Tween<Offset>(
              begin: const Offset(0.0, 0.1),
              end: Offset.zero,
            ).animate(CurvedAnimation(
              parent: animation,
              curve: Curves.easeOut,
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
      body: Stack(
        fit: StackFit.expand,
        children: [
          // 🔹 Background Image
          Image.asset(
            "assets/images/bowallet.png", // 👈 Put your image here
            fit: BoxFit.cover,
          ),

          // 🔹 Blur Layer
          BackdropFilter(
            filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10), // 👈 Blur strength
            child: Container(
              color: Colors.black.withOpacity(0.2), // Optional dark overlay
            ),
          ),

          // 🔹 BO Animation Content
          Center(
            child: Row(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "B",
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF221662),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: 25,
                      height: 3,
                      color: showUnderlineOnB
                          ? const Color(0xFF221662)
                          : Colors.transparent,
                    ),
                  ],
                ),
                const SizedBox(width: 4),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      "O",
                      style: const TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF221662),
                      ),
                    ),
                    AnimatedContainer(
                      duration: const Duration(milliseconds: 300),
                      curve: Curves.easeInOut,
                      width: 25,
                      height: 3,
                      color: showUnderlineOnB
                          ? Colors.transparent
                          : const Color(0xFF221662),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
