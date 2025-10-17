import 'package:bodega_delivery/repository/screens/payment/boUiScreen.dart';
import 'package:bodega_delivery/repository/screens/payment/payment.dart';
import 'package:bodega_delivery/repository/screens/payment/paymentcompletedscreen.dart';
import 'package:bodega_delivery/repository/screens/payment/paymentdark.dart';
import 'package:bodega_delivery/repository/screens/profile/profiledarkscreen.dart';
import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class DeliveryLocationDarkScreen extends StatelessWidget {
  final List<String> addresses = [
    "Plot No. 177, Nunkin Palem, Tambel House\nGajuwaka, FYAAZF - 530 027",
    "Flat 402B, Saffron Heights  Rajendra Nagar,\nFYAAZF - 520 008",
    "Door No. 19-A, Royal Garden Villas Tilak Road,\nFYAAZF - 517 501",
    "House No. 77, Greenwood Residency Ashok Nagar,\nFYAAZF - 522 007",
    "Teja Towers, Flat 302, 3rd Cross Street Suryaraopet,\nFYAAZF - 533 002",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor:Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile + Title
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
                        backgroundColor: Color(0xFF221662),
                        child: Icon(Icons.person,color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Subtitle
              const Text(
                "Select Delivery Locations",
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 30),

              // Address List
              Expanded(
                child: ListView.builder(
                  itemCount: addresses.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      borderRadius: BorderRadius.circular(12),
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => PaymentDarkScreen(
                              addresses[index],
                            ),
                          ),
                        );
                      },
                      child: Container(
                        margin: const EdgeInsets.only(bottom: 12),
                        padding: const EdgeInsets.all(14),
                        height: 81,
                        width: 289,
                        decoration: BoxDecoration(
                          color: Color(0XFF353535),
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          addresses[index],
                          style: const TextStyle(
                              fontSize: 16,
                              color: Color(0XFFFFFFFF)
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),

              // Back Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 14),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Back",
                    style: TextStyle(fontSize: 16, color: Colors.black),
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
