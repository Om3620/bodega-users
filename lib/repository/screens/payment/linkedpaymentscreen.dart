import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class LinkedPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              children: [
                Column(
                  children: [
                    SizedBox(height: 30),
                    Center(
                      child: UiHelper.CustomText(
                        text: "BOdega",
                        color: Color(0XFF000000),
                        fontweight: FontWeight.bold,
                        fontsize: 20,
                        fontfamily: "bold",
                      ),
                    ),
                  ],
                ),


                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 300),
                        pageBuilder: (context, animation, secondaryAnimation) => ProfileScreen(),
                        transitionsBuilder: (context, animation, secondaryAnimation, child) {
                          const begin = Offset(-1.0, 0.0); // From right
                          const end = Offset.zero;
                          final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
                          return SlideTransition(
                            position: animation.drive(tween),
                            child: child,
                          );
                        },
                      ),
                    );
                  },
                  child:Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 22),

                    child: CircleAvatar(
                      radius: 18,
                      backgroundColor: Color(0XFF544F94),
                      child: Icon(Icons.person, color: Colors.white),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            const Text(
              "Linked payments",
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Payment Method 1
            GestureDetector(
              onTap: () {

              },
              child: _buildPaymentCard(
                title: "Bodega",
                subtitle: "1234567890@ybl\nPhonepe",
                status: "Connected",
              ),
            ),

            // Payment Method 2
            GestureDetector(
              onTap: () {
              },
              child: _buildPaymentCard(
                title: "Bodega Debit Card",
                subtitle: "XXXX XXXX 2025\nABC Bank",
                status: "Connected",
              ),
            ),

            // Add New Method
            GestureDetector(
              onTap: () {

              },
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                margin: const EdgeInsets.only(bottom: 12),
                decoration: BoxDecoration(
                  color: Color(0XFFE8E8F2),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Add New Method",
                  style: TextStyle(fontSize: 16, color: Color(0XFF544F94)),
                ),
              ),
            ),

            const Spacer(),

            // Back Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0XFF221662),
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Back",
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPaymentCard({
    required String title,
    required String subtitle,
    required String status,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: Color(0XFFE8E8F2),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(title,
                    style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:Color(0XFF544F94),)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 14,color:Color(0XFF544F94),)),
              ],
            ),
          ),
          Text(
            status,
            style: const TextStyle(fontSize: 14, color: Colors.green),
          ),
        ],
      ),
    );
  }
}
