import 'package:riverpod/riverpod.dart';

class MealCategoryNotifier extends StateNotifier<String> {
  MealCategoryNotifier() : super('');

  setMealCategoryId(String id) {
    state = id;
  }
}

final mealCategoryProvider =
    StateNotifierProvider((ref) => MealCategoryNotifier());
