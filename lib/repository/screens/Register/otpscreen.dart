import 'package:bodega_delivery/repository/screens/Register/welcomescreen.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5), // White background
      body: Stack(
          children: [
      // Main centered content
      Center(  child:SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Column(
            children: [
              SizedBox(height: 50),
              // Title & Message

                 Column(
                  children: [
                    Text(
                      "Almost there",
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 20),
                    Text(
                      "Please enter the 6-digit code sent to your\nmobile number XXXXXXX19 for verification.",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 16,
                        color: Colors.black54,
                        height: 1.5,
                      ),
                    ),
                  ],
                ),

              SizedBox(height: 40),
          Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
        Text(
        "Enter OTP",
        style: TextStyle(
        fontSize: 22,
        fontWeight: FontWeight.bold,
        color: Colors.black,
        ),
        ),
        SizedBox(height: 20),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List.generate(6, (index) {
        return SizedBox(
        width: 45,
        child: TextField(
        textAlign: TextAlign.center,
        keyboardType: TextInputType.number,
        maxLength: 1,
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        decoration: InputDecoration(
        counterText: "", // Hides length counter
        enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.grey),
        borderRadius: BorderRadius.circular(8),
        ),
        focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Color(0xFF221662)),
        borderRadius: BorderRadius.circular(8),
        ),
        ),
        ),
        );
        }),
        ),
        ],
        ),
        SizedBox(height: 50),


              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 100),
                        pageBuilder: (context, animation, secondaryAnimation) => WelcomeScreen(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(-1.0, 0.0); // Slide from left to right
                          const end = Offset.zero;
                          final tween = Tween(begin: begin, end: end).chain(
                            CurveTween(curve: Curves.easeInOut),
                          );
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Color(0xFF221662),
                    padding: EdgeInsets.symmetric(vertical: 18),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Verify",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),

              SizedBox(height: 30),

              // Resend Text
              Center(
                child: Column(
                  children: [
                    Text.rich(
                      TextSpan(
                        text: "Didn't receive any code? ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black,
                        ),
                        children: [
                          TextSpan(
                            text: "Resend Again",
                            style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Color(0xFF221662),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 6),
                    Text(
                      "Request new code in 00:30s",
                      style: TextStyle(
                        fontSize: 13,
                        color: Colors.grey[600],
                      ),
                    ),

          SizedBox(height: 12),
                    Align(
                      alignment: Alignment.bottomLeft,
                      child: Padding(
                        padding: const EdgeInsets.all(16.0), // space from edges
                        child: CircleAvatar(
                          radius: 22,
                          backgroundColor: Color(0xFF221662),
                          child: Image.asset("assets/images/Vector.png"),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),

        ),
      ),
      ),
  ],
    ),
    );
  }
}
