import 'package:flutter/material.dart';

import '../widgets/meal_item.dart'; // Importing the widget to display meal items
import '../models/meal.dart'; // Importing the Meal model

// StatefulWidget to handle the screen displaying meals for a specific category
class CategoryMealsScreen extends StatefulWidget {
  static const routeName =
      '/category-meals'; // Static route name for navigation

  final List<Meal> availableMeals; // List of all available meals

  // Constructor accepting the list of available meals
  const CategoryMealsScreen(this.availableMeals, {Key key}) : super(key: key);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle; // Title of the category
  List<Meal> displayedMeals; // List of meals to display
  var _loadedInitData =
      false; // Flag to check if initialization data has been loaded

  @override
  void initState() {
    // Initialization logic if needed (currently empty)
    super.initState();
  }

  @override
  void didChangeDependencies() {
    // Called when dependencies change
    if (!_loadedInitData) {
      // Retrieving route arguments
      final routeArgs =
          ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title']; // Extracting category title
      final categoryId = routeArgs['id']; // Extracting category ID
      // Filtering meals based on the selected category ID
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true; // Setting flag to true after loading data
    }
    super.didChangeDependencies();
  }

  void _removeMeal(String mealId) {
    // Method to remove a meal from the displayed list
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:
            Text(categoryTitle), // Displaying the category title in the app bar
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          // Building a meal item for each meal in the displayed list
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
          );
        },
        itemCount: displayedMeals.length, // Number of items in the list
      ),
    );
  }
}
