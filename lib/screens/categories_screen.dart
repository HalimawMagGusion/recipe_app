import 'package:flutter/material.dart';

import '../dummy_data.dart'; // Importing dummy data for categories
import '../widgets/category_item.dart'; // Importing the widget for displaying a category item

// StatelessWidget representing the screen that displays categories
class CategoriesScreen extends StatelessWidget {
  // Constructor for CategoriesScreen
  const CategoriesScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GridView(
      padding: const EdgeInsets.all(25), // Padding around the grid
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200, // Maximum width of each grid item
        childAspectRatio:
            3 / 2, // Aspect ratio of each grid item (width / height)
        crossAxisSpacing:
            20, // Spacing between items in the horizontal direction
        mainAxisSpacing: 20, // Spacing between items in the vertical direction
      ),
      children: DUMMY_CATEGORIES // List of category data from dummy data
          .map(
            (catData) => CategoryItem(
              catData.id, // ID of the category
              catData.title, // Title of the category
              catData.color, // Color associated with the category
            ),
          )
          .toList(), // Convert the list of category items to a list of widgets
    );
  }
}
