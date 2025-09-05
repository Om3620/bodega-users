import 'package:bodega_delivery/repository/screens/profile/profiledarkscreen.dart';
import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:bodega_delivery/repository/widgets/uihelper.dart';
import 'package:flutter/material.dart';

class PersonalPrefScreen extends StatefulWidget {
  @override
  _PersonalPrefScreenState createState() => _PersonalPrefScreenState();
}

class _PersonalPrefScreenState extends State<PersonalPrefScreen> {
  bool isDarkMode = false;

  @override
  Widget build(BuildContext context) {
    final bgColor = isDarkMode ? Colors.black : Colors.white;
    final textColor = isDarkMode ? Colors.white : Colors.black;
    final tileColor = isDarkMode ? Colors.grey.shade800 : Colors.grey.shade200;
    final buttonBg = isDarkMode ? Colors.white : Color(0XFF221662);
    final buttonText = isDarkMode ? Colors.black : Colors.white;

    return MaterialApp(
      theme: isDarkMode ? ThemeData.dark() : ThemeData.light(),
      home: Scaffold(
        backgroundColor: bgColor,
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Stack(
                children: [
                  Column(
                    children: [
                      SizedBox(height: 30),
                      Center(
                        child: UiHelper.CustomText(
                          text: "BOdega",
                          color: textColor,
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
                          pageBuilder: (context, animation, secondaryAnimation) => ProfileScreen(),
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
                        child: Icon(Icons.person, color:isDarkMode ? Colors.white : Colors.black),
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Title
              Text(
                "Personal Preferences",
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: textColor),
              ),
              const SizedBox(height: 20),

              // Notification Settings
              _buildSettingTile(
                title: "Notification settings",
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                tileColor: tileColor,
                textColor: textColor,
              ),

              // Language Selection
              _buildSettingTile(
                title: "Language selection",
                trailing: const Icon(Icons.arrow_forward_ios, size: 16),
                tileColor: tileColor,
                textColor: textColor,
              ),

              // Dark/Light Mode Toggle
              _buildSettingTile(
                title: "Dark/Light mode",
                trailing: Switch(
                  value: isDarkMode,
                  onChanged: (val) {
                    setState(() {
                      isDarkMode = val;
                    });
                  },
                ),
                tileColor: tileColor,
                textColor: textColor,
              ),

              const Spacer(),

              // Back Button
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonBg,
                    padding: const EdgeInsets.symmetric(vertical: 14),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8),
                    ),
                  ),
                  onPressed: () {
                    if (isDarkMode) {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => ProfileDarkScreen()),
                      );
                    } else {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => ProfileScreen()),
                      );
                    }
                  },
                  child: Text(
                    "Back",
                    style: TextStyle(fontSize: 18, color: buttonText),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSettingTile({
    required String title,
    required Widget trailing,
    required Color tileColor,
    required Color textColor,
  }) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 6),
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
      decoration: BoxDecoration(
        color: tileColor,
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(title, style: TextStyle(fontSize: 16, color: textColor)),
          trailing,
        ],
      ),
    );
  }
}