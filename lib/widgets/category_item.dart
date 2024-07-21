import 'package:flutter/material.dart';

import '../screens/category_meals_screen.dart'; // Importing the CategoryMealsScreen

class CategoryItem extends StatelessWidget {
  final String id; // Identifier for the category
  final String title; // Title of the category
  final Color color; // Color associated with the category

  // Constructor to initialize CategoryItem with id, title, and color
  const CategoryItem(this.id, this.title, this.color, {Key key})
      : super(key: key);

  // Method to handle the selection of a category and navigate to CategoryMealsScreen
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      CategoryMealsScreen.routeName, // Route name for the CategoryMealsScreen
      arguments: {
        'id': id, // Passing the category id
        'title': title, // Passing the category title
      },
    );
  }

  // Method to build a section title widget
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontSize: 18, // Font size for the section title
              fontFamily: 'Hummington', // Font family for the section title
            ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () =>
          selectCategory(context), // Triggering selectCategory method on tap
      splashColor: Theme.of(context).primaryColor, // Color of the splash effect
      borderRadius:
          BorderRadius.circular(15), // Border radius for the InkWell widget
      child: Container(
        padding: const EdgeInsets.all(15), // Padding inside the container
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.4), // Start color with opacity
              color, // End color
            ],
            begin: Alignment.topLeft, // Gradient starts from the top left
            end: Alignment.bottomRight, // Gradient ends at the bottom right
          ),
          borderRadius:
              BorderRadius.circular(15), // Border radius for the container
        ),
        child: Text(
          title, // Displaying the category title
          style: Theme.of(context).textTheme.bodyText1.copyWith(
                fontSize: 17, // Font size for the category title
              ),
        ),
      ),
    );
  }
}
