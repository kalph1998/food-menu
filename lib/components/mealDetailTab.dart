import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';

class MealDetailTab extends StatefulWidget {
  const MealDetailTab({super.key});

  @override
  State<MealDetailTab> createState() => _MealDetailTabState();
}

class _MealDetailTabState extends State<MealDetailTab> {
  TabValues selectedTab = TabValues.instructions;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      width: double.infinity,
      decoration: BoxDecoration(
        color: kDarkColor,
        borderRadius: BorderRadius.circular(40),
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        InkWell(
          onTap: () {
            setState(() {
              selectedTab = TabValues.instructions;
            });
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: selectedTab == TabValues.instructions
                  ? kDarkGreyColor
                  : Colors.transparent,
            ),
            child: Text(
              "Instructions",
              style: TextStyle(
                color: selectedTab == TabValues.instructions
                    ? kPrimaryColor
                    : kDarkGreyFontColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        InkWell(
          onTap: () {
            setState(() {
              selectedTab = TabValues.ingredients;
            });
          },
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              color: selectedTab == TabValues.ingredients
                  ? kDarkGreyColor
                  : Colors.transparent,
            ),
            child: Text(
              "Ingredients",
              style: TextStyle(
                color: selectedTab == TabValues.ingredients
                    ? kPrimaryColor
                    : kDarkGreyFontColor,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}

enum TabValues { instructions, ingredients }
