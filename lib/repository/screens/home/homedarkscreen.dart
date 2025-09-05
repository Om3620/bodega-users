import 'package:bodega_delivery/repository/screens/profile/profiledarkscreen.dart';
import 'package:flutter/material.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';

import '../profile/profilescreen.dart';

class HomeDarkScreen extends StatelessWidget {
  TextEditingController searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Header
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 30),
                      Center(
                        child: UiHelper.CustomText(
                          text: "BOdega",
                          color: Colors.white,
                          fontweight: FontWeight.bold,
                          fontsize: 20,
                          fontfamily: "bold",
                        ),
                      ),
                    ],
                  ),


                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        PageRouteBuilder(
                          transitionDuration: Duration(milliseconds: 300),
                          pageBuilder: (context, animation, secondaryAnimation) => ProfileDarkScreen(),
                          transitionsBuilder: (context, animation, secondaryAnimation, child) {
                            const begin = Offset(-1.0, 0.0); // From right
                            const end = Offset.zero;
                            final tween = Tween(begin: begin, end: end).chain(CurveTween(curve: Curves.easeInOut));
                            return SlideTransition(
                              position: animation.drive(tween),
                              child: child,
                            );
                          },
                        ),
                      );
                    },
                    child:Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 22),

                      child: CircleAvatar(
                        radius: 18,
                        backgroundColor: Color(0XFF544F94),
                        child: Icon(Icons.person, color: Colors.black),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 16),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 8),
                child: UiHelper.CustomTextField(
                  controller: searchController,
                ),
              ),

              SizedBox(height: 20),
              Text("Sales Offers", style: _sectionTitle),
              SizedBox(height: 20),
              SizedBox(
                height: 186,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildSaleCard("assets/images/buy1get1free.png", "Grocery Sale"),
                    _buildSaleCard("assets/images/festival_sale.png", "Festival Sale"),
                    _buildSaleCard("assets/images/potato.png", "50% Off"),
                  ],
                ),
              ),

              SizedBox(height: 24),
              Text("Categories", style: _sectionTitle),
              SizedBox(height: 24),
              SizedBox(
                height: 130,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: [
                    _buildCategoryCard("assets/images/fruit.png", "Fruits"),
                    _buildCategoryCard("assets/images/vegetable.png", "Vegetables"),
                    _buildCategoryCard("assets/images/snack.png", "Snacks"),
                    _buildCategoryCard("assets/images/milk.png", "dairy"),

                  ],
                ),
              ),

              SizedBox(height: 24),
              Text("Featured Products", style: _sectionTitle),
              SizedBox(height: 12),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    _buildProductCard(
                      title: "Apple",
                      price: "₹120 / Kg",
                      imageUrl: "assets/images/apple.png",
                    ),
                    SizedBox(width: 12),
                    _buildProductCard(
                      title: "Organic tomato",
                      price: "₹299 / kg",
                      imageUrl: "assets/images/tomato.png",
                    ),
                    SizedBox(width: 12),
                    _buildProductCard(
                      title: "Whole Milk",
                      price: "₹349 / Liter",
                      imageUrl: "assets/images/milk.png",
                    ),
                    SizedBox(width: 12),
                    _buildProductCard(
                      title: "Potato",
                      price: "₹49 / Kg",
                      imageUrl: "assets/images/potato.png",
                    ),
                    SizedBox(width: 12),
                    _buildProductCard(
                      title: "Whole Milk",
                      price: "₹349 / Liter",
                      imageUrl: "assets/images/milk.png",
                    ),

                  ],
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }

  final TextStyle _sectionTitle = TextStyle(
    fontSize: 22,
    fontWeight: FontWeight.bold,
    color:Colors.white,
  );

  Widget _buildSaleCard(String imageUrl, String label) {
    return Container(
      width: 226,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imageUrl, height: 139, width: 286, fit: BoxFit.cover),
          ),
          SizedBox(height: 6),
          Text(label, style: TextStyle(fontSize: 18,color: Colors.white, fontWeight: FontWeight.w500)),
        ],
      ),
    );
  }

  Widget _buildCategoryCard(String imageUrl, String label) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: 12),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(imageUrl, height: 80, width: 80, fit: BoxFit.cover),
          ),
          SizedBox(height: 12),
          Text(label, style: TextStyle(fontSize: 15,color: Colors.white)),
        ],
      ),
    );
  }

  Widget _buildProductCard({
    required String title,
    required String price,
    required String imageUrl,
  }) {
    return Container(
      padding: EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(color: Color(0XFF595959)),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Image.asset(imageUrl, height: 60, width: 60, fit: BoxFit.cover),
          SizedBox(height: 8),
          Text(title, style: TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
          SizedBox(height: 4),
          Text(price, style: TextStyle(color: Colors.white)),
          SizedBox(height: 6),
          ElevatedButton(
            onPressed: () {},
            child: Text("Add",
            style: TextStyle(color: Colors.white),),
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(0XFF353535),
              foregroundColor: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              minimumSize: Size(80, 36),
              padding: EdgeInsets.symmetric(horizontal: 12),
            ),
          ),
        ],
      ),
    );
  }
}
