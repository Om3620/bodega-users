import 'package:bodega_delivery/repository/screens/home/homescreen.dart';
import 'package:bodega_delivery/repository/screens/location/orderstatusscreen.dart';
import 'package:flutter/material.dart';

class PaymentCompletedScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16),
            child: Column(
              children: [
                // Top Title
              Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child:Text(
                  "Bodega",
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
              ),
              ),
                const SizedBox(height: 20),

                // BO text
                Text(
                  "BO",
                  style: TextStyle(
                    fontSize: 100,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF221662),
                  ),
                ),
                const SizedBox(height: 8),

                // Subtitle
                Text(
                  "Payment Completed",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                    color: Color(0xFF221662),
                  ),
                ),
                const SizedBox(height: 16),

                // Amount
                Text(
                  "₹299",
                  style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                  ),
                ),
                const SizedBox(height: 20),

                // Message
                Container(
                  padding: EdgeInsets.symmetric(vertical: 10, horizontal: 16),
                  decoration: BoxDecoration(
                    color: Color(0xFFE8E0EC),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Text(
                    "Your Order will Reach you soon",
                    style: TextStyle(
                      fontSize: 18,
                      color: Color(0XFF544F94),
                    ),
                  ),
                ),
                const SizedBox(height: 40),
Spacer(),
            // Buttons
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 100),
                        pageBuilder: (context, animation, secondaryAnimation) =>HomeScreen(),
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
                    fixedSize: Size(170, 50), // width = 120, height = 50
                    backgroundColor: Color(0XFF221662),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),

                  child: Text("Done",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold, // optional (text ko mota karne ke liye)
                      color: Colors.white, // optional (text color)
                    ),
                  ),
                ),


                SizedBox(
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 100),
                          pageBuilder: (context, animation, secondaryAnimation) =>OrderStatusScreen(),
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
                      fixedSize: Size(170,50), // width = 120, height = 50
                      backgroundColor: Color(0XFFFFFFFF),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:Text("Track Order",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold, // optional (text ko mota karne ke liye)
                        color: Colors.black87, // optional (text color)
                      ),
                    ),
                  ),
                ),
                  ],
                ),
            ],
        ),
        ),
        ),
    );
  }
}
