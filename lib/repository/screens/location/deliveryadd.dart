import 'package:bodega_delivery/repository/screens/location/orderstatusscreen.dart';
import 'package:bodega_delivery/repository/screens/location/pin_dropmapscreen.dart';
import 'package:bodega_delivery/repository/screens/location/savedlocationscreen.dart';
import 'package:flutter/material.dart';

import '../../widgets/uihelper.dart';
import 'deliveryadd1screen.dart';

class DeliveryAddScreen extends StatelessWidget{

  final List<String> options = [
    "Delivery Address",
    "Saved Location(Home,Work,etc.)",
    "Pin-Drop Map Integration"
  ];

  final List<Widget> screens = [
    OrderStatusScreen(),
    SavedLocationScreen(),
    Pin_dropMapScreen()
    ];


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0XFFF5F5F5),
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
            color: Color(0XFF000000),
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
          backgroundColor: Color(0xFF221662),
          child: Icon(Icons.person,color: Colors.white),
        ),
      ),
      ],
    ),

    SizedBox(height: 30),
    Text(
    "Delivery Address",
    style: TextStyle(
    fontSize: 26,
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
                              color: Color(0XFFE8E8F2),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Text(
                              options[index],
                              style: TextStyle(fontSize: 18),
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
                      Navigator.pop(context);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF221662),
                      padding: EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text(
                      "Back",
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.white,
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