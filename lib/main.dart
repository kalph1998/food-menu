import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/screens/favorites.dart';
import 'package:food_menu/screens/meal_filters.dart';
import 'package:food_menu/screens/home.dart';
import 'package:food_menu/screens/meal_detail.dart';
import 'package:food_menu/screens/on_board.dart';
import 'package:food_menu/screens/tab.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark));
  runApp(const ProviderScope(child: MyApp()));
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
          visualDensity: VisualDensity.adaptivePlatformDensity),
      home: const OnboardScreen(),
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        MealDetail.routeName: (ctx) => MealDetail(),
        FavoritesScreen.routeName: (ctx) => const FavoritesScreen(),
        HomeBottomNavBar.routeName: (ctx) => HomeBottomNavBar(),
        FilterScreen.routeName: (ctx) => FilterScreen()
      },
    );
  }
}
