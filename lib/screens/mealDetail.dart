import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_menu/providers/favorites_provider.dart';
import 'package:food_menu/widgets/mealInfo.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/data/dummyData.dart';
import 'package:food_menu/data/meal.dart';

class MealDetail extends ConsumerWidget {
  static const routeName = '/meal';
  MealDetail({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final mealId = ModalRoute.of(context)!.settings.arguments;

    Meal selectedMeal =
        dummyMeals.firstWhere((element) => element.id == mealId);

    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kDarkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Container(
          decoration: BoxDecoration(
              color: kDarkGreyColor, borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: kDarkGreyFontColor,
              size: 34,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                color: kLightRedColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(1, 1),
                    spreadRadius: -6,
                    blurRadius: 39,
                    color: kLightRedColor,
                  )
                ]),
            child: IconButton(
              icon: const Icon(
                Icons.favorite,
                color: kRedColor,
                size: 28,
              ),
              onPressed: () {
                final wasAdded = ref
                    .read(favoriteMealsProvider.notifier)
                    .toggleMealFavoriteStatus(selectedMeal);
                ScaffoldMessenger.of(context).clearSnackBars();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text(
                        wasAdded ? 'Meal added as favorite' : 'Meal removed'),
                  ),
                );
              },
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Hero(
              tag: 'dash' + selectedMeal.id,
              child: Image.network(selectedMeal.imageUrl)),
          Expanded(
            child: Transform.translate(
              offset: const Offset(0, -20),
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(40),
                  color: kDarkGreyColor,
                ),
                width: MediaQuery.of(context).size.width,
                child: MealInfo(selectedMeal: selectedMeal),
              ),
            ),
          )
        ],
      ),
    );
  }
}
