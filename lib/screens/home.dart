import 'package:flutter/material.dart';
import 'package:food_menu/widgets/home_app_bar.dart';
import 'package:food_menu/widgets/home_banner.dart';
import 'package:food_menu/widgets/main_drawer.dart';
import 'package:food_menu/widgets/meal_category.dart';
import 'package:food_menu/widgets/meal_grid_view.dart';
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
      appBar: const HomeAppBar(
        title: 'Hi, Amanda',
        subtitle: 'Ready to cook for dinner ?',
      ),
      drawer: const MainDrawer(),
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
