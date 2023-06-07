import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/data/meal.dart';

class MealInfo extends StatefulWidget {
  Meal selectedMeal;
  MealInfo({super.key, required this.selectedMeal});

  @override
  State<MealInfo> createState() => _MealInfoState();
}

class _MealInfoState extends State<MealInfo> {
  TabValues selectedTab = TabValues.instructions;
  @override
  Widget build(BuildContext context) {
    print(widget.selectedMeal.complexity);
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
      child: Column(
        children: [
          Text(
            widget.selectedMeal.title,
            style: const TextStyle(
              color: kLightFontColor,
              fontWeight: FontWeight.w700,
              fontSize: 26,
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 14),
                child: Column(
                  children: [
                    const Icon(
                      Icons.schedule,
                      color: kPrimaryColor,
                      size: 24,
                    ),
                    Text(
                      "${widget.selectedMeal.duration} minute",
                      style: TextStyle(
                          color: kLightFontColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    const Text(
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
                      "4.08",
                      style: TextStyle(
                          color: kLightFontColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Rating",
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
                      widget.selectedMeal.complexity.name,
                      style: TextStyle(
                          color: kLightFontColor,
                          fontSize: 18,
                          fontWeight: FontWeight.w600),
                    ),
                    Text(
                      "Recipes",
                      style: TextStyle(
                          color: kLightGreyFontColor,
                          fontSize: 12,
                          fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
            ],
          ),
          SizedBox(
            height: 30,
          ),
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: kDarkColor,
              borderRadius: BorderRadius.circular(40),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                InkWell(
                  onTap: () {
                    setState(() {
                      selectedTab = TabValues.instructions;
                    });
                  },
                  child: Container(
                    alignment: Alignment.center,
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 20),
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
                        fontSize: 16,
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
                    padding: const EdgeInsets.symmetric(
                        vertical: 10, horizontal: 30),
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
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          selectedTab == TabValues.ingredients
              ? Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: widget.selectedMeal.ingredients.length,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: kDarkColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          widget.selectedMeal.ingredients[index],
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: kDarkGreyFontColor,
                              fontWeight: FontWeight.w700),
                        ),
                      );
                    },
                  ),
                )
              : Expanded(
                  child: ListView.builder(
                    shrinkWrap: true,
                    padding: EdgeInsets.zero,
                    itemCount: widget.selectedMeal.steps.length,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            vertical: 10, horizontal: 10),
                        decoration: BoxDecoration(
                          color: kDarkColor,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Text(
                          "${index + 1}. ${widget.selectedMeal.steps[index]}",
                          textAlign: TextAlign.left,
                          style: const TextStyle(
                              color: kDarkGreyFontColor,
                              fontWeight: FontWeight.w700),
                        ),
                      );
                    },
                  ),
                )
        ],
      ),
    );
  }
}

enum TabValues { instructions, ingredients }
