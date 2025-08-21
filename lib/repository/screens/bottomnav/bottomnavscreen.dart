import 'package:bodega_delivery/repository/screens/category/categoryscreen.dart';
import 'package:bodega_delivery/repository/screens/home/homescreen.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';
import 'package:animations/animations.dart';

import '../BOassistant/BOassitantScreen.dart';
import '../cart/cartscreen.dart';
import '../vendors/vendorscreen.dart';

class BottomNavScreen extends StatefulWidget {
  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  int currentIndex = 0;
  int previousIndex = 0;

  final List<Widget> pages = [
    HomeScreen(),
    CategoryScreen(),
    BOassistantScreen(),
    CartScreen(),
    VendorScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
        duration: const Duration(milliseconds: 300),
        transitionBuilder: (child, animation, secondaryAnimation) {
          final isRTL = currentIndex > previousIndex;
          final beginOffset = isRTL ? Offset(1.0, 0.0) : Offset(-1.0, 0.0);

          return SlideTransition(
            position: animation.drive(
              Tween<Offset>(begin: beginOffset, end: Offset.zero)
                  .chain(CurveTween(curve: Curves.easeInOut)),
            ),
            child: child,
          );
        },
        child: pages[currentIndex],
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        onTap: (index) {
          setState(() {
            previousIndex = currentIndex;
            currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/home.png",
              color: currentIndex == 0 ? Colors.black : null,
            ),
            label: "Home",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/prodctlist.png",
              color: currentIndex == 1 ? Colors.black : null,
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
              color: currentIndex == 3 ? Colors.black : null,
            ),
            label: "Vendor",
          ),
          BottomNavigationBarItem(
            icon: Image.asset(
              "assets/images/cart.png",
              color: currentIndex == 4 ? Colors.black : null,
            ),
            label: "Cart",
          ),
        ],
      ),
    );
  }
}
