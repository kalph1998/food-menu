import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/screens/onBoard.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.light));
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryColor: kPrimaryColor,
        useMaterial3: true,
      ),
      home: OnboardScreen(),
    );
  }
}
