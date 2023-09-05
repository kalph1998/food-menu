import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/models/meal.dart';
import 'package:food_menu/providers/filters_provider.dart';
import 'package:food_menu/providers/meal_category_provider.dart';
import 'package:food_menu/widgets/meal_tile.dart';

class MealGridView extends ConsumerStatefulWidget {
  const MealGridView({super.key});

  @override
  ConsumerState<MealGridView> createState() => _MealGridViewState();
}

class _MealGridViewState extends ConsumerState<MealGridView>
    with SingleTickerProviderStateMixin {
  late AnimationController _animationController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 300),
      // lowerBound: 0,
      // upperBound: 1,
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final selectedMealCategoryId = ref.watch(mealCategoryProvider);
    List<Meal> availableMeals = ref.watch(filteredMealsProvider);
    availableMeals = availableMeals
        .where((element) => element.categories.contains(selectedMealCategoryId))
        .toList();

    return availableMeals.isEmpty
        ? const Center(
            child: Text(
              "No meals found",
              style: TextStyle(color: kLightFontColor, fontSize: 18),
            ),
          )
        : AnimatedBuilder(
            animation: _animationController,
            child: GridView.builder(
              padding: const EdgeInsets.only(bottom: 20),
              itemCount: availableMeals.length,
              physics: const NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  childAspectRatio: MediaQuery.of(context).size.width /
                      (MediaQuery.of(context).size.height / 1),
                  crossAxisCount: 2,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              shrinkWrap: true,
              itemBuilder: (ctx, index) {
                return MealTile(
                  meal: availableMeals[index],
                );
              },
            ),
            builder: (ctx, child) => SlideTransition(
              position: Tween(
                begin: const Offset(0, 0.5),
                end: const Offset(0, 0),
              ).animate(
                CurvedAnimation(
                    parent: _animationController, curve: Curves.easeInOut),
              ),
              child: child,
            ),
          );
  }
}
