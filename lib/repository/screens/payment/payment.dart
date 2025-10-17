import 'package:bodega_delivery/repository/screens/payment/boUiScreen.dart';
import 'package:flutter/material.dart';

class PaymentScreen extends StatefulWidget {
  PaymentScreen(String address);

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  int selectedMethod = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFFFFFFF),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Bodega",
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Text(
                "Payment",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),

              // Payment Options
              buildPaymentOption(
                title: "Bodega Debit Card",
                subtitle: "XXXX XXXX 2025\nABC Bank",
                index: 0,
              ),
              buildPaymentOption(
                title: "Bodega",
                subtitle: "1234567890@ybl\nPhonepe",
                index: 1,
              ),
              buildPaymentOption(
                title: "Cash On Delivery",
                subtitle: "",
                index: 2,
              ),

              Spacer(),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      fixedSize: Size(120, 50), // width = 120, height = 50
                      backgroundColor: Color(0XFFDFE0E2),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () {
                      Navigator.pop(context);
                    },

                    child: Text("Back",
                      style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold, // optional (text ko mota karne ke liye)
                      color: Colors.black, // optional (text color)
                    ),),
                  ),


    SizedBox(
      child: ElevatedButton(
         onPressed: () {
             Navigator.push(
                context,
                   PageRouteBuilder(
                       transitionDuration: Duration(milliseconds: 100),
                          pageBuilder: (context, animation, secondaryAnimation) => BOAnimationScreen(),
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
                      fixedSize: Size(230,50), // width = 120, height = 50
                      backgroundColor: Color(0XFF221662),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child:Text("Next",
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold, // optional (text ko mota karne ke liye)
                        color: Colors.white, // optional (text color)
                      ),
                    ),
                  ),
    ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  Widget buildPaymentOption({
    required String title,
    required String subtitle,
    required int index,
  }) {
    return GestureDetector(
      onTap: () {
        setState(() {
          selectedMethod = index;
        });
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 8),
        padding: EdgeInsets.all(12),
          decoration: BoxDecoration(
          color: Colors.purple[50],
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF544F94),
                    ),
                  ),
                  if (subtitle.isNotEmpty)
                    Text(
                      subtitle,
                      style: TextStyle(fontSize:16,color: Color(0XFF544F94)),
                    ),
                ],
              ),
            ),
            Radio(
              value: index,
              groupValue: selectedMethod,
              onChanged: (val) {
                setState(() {
                  selectedMethod = val!;
                });
              },
              activeColor: Color(0XFF221662),
            )
          ],
        ),
      ),
    );
  }
}
