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
          ),
          SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    const Icon(
                      Icons.schedule,
                      color: kPrimaryColor,
                      size: 24,
                    ),
                    Text(
                      "40 minute",
                      style: TextStyle(
                          color: kLightFontColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Cooking",
                      style: TextStyle(
                          color: kLightGreyFontColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: kDarkGreyFontColor,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    const Icon(
                      Icons.star,
                      color: kPrimaryColor,
                      size: 24,
                    ),
                    Text(
                      "40 minute",
                      style: TextStyle(
                          color: kLightFontColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Cooking",
                      style: TextStyle(
                          color: kLightGreyFontColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Container(
                height: 30,
                width: 1,
                color: kDarkGreyFontColor,
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    const Icon(
                      Icons.local_fire_department,
                      color: kPrimaryColor,
                      size: 24,
                    ),
                    Text(
                      "40 minute",
                      style: TextStyle(
                          color: kLightFontColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Cooking",
                      style: TextStyle(
                          color: kLightGreyFontColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
