import 'dart:async';
import 'package:bodega_delivery/repository/screens/profile/profiledarkscreen.dart';
import 'package:flutter/material.dart';
import '../../widgets/uihelper.dart';

enum DeliveryStatus {
  assigning,
  assigned,
  givedeliverypoint,
  collectorder,
  onTheWay,
  deliverystart,
}

class OrderStatusDarkScreen extends StatefulWidget {
  @override
  _OrderStatusDarkScreenState createState() => _OrderStatusDarkScreenState();
}

class _OrderStatusDarkScreenState extends State<OrderStatusDarkScreen> {
  DeliveryStatus status = DeliveryStatus.assigning;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      setState(() => status = DeliveryStatus.assigned);
    });
    Future.delayed(const Duration(seconds: 3), () {
      setState(() => status = DeliveryStatus.givedeliverypoint);
    });
    Future.delayed(const Duration(seconds: 4), () {
      setState(() => status = DeliveryStatus.collectorder);
    });
    // 🚀 Auto change statuses with delay (for demo)
    Future.delayed(const Duration(seconds: 5), () {
      setState(() => status = DeliveryStatus.onTheWay);
    });
    Future.delayed(const Duration(seconds: 6), () {
      setState(() => status = DeliveryStatus.deliverystart);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            // ✅ Top Logo + Avatar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 20),
              child: Stack(
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
                  Positioned(
                    left: 15,
                    top: 16,
                    child: GestureDetector(
                      onTap: () => Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: const Duration(milliseconds: 300),
                          pageBuilder: (_, __, ___) => ProfileDarkScreen(),
                          transitionsBuilder: (_, animation, __, child) {
                            final tween = Tween(begin: const Offset(-1.0, 0.0), end: Offset.zero)
                                .chain(CurveTween(curve: Curves.easeInOut));
                            return SlideTransition(position: animation.drive(tween), child: child);
                          },
                        ),
                      ),
                      child: CircleAvatar(
                        backgroundColor: Color(0XFF544F94),
                        child: Icon(Icons.person,color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // ✅ Main Map + Overlays
            Expanded(
              child: Stack(
                children: [
                  // Map Image
                  Positioned.fill(
                    child: Image.asset(
                      "assets/images/demomap.png",
                      fit: BoxFit.cover,
                    ),
                  ),

                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Text('Order Status',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 12,
                    ),
                    ),
                  ),


                  Align(
                    alignment: Alignment.bottomLeft,
                    child:Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: CircleAvatar(
                        radius: 22,
                        backgroundColor: const Color(0xFF221662),
                        child: Image.asset("assets/images/Vector.png"),
                      ),
                    ),
                  ),

                  // Delivery Status Bar
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: DeliveryStatusBar(status: status),
                    ),
                  ),


                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

// ✅ Reusable Animated Status Bar Widget
class DeliveryStatusBar extends StatelessWidget {
  final DeliveryStatus status;

  const DeliveryStatusBar({super.key, required this.status});

  @override
  Widget build(BuildContext context) {
    String text = "";
    Color bgColor = Colors.grey;
    IconData icon = Icons.info;

    switch (status) {
      case DeliveryStatus.assigning:
        text = "Assigning Delivery Partner";
        bgColor = const Color(0xFF221662);
        icon = Icons.person;
        break;

      case DeliveryStatus.assigned:
        text = "Delivery Partner Assigned";
        bgColor = const Color(0xFF221662);
        icon = Icons.person;
        break;

      case DeliveryStatus.givedeliverypoint:
        text = "Delivery Meet Point Fixed";
        bgColor = const Color(0xFF221662);
        icon = Icons.filter_center_focus;
        break;

      case DeliveryStatus.collectorder:
        text = "Product Collecting Started";
        bgColor = const Color(0XFF221662);
        icon = Icons.inventory;
        break;

      case DeliveryStatus.onTheWay:
        text = "Heading Towards Meet Point";
        bgColor = const Color(0XFF221662);
        icon = Icons.center_focus_strong;
        break;

      case DeliveryStatus.deliverystart:
        text = "Delivery Started";
        bgColor = const Color(0XFF221662);
        icon = Icons.delivery_dining;
        break;
    }

    return AnimatedContainer(
      duration: const Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      height: 55,
      decoration: BoxDecoration(
        color: bgColor,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // ✅ Animated Text
          AnimatedSwitcher(
            duration: const Duration(milliseconds: 400),
            transitionBuilder: (child, animation) =>
                FadeTransition(opacity: animation, child: child),
            child: Padding(
              key: ValueKey<String>(text),
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                text,
                style: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                ),
              ),
            ),
          ),

          // ✅ Animated Icon
          Padding(
            padding: const EdgeInsets.only(right: 18.0),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              transitionBuilder: (child, animation) =>
                  ScaleTransition(scale: animation, child: child),
              child: Icon(
                icon,
                key: ValueKey<IconData>(icon),
                size: 24,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}