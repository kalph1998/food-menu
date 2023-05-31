import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/data/meal.dart';

class MealInfo extends StatelessWidget {
  Meal selectedMeal;
  MealInfo({super.key, required this.selectedMeal});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
      child: Column(
        children: [
          Text(
            selectedMeal.title,
            style: const TextStyle(
              color: kLightFontColor,
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ),
          )
        ],
      ),
    );
  }
}
