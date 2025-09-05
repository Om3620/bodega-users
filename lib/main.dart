import 'package:bodega_delivery/repository/screens/location/deliverylocdarkscreen.dart';
import 'package:bodega_delivery/repository/screens/location/deliverylocscreen.dart';
import 'package:bodega_delivery/repository/screens/payment/bowalletloading.dart';
import 'package:bodega_delivery/repository/screens/payment/paymentcompletedscreen.dart';
import 'package:bodega_delivery/repository/screens/personalpref/personalprefdarkscreen.dart';
import 'package:bodega_delivery/repository/screens/personalpref/personalprefscreen.dart';
import 'package:bodega_delivery/repository/screens/profile/profiledarkscreen.dart';
import 'package:bodega_delivery/repository/screens/profile/profilescreen.dart';
import 'package:bodega_delivery/repository/screens/splash/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Bodega',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Color(0XFF221662)),
          useMaterial3: false,
        ),
        home:SplashScreen(),
    );
  }
}
