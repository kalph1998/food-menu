import 'package:riverpod/riverpod.dart';

class MealCategoryNotifier extends StateNotifier<String> {
  MealCategoryNotifier() : super('c1');

  setMealCategoryId(String id) {
    state = id;
  }
}

final mealCategoryProvider =
    StateNotifierProvider<MealCategoryNotifier, String>(
  (ref) => MealCategoryNotifier(),
);
