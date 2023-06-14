import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/data/dummy_data.dart';
import 'package:food_menu/providers/meal_category_provider.dart';

class MealCategoryListView extends ConsumerStatefulWidget {
  const MealCategoryListView({super.key});

  @override
  ConsumerState<MealCategoryListView> createState() =>
      _MealCategoryListViewState();
}

class _MealCategoryListViewState extends ConsumerState<MealCategoryListView> {
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
                  ref
                      .read(mealCategoryProvider.notifier)
                      .setMealCategoryId(availableCategories[index].id);
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
