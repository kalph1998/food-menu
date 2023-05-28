import 'package:flutter/material.dart';
import 'package:food_menu/components/homeAppBar.dart';
import 'package:food_menu/components/homeBanner.dart';
import 'package:food_menu/components/homeBottomNav.dart';
import 'package:food_menu/constants.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: HomeAppBar(),
      bottomNavigationBar: const HomeBottomNavBar(),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [const HomeBanner()],
        ),
      ),
    );
  }
}
