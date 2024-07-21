import 'package:flutter/material.dart';

import './dummy_data.dart'; // Importing dummy data used in the app
import './screens/tabs_screen.dart'; // Importing the tabs screen
import './screens/meal_detail_screen.dart'; // Importing the meal detail screen
import './screens/category_meals_screen.dart'; // Importing the category meals screen
import './screens/filters_screen.dart'; // Importing the filters screen
import './screens/categories_screen.dart'; // Importing the categories screen
import './models/meal.dart'; // Importing the Meal model

void main() => runApp(MyApp()); // Entry point of the application

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // Default filter settings
  Map<String, bool> _filters = {
    'gluten': false,
    'lactose': false,
    'vegan': false,
    'vegetarian': false,
  };

  // List of meals available based on the filters
  List<Meal> _availableMeals = DUMMY_MEALS;

  // List of favorite meals
  final List<Meal> _favoriteMeals = [];

  // Method to set the filters and update the available meals accordingly
  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      // Filtering the meals based on the selected filters
      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['gluten'] == true && !meal.isGlutenFree) {
          return false;
        }
        if (_filters['lactose'] == true && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['vegan'] == true && !meal.isVegan) {
          return false;
        }
        if (_filters['vegetarian'] == true && !meal.isVegetarian) {
          return false;
        }
        return true;
      }).toList();
    });
  }

  // Method to toggle the favorite status of a meal
  void _toggleFavorite(String mealId) {
    final existingIndex =
        _favoriteMeals.indexWhere((meal) => meal.id == mealId);
    if (existingIndex >= 0) {
      setState(() {
        _favoriteMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favoriteMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  // Method to check if a meal is favorite
  bool _isMealFavorite(String id) {
    return _favoriteMeals.any((meal) => meal.id == id);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Recipe_app', // Title of the app
      theme: ThemeData(
        primarySwatch: MaterialColor(0xFFfdc195, {
          50: Color(0xFFfef7f2),
          100: Color(0xFFfceee1),
          200: Color(0xFFf9ddc4),
          300: Color(0xFFfdc195),
          400: Color(0xFFfbb984),
          500: Color(0xFFf9b76b),
          600: Color(0xFFf8a45f),
          700: Color(0xFFf78c52),
          800: Color(0xFFf57346),
          900: Color(0xFFf45530),
        }), // Custom primary color swatch
        appBarTheme: AppBarTheme(
          titleTextStyle: TextStyle(
            fontFamily: 'Hummington',
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Color(0xFF50070D),
          ),
        ),
        accentColor: Color(0xFF50070D), // Accent color for the app
        canvasColor: Color(0xFFFCE6CF), // Background color for the app
        fontFamily: 'Hummington', // Default font for the app
        textTheme: ThemeData.light().textTheme.copyWith(
            bodyText1: TextStyle(
              color: Color(0xFF50070D),
              fontFamily: 'Hummington',
            ),
            bodyText2: TextStyle(
              color: Color(0xFF50070D),
              fontFamily: 'Hummington',
            ),
            subtitle1: TextStyle(
              fontSize: 14,
              fontFamily: 'Hummington',
              fontWeight: FontWeight.bold,
            )),
      ),
      initialRoute: '/', // Initial route of the app
      routes: {
        '/': (ctx) => TabsScreen(_favoriteMeals), // Route for the tabs screen
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(
            _availableMeals), // Route for the category meals screen
        MealDetailScreen.routeName: (ctx) => MealDetailScreen(_toggleFavorite,
            _isMealFavorite), // Route for the meal detail screen
        FiltersScreen.routeName: (ctx) => FiltersScreen(
            _filters, _setFilters), // Route for the filters screen
      },
      onGenerateRoute: (settings) {
        print(settings.arguments); // Print the route settings arguments
        return null;
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) =>
              CategoriesScreen(), // Fallback route if an unknown route is accessed
        );
      },
    );
  }
}
