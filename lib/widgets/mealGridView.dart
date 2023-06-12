import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_menu/providers/meals_provider.dart';
import 'package:food_menu/widgets/mealTile.dart';

class MealGridView extends ConsumerStatefulWidget {
  const MealGridView({super.key});

  @override
  ConsumerState<MealGridView> createState() => _MealGridViewState();
}

class _MealGridViewState extends ConsumerState<MealGridView> {
  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    return GridView.builder(
        itemCount: meals.length,
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
            meal: meals[index],
          );
        });
  }
}
