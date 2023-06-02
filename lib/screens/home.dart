import 'package:flutter/material.dart';
import 'package:food_menu/widgets/homeAppBar.dart';
import 'package:food_menu/widgets/homeBanner.dart';
import 'package:food_menu/widgets/homeBottomNav.dart';
import 'package:food_menu/widgets/mealCategory.dart';
import 'package:food_menu/widgets/mealGridView.dart';
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
      appBar: const HomeAppBar(),
      drawer: Drawer(),
      bottomNavigationBar: const HomeBottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: const Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              HomeBanner(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    'Meal Category',
                    style: TextStyle(
                      color: kLightFontColor,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'See all',
                    style: TextStyle(fontSize: 14, color: kDarkGreyFontColor),
                  )
                ],
              ),
              SizedBox(
                height: 10,
              ),
              MealCategoryListView(),
              SizedBox(
                height: 40,
              ),
              SizedBox(
                child: MealGridView(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
