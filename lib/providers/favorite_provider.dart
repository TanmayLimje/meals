import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:meals/models/meal.dart';

class FavoriteMealProvider extends StateNotifier<List<Meal>> {
  FavoriteMealProvider() : super([]);

  void toggleMealFavouriteStatus(Meal meal) {
    final mealIsFav = state.contains(meal);

    if (mealIsFav) {
      state = state.where((m) => m.id != meal.id).toList();
    } else {
      state = [...state, meal];
    }

    state = [];
  }
}

final favoriteMealsProvider =
    StateNotifierProvider<FavoriteMealProvider, List<Meal>>((ref) {
  return FavoriteMealProvider();
});
