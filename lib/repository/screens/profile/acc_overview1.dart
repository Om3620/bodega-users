import 'package:bodega_delivery/repository/screens/profile/acc_overview2.dart';
import 'package:flutter/material.dart';

import '../../widgets/uihelper.dart';

class AccOverview1Screen extends StatelessWidget{
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

              // User Profile Title
              Text(
                "Account Overview",
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.bold,
                ),
              ),
    Padding(
    padding:
    const EdgeInsets.symmetric(vertical:20),

    // Camera icon inside circle
              child:Center(
                child:CircleAvatar(
                  radius: 80,
                  backgroundColor: Colors.white,
                  child: Icon(Icons.camera_alt, size: 50, color: Color(0XFF59578F)),
                ),
              ),
    ),
              const SizedBox(height: 20),

              // Name field
              TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                  filled: true,
                  fillColor: Color(0XFFE8E8F2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              // Mobile number + verify button
              Row(
                children: [
                  Expanded(
                    child: TextField(
                      keyboardType: TextInputType.phone,
                      decoration: InputDecoration(
                        hintText: "Mobile Number",
                        filled: true,
                        fillColor: Color(0XFFE8E8F2),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
    SizedBox(
    child: ElevatedButton(
    onPressed: () {
    Navigator.push(context,PageRouteBuilder(pageBuilder: (context, animation, secondaryAnimation) => AccOverview2Screen()));
    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0XFFB9F8C2),
                      foregroundColor: Colors.black,
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Text("Verifying"),
                  ),
    ),
                ],
              ),

              const SizedBox(height: 12),

              // Email optional
              TextField(
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  hintText: "E-Mail(Optional)",
                  filled: true,
                  fillColor: Color(0XFFE8E8F2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 12),

              TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  hintText: "OTP",
                  filled: true,
                  fillColor: Color(0XFFE8E8F2),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              // Save button

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
                    "Verify",
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