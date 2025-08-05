// sign_up_page.dart
import 'package:flutter/material.dart';
import 'package:bodega/blank_page.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>(); // key for validation

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                const Text(
                  'Get Started',
                  style: TextStyle(
                    fontSize: 19.55,
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontFamily: 'Plus Jakarta Sans',
                  ),
                ),
                const Text(
                  'by creating a free account.',
                  style: TextStyle(
                    fontSize: 12,
                    color: Colors.black,
                    fontWeight: FontWeight.w300,
                    letterSpacing: 1.5,
                    fontFamily: 'Plus Jakarta Sans',
                  ),
                ),
                const SizedBox(height: 40),

                // First Name Field
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "First Name",
                    labelStyle: TextStyle(
                      color: Color(0xFF544F94),
                      fontWeight: FontWeight.w400,
                      fontSize: 10.82,

                    ),
                    prefixIcon: const Icon(Icons.person),
                    filled: true,
                    fillColor: const Color(0xFFE8E8F2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? 'Please enter first name' : null,
                ),
                const SizedBox(height: 30),

                // Last Name Field
                TextFormField(
                  keyboardType: TextInputType.name,
                  decoration: InputDecoration(
                    labelText: "Last Name",
                    labelStyle: TextStyle(
                      color: Color(0xFF544F94),
                      fontWeight: FontWeight.w400,
                      fontSize: 10.82,

                    ),
                    prefixIcon: const Icon(Icons.person),
                    filled: true,
                    fillColor: const Color(0xFFE8E8F2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? 'Please enter last name' : null,
                ),
                const SizedBox(height: 30),

                // Mobile Number Field
                TextFormField(
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: "Mobile Number",
                    labelStyle: TextStyle(
                      color: Color(0xFF544F94),
                      fontWeight: FontWeight.w400,
                      fontSize: 10.82,
                    ),
                    prefixIcon: const Icon(Icons.phone),
                    filled: true,
                    fillColor: const Color(0xFFE8E8F2),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                      borderSide: BorderSide.none,
                    ),
                  ),
                  validator: (value) =>
                  value!.isEmpty ? 'Incorrect number' : null,
                ),
                const SizedBox(height: 40),

                // Submit Button
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: const Color(0xFF221662),
                    borderRadius: BorderRadius.circular(6),
                  ),
                  child: MaterialButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const BlankPage()),
                        );
                      }
                    },
                    child: const Text(
                      'Send OTP  >',
                      style: TextStyle(
                        fontFamily: 'Plus Jakarta Sans',
                        fontSize: 12.83,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      "Already a member? ",
                      style: TextStyle(
                        fontFamily: 'Montserrat',
                        fontSize: 13,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        print("Navigate to Login screen");
                        // Add login page navigation if needed
                      },
                      child: const Text(
                        "Log in",
                        style: TextStyle(
                          fontFamily: 'Montserrat',
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF6C63FF),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
