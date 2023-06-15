import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_menu/data/meal.dart';
import 'package:food_menu/providers/filters_provider.dart';
import 'package:food_menu/providers/meal_category_provider.dart';
import 'package:food_menu/widgets/meal_tile.dart';

class MealGridView extends ConsumerStatefulWidget {
  const MealGridView({super.key});

  @override
  ConsumerState<MealGridView> createState() => _MealGridViewState();
}

class _MealGridViewState extends ConsumerState<MealGridView> {
  @override
  Widget build(BuildContext context) {
    final selectedMealCategoryId = ref.watch(mealCategoryProvider);
    List<Meal> availableMeals = ref.watch(filteredMealsProvider);
    availableMeals = availableMeals
        .where((element) => element.categories.contains(selectedMealCategoryId))
        .toList();

    return GridView.builder(
        padding: const EdgeInsets.only(bottom: 20),
        itemCount: availableMeals.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.1),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return MealTile(
            meal: availableMeals[index],
          );
        });
  }
}
