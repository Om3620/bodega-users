import 'package:flutter/material.dart';
import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';

import '../profile/profiledarkscreen.dart';

class CategoryDarkScreen extends StatefulWidget {
  @override
  State<CategoryDarkScreen> createState() => _CategoryDarkScreenState();
}

class _CategoryDarkScreenState extends State<CategoryDarkScreen> {
  final TextEditingController searchController = TextEditingController();

  final List<String> filters = ["All", "Vegetables", "Fruits", "Meat"];
  Set<String> selectedFilters = {"All"};

  final List<Map<String, String>> allProducts = [
    {
      "img": "assets/images/apple.png",
      "name": "Organic Apples",
      "price": "₹299",
      "weight": "Organic Apples 1 KG",
      "seller": "Vidyuth Jamal Mart",
      "category": "Fruits"
    },
    {
      "img": "assets/images/tomato.png",
      "name": "Tomatoes",
      "price": "₹49",
      "weight": "Tomatoes 1 KG",
      "seller": "Fresh Veggies",
      "category": "Vegetables"
    },
    {
      "img": "assets/images/potato.png",
      "name": "Potato",
      "price": "₹29",
      "weight": "Potatoes 1 KG",
      "seller": "Vidyuth Jamal Mart",
      "category": "Vegetables"
    },
  ];

  List<Map<String, String>> get filteredProducts {
    if (selectedFilters.contains("All")) return allProducts;
    return allProducts
        .where((p) => selectedFilters.contains(p["category"]))
        .toList();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildHeader(context),
            _buildSearchBar(),
            _buildFilterChips(),
            Expanded(child: _buildProductGrid()),
          ],
        ),
      ),
    );
  }

  /// HEADER
  Widget _buildHeader(BuildContext context) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Center(
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
            child: const CircleAvatar(
              radius: 18,
              backgroundColor: Color(0XFF544F94),
              child: Icon(Icons.person, color: Colors.black),
            ),
          ),
        ),
      ],
    );
  }

  /// SEARCH BAR
  Widget _buildSearchBar() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: UiHelper.CustomTextField(controller: searchController),
    );
  }

  /// FILTER CHIPS
  Widget _buildFilterChips() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          children: filters.map((filter) {
            final isSelected = selectedFilters.contains(filter);
            return Padding(
              padding: const EdgeInsets.only(right: 8),
              child: ChoiceChip(
                label: Text(filter),
                selected: isSelected,
                selectedColor: const Color(0XFFFFFFFF),
                backgroundColor: Colors.white,
                labelStyle: TextStyle(
                  color: isSelected ? Colors.black : Colors.black,
                ),
                onSelected: (_) => _toggleFilter(filter, isSelected),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }

  void _toggleFilter(String filter, bool isSelected) {
    setState(() {
      if (filter == "All") {
        selectedFilters = {"All"};
      } else {
        selectedFilters.remove("All");
        isSelected ? selectedFilters.remove(filter) : selectedFilters.add(filter);
        if (selectedFilters.isEmpty) selectedFilters.add("All");
      }
    });
  }

  /// PRODUCT GRID
  Widget _buildProductGrid() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: GridView.builder(
        itemCount: filteredProducts.length,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 0.7,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
        ),
        itemBuilder: (_, index) {
          final product = filteredProducts[index];
          return GestureDetector(
            onTap: () => _showProductDetails(product),
            child: _buildProductCard(product),
          );
        },
      ),
    );
  }

  /// PRODUCT CARD
  Widget _buildProductCard(Map<String, String> product) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.black,
        borderRadius: BorderRadius.circular(20),
      ),
      padding: const EdgeInsets.all(8),
      child: Column(
        children: [
          Image.asset(product['img']!, height: 150, width: double.infinity, fit: BoxFit.cover),
          const SizedBox(height: 8),
          Text(product['name']!, style: const TextStyle(fontWeight: FontWeight.w600,color: Colors.white)),
          const SizedBox(height: 4),
          Text(product['price']!, style: TextStyle(color: Colors.white)),
          const Spacer(),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              onPressed: () {},
              child: const Text("Add",style: TextStyle(color: Colors.black),),
            ),
          ),
        ],
      ),
    );
  }

  /// PRODUCT DETAILS BOTTOM SHEET
  void _showProductDetails(Map<String, String> product) {
    int quantity = 1;
    showModalBottomSheet(
      context: context,
      backgroundColor: Colors.black,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (_) {
        return StatefulBuilder(
          builder: (_, setModalState) {
            return Padding(
              padding: const EdgeInsets.all(25),
              child: Wrap(
                children: [
                  _buildBottomSheetHeader(setModalState, product, () => Navigator.pop(context)),
                  const SizedBox(height: 20),
                  _buildBottomSheetImage(product),
                  const SizedBox(height: 20),
                  _buildBottomSheetDetails(product),
                  const SizedBox(height: 12),
                  _buildPriceAndQuantity(product, setModalState, quantity),
                  const SizedBox(height: 10),
                  _buildAddToCartButton(),
                ],
              ),
            );
          },
        );
      },
    );
  }

  Widget _buildBottomSheetHeader(Function setModalState, Map<String, String> product, VoidCallback onClose) {
    return Row(
      children: [
        const Text("Product Details", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
        const Spacer(),
        GestureDetector(onTap: onClose, child: const Icon(Icons.close)),
      ],
    );
  }

  Widget _buildBottomSheetImage(Map<String, String> product) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(12),
      child: Image.asset(product['img']!, height: 160, width: double.infinity, fit: BoxFit.cover),
    );
  }

  Widget _buildBottomSheetDetails(Map<String, String> product) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(product['name']!, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 18)),
        const SizedBox(height: 8),
        Text(product['weight']!, style: TextStyle(color: Colors.white)),
        const SizedBox(height: 8),
        Text("Sold by : ${product['seller']}", style: TextStyle(color: Colors.white, fontSize: 13)),
      ],
    );
  }

  Widget _buildPriceAndQuantity(Map<String, String> product, Function setModalState, int quantity) {
    return Row(
      children: [
        Text(product['price']!, style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        const Spacer(),
        IconButton(
          onPressed: () => setModalState(() => quantity = (quantity > 1) ? quantity - 1 : 1),
          icon: const Icon(Icons.remove_circle_outline),
          color: Colors.white,
        ),
        Text('$quantity', style: const TextStyle(fontSize: 16,color: Colors.white)),
        IconButton(
          onPressed: () => setModalState(() => quantity++),
          icon: const Icon(Icons.add_circle_outline),
          color:Colors.white,
        ),
      ],
    );
  }

  Widget _buildAddToCartButton() {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor:Colors.white,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          padding: const EdgeInsets.symmetric(vertical: 14),
        ),
        onPressed: () {},
        child: const Text("Add to Cart"
        ,style: TextStyle(color: Colors.black,),),
      ),
    );
  }
}
