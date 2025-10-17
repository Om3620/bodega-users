import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class LinkedPaymentDarkScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
                    backgroundColor: Color(0xFF221662),
                    child: Icon(Icons.person, size:30,color: Colors.white),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 10),
            const Text(
              "Linked payments",
              style: TextStyle(fontSize: 22,color:Colors.white, fontWeight: FontWeight.bold),
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
                  color: Color(0XFF353535),
                  borderRadius: BorderRadius.circular(12),
                ),
                child: const Text(
                  "Add New Method",
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),

            const Spacer(),

            // Back Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  padding: const EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8),
                  ),
                ),
                onPressed: () => Navigator.pop(context),
                child: const Text(
                  "Back",
                  style: TextStyle(fontSize: 18, color: Colors.black),
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
        color: Color(0XFF353535),
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
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold,color:Colors.white,)),
                const SizedBox(height: 4),
                Text(subtitle, style: const TextStyle(fontSize: 14,color:Colors.white,)),
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

