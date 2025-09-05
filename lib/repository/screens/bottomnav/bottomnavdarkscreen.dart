import 'package:bodega_delivery/repository/screens/BOassistant/BOassistantdarkscreen.dart';
import 'package:bodega_delivery/repository/screens/cart/cartdarkscreen.dart';
import 'package:bodega_delivery/repository/screens/category/categorydarkscreen.dart';
import 'package:bodega_delivery/repository/screens/category/categoryscreen.dart';
import 'package:bodega_delivery/repository/screens/home/homedarkscreen.dart';
import 'package:bodega_delivery/repository/screens/home/homescreen.dart';
import 'package:bodega_delivery/repository/screens/location/deliverylocdarkscreen.dart';
import 'package:bodega_delivery/repository/screens/payment/boUiScreen.dart';
import 'package:bodega_delivery/repository/screens/payment/payment.dart';
import 'package:bodega_delivery/repository/screens/vendors/vendordarkscreen.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import '../BOassistant/BOassitantScreen.dart';
import '../cart/cartscreen.dart';
import '../location/deliverylocscreen.dart';
import '../vendors/vendorscreen.dart';

class BottomNavDarkScreen extends StatefulWidget {
  @override
  State<BottomNavDarkScreen> createState() => _BottomNavDarkScreenState();
}

class _BottomNavDarkScreenState extends State<BottomNavDarkScreen> {
  int currentIndex1 = 0;
  int previousIndex1 = 0;

  final List<Widget> pages1 = [
    HomeDarkScreen(),
    CategoryDarkScreen(),
    BOassistantDarkScreen(),
    VendorDarkScreen(),
    CartDarkScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation, secondaryAnimation) {
          final isRTL = currentIndex1 > previousIndex1;
          final beginOffset = isRTL ? Offset(1.0, 0.0) : Offset(-1.0, 0.0);

          return SlideTransition(
            position: animation.drive(
              Tween<Offset>(begin: beginOffset, end: Offset.zero)
                  .chain(CurveTween(curve: Curves.easeInOut)),
            ),
            child: child,
          );
        },
        child: pages1[currentIndex1],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex1,
        onTap: (index) {
          setState(() {
            previousIndex1 = currentIndex1;
            currentIndex1 = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/home.png",
              color: currentIndex1 == 0 ? Colors.black : null,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/prodctlist.png",
              color: currentIndex1 == 1 ? Colors.black : null,
            ),
            label: "Product",
          ),
          BottomNavigationBarItem(
            icon: Transform.translate(
              offset: Offset(0, -20),
              child: Image.asset(
                "assets/images/boassistant.png",
              ),
            ),
            label: "",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/vendor.png",
              color: currentIndex1 == 3 ? Colors.black : null,
            ),
            label: "Vendor",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/cart.png",
              color: currentIndex1 == 4 ? Colors.black : null,
            ),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
