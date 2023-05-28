import 'package:flutter/material.dart';
import 'package:food_menu/components/homeAppBar.dart';
import 'package:food_menu/components/homeBanner.dart';
import 'package:food_menu/components/homeBottomNav.dart';
import 'package:food_menu/components/mealCategory.dart';
import 'package:food_menu/components/mealGridView.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/data/dummyData.dart';

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
      bottomNavigationBar: const HomeBottomNavBar(),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          margin: const EdgeInsets.symmetric(horizontal: 18),
          child: Column(
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
