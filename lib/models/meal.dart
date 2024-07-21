import 'package:flutter/foundation.dart';

// Enum to represent the complexity level of a meal
enum Complexity {
  Simple, // Simple meal that is easy to prepare
  Challenging, // Meal that requires more effort and skill
  Hard, // Complex meal that is difficult to prepare
}

// Enum to represent the affordability level of a meal
enum Affordability {
  Affordable, // Meal that is budget-friendly
  Pricey, // Meal that is moderately expensive
  Luxurious, // Meal that is very expensive
}

// Defines the Meal class used to represent a meal in the app
class Meal {
  final String id; // Unique identifier for the meal
  final List<String> categories; // List of categories the meal belongs to
  final String title; // Title of the meal
  final String imageUrl; // URL to an image of the meal
  final List<String> ingredients; // List of ingredients used in the meal
  final List<String> steps; // List of steps to prepare the meal
  final int duration; // Duration of meal preparation in minutes
  final Complexity complexity; // Complexity level of the meal
  final Affordability affordability; // Affordability level of the meal
  final bool isGlutenFree; // Indicates if the meal is gluten-free
  final bool isLactoseFree; // Indicates if the meal is lactose-free
  final bool isVegan; // Indicates if the meal is vegan
  final bool isVegetarian; // Indicates if the meal is vegetarian

  // Constructor for Meal
  const Meal({
    @required this.id, // Required parameter for meal ID
    @required this.categories, // Required parameter for categories
    @required this.title, // Required parameter for meal title
    @required this.imageUrl, // Required parameter for image URL
    @required this.ingredients, // Required parameter for ingredients list
    @required this.steps, // Required parameter for steps list
    @required this.duration, // Required parameter for duration
    @required this.complexity, // Required parameter for complexity
    @required this.affordability, // Required parameter for affordability
    @required this.isGlutenFree, // Required parameter for gluten-free status
    @required this.isLactoseFree, // Required parameter for lactose-free status
    @required this.isVegan, // Required parameter for vegan status
    @required this.isVegetarian, // Required parameter for vegetarian status
  });
}
