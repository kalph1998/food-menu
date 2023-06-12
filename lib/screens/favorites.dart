import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/data/meal.dart';
import 'package:food_menu/providers/favorites_provider.dart';
import 'package:food_menu/widgets/homeAppBar.dart';
import 'package:food_menu/widgets/mainDrawer.dart';

class FavoritesScreen extends ConsumerWidget {
  static const routeName = '/favorites';
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Meal> favoriteMeals = ref.watch(favoriteMealsProvider);

    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: const HomeAppBar(
        title: 'Favorite meals',
        subtitle: 'Your favorite meals',
      ),
      drawer: const MainDrawer(),
      body: NoFavoritesCenterText(),
    );
  }
}

class NoFavoritesCenterText extends StatelessWidget {
  const NoFavoritesCenterText({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Text(
      'No Favorite meal added',
      style: TextStyle(
        color: kLightFontColor,
        fontSize: 18,
      ),
    ));
  }
}
