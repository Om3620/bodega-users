import 'package:bodega_delivery/repository/screens/profile/acc_overviewdark1.dart';
import 'package:flutter/material.dart';

import '../../widgets/uihelper.dart';
import 'acc_overview1.dart';

class AccOverviewDarkScreen extends StatelessWidget{
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
                      child: Icon(Icons.person,color: Colors.black),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 30),
              Text(
                "Account Overview",
                style: TextStyle(
                  fontSize: 26,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
              ),


              // Camera icon inside circle
              Padding(
                padding:
                const EdgeInsets.symmetric(vertical:20),
                child: Center(
                  child:CircleAvatar(
                    radius: 80,
                    backgroundColor: Colors.black,
                    child: Icon(Icons.camera_alt, size: 50, color: Color(0XFF59578F)),
                  ),
                ),
              ),

              const SizedBox(height: 20),

              // Name field
              TextField(
                decoration: InputDecoration(
                  hintText: "Name",
                  hintStyle:TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color(0XFF353535),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
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
                        hintStyle:TextStyle(color: Colors.white),
                        filled: true,
                        fillColor: Color(0XFF353535),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(8),
                          borderSide: BorderSide.none,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  SizedBox(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(context,PageRouteBuilder(
                            pageBuilder: (context, animation, secondaryAnimation) => AccOverviewDark1Screen()));
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0XFFB9F8C2),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: Text("Verify"),
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
                  hintStyle:TextStyle(color: Colors.white),
                  filled: true,
                  fillColor: Color(0XFF353535),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8),
                    borderSide: BorderSide.none,
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Save button

              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: Text(
                    "Save",
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