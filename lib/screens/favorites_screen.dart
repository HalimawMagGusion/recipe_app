import 'package:flutter/material.dart';

import '../models/meal.dart'; // Importing the Meal model
import '../widgets/meal_item.dart'; // Importing the widget to display meal items

// StatelessWidget to display a list of favorite meals
class FavoritesScreen extends StatelessWidget {
  final List<Meal> favoriteMeals; // List of favorite meals

  // Constructor accepting the list of favorite meals
  const FavoritesScreen(this.favoriteMeals, {Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // If there are no favorite meals, show a message
    if (favoriteMeals.isEmpty) {
      return const Center(
        child: Text('You have no favorites yet - start adding some!'),
      );
    } else {
      // If there are favorite meals, display them in a ListView
      return ListView.builder(
        itemBuilder: (ctx, index) {
          // Building a meal item for each favorite meal
          return MealItem(
            id: favoriteMeals[index].id,
            title: favoriteMeals[index].title,
            imageUrl: favoriteMeals[index].imageUrl,
            duration: favoriteMeals[index].duration,
            affordability: favoriteMeals[index].affordability,
            complexity: favoriteMeals[index].complexity,
          );
        },
        itemCount: favoriteMeals.length, // Number of items in the list
      );
    }
  }
}
