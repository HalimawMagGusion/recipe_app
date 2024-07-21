import 'package:flutter/material.dart';

// Defines the Category class used to represent a category in the app
class Category {
  final String id; // Unique identifier for the category
  final String title; // Display title of the category
  final Color color; // Background color associated with the category

  // Constructor for Category
  const Category({
    @required this.id, // Required parameter for category ID
    @required this.title, // Required parameter for category title
    this.color =
        Colors.orange, // Optional parameter with a default value of orange
  });
}
