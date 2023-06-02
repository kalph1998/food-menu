import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/data/dummyData.dart';

class MealCategoryListView extends StatefulWidget {
  const MealCategoryListView({super.key});

  @override
  State<MealCategoryListView> createState() => _MealCategoryListViewState();
}

class _MealCategoryListViewState extends State<MealCategoryListView> {
  int selectedMealIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 30,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: availableCategories.length,
          itemBuilder: (ctx, index) {
            return InkWell(
              splashColor: Colors.transparent,
              onTap: () {
                setState(() {
                  selectedMealIndex = index;
                });
              },
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(right: 10),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                decoration: BoxDecoration(
                    color: selectedMealIndex == index
                        ? Theme.of(context).primaryColor
                        : kDarkGreyColor,
                    borderRadius: BorderRadius.circular(8)),
                child: Text(
                  availableCategories[index].title,
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: selectedMealIndex == index
                          ? kDarkColor
                          : kDarkGreyFontColor),
                ),
              ),
            );
          }),
    );
  }
}
