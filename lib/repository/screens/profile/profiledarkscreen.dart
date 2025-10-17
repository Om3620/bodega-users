import 'dart:async';

import 'package:bodega_delivery/repository/screens/Order/orderhistorydarkscreen.dart';
import 'package:bodega_delivery/repository/screens/bottomnav/bottomnavdarkscreen.dart';
import 'package:bodega_delivery/repository/screens/helpsupport/helpsupportdarkscreen.dart';
import 'package:bodega_delivery/repository/screens/home/homedarkscreen.dart';
import 'package:bodega_delivery/repository/screens/location/deliveryadddarkscreen.dart';
import 'package:bodega_delivery/repository/screens/payment/paymentdark.dart';
import 'package:bodega_delivery/repository/screens/payment/walletpaymentdarkscreen.dart';
import 'package:bodega_delivery/repository/screens/personalpref/personalprefdarkscreen.dart';
import 'package:bodega_delivery/repository/screens/profile/acc_overviewdark.dart';
import 'package:flutter/material.dart';

import '../../widgets/uihelper.dart';
import '../cart/cartscreen.dart';
import '../helpsupport/helpsupportscreen.dart';
import '../location/deliveryadd.dart';
import '../payment/payment.dart';
import '../personalpref/personalprefscreen.dart';
import 'acc_overview.dart';
class ProfileDarkScreen extends StatefulWidget {
  @override
  _ProfileDarkScreenState createState() => _ProfileDarkScreenState();
}

class _ProfileDarkScreenState extends State<ProfileDarkScreen> {
    final List<String> options = [
    "Account Overview",
    "Delivery Address",
    "Order History & Reorders",
    "Wallet & Payments",
    "Help & Support",
    "Personal Preferences",
  ];

  final List<Widget> screens = [
    AccOverviewDarkScreen(),
    DeliveryAddDarkScreen(),
    OrderHistoryReorderDarkScreen(),
    WalletPaymentDarkScreen(),
    HelpSupportDarkScreen(),
    PersonalPrefDarkScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top Logo + Avatar
              Stack(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.only(top: 30),
                      child: UiHelper.CustomText(
                        text: "BOdega",
                        color: Colors.white,
                        fontweight: FontWeight.bold,
                        fontsize: 20,
                        fontfamily: "bold",
                      ),
                    ),
                  ),
                  Padding(
                    padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 22),
                    child: CircleAvatar(
                      backgroundColor: Color(0XFF544F94),
                      child: Icon(Icons.person, size:30,color: Colors.black),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 30),

              // User Profile Title
              Text(
                "User Profile",
                style: TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),

              const SizedBox(height: 20),

              // Expanded List of Options
              Expanded(
                child: ListView.builder(
                  itemCount: options.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.only(bottom: 12),
                      child: InkWell(
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => screens[index],
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          padding: EdgeInsets.symmetric(
                              vertical: 16, horizontal: 16),
                          decoration: BoxDecoration(
                            color: Color(0XFF353535),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            options[index],
                            style: TextStyle(fontSize: 18,color:Colors.white),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Back Button at Bottom
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageRouteBuilder(
                        transitionDuration: Duration(milliseconds: 100),
                        pageBuilder: (context, animation, secondaryAnimation) => BottomNavDarkScreen(),
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
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Back",
                    style: TextStyle(
                      fontSize: 18,
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
