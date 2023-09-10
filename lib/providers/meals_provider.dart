import 'package:food_menu/data/dummy_data.dart';
import 'package:food_menu/models/meal.dart';
import 'package:riverpod/riverpod.dart';

class MealsNotifier extends StateNotifier<List<Meal>> {
  MealsNotifier() : super(dummyMeals);

  addMeal(Meal meal) {
    state = [...state, meal];
  }
}

final mealsProvider = StateNotifierProvider<MealsNotifier, List<Meal>>((ref) {
  return MealsNotifier();
});
