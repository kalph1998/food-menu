import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/models/meal.dart';
import 'package:food_menu/providers/favorites_provider.dart';
import 'package:food_menu/widgets/app_bar.dart';
import 'package:food_menu/widgets/main_drawer.dart';
import 'package:food_menu/widgets/meal_tile.dart';

class FavoritesScreen extends ConsumerWidget {
  static const routeName = '/favorites';
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<Meal> favoriteMeals = ref.watch(favoriteMealsProvider);

    return Scaffold(
        backgroundColor: kDarkColor,
        appBar: const HomeAppBar(
          title: 'Favorite meals',
          subtitle: 'Your favorite meals',
        ),
        drawer: const MainDrawer(),
        body: favoriteMeals.isEmpty
            ? const NoFavoritesCenterText()
            : Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
                child: GridView.builder(
                  itemCount: favoriteMeals.length,
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
                      meal: favoriteMeals[index],
                    );
                  },
                ),
              ));
  }
}

class NoFavoritesCenterText extends StatelessWidget {
  const NoFavoritesCenterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Center(
        child: Text(
      'No Favorite meal added',
      style: TextStyle(
        color: kLightFontColor,
        fontSize: 18,
      ),
    ));
  }
}
