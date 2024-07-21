import 'package:flutter/material.dart';

import '../dummy_data.dart'; // Importing dummy data

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail'; // Route name for navigation

  final Function toggleFavorite; // Function to toggle favorite status
  final Function isFavorite; // Function to check if a meal is a favorite

  // Constructor to initialize MealDetailScreen with toggleFavorite and isFavorite functions
  const MealDetailScreen(this.toggleFavorite, this.isFavorite, {Key key})
      : super(key: key);

  // Helper method to build section titles with custom styling
  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        text,
        style: Theme.of(context).textTheme.subtitle1.copyWith(
              fontSize: 20, // Font size for section title
              fontFamily: 'Hummington', // Custom font family
            ),
      ),
    );
  }

  // Helper method to build a container with decoration
  Widget buildContainer(Widget child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white, // Background color of the container
        border: Border.all(
          color: Color(0xFF50070D), // Border color
          width: 2.0, // Border width
        ),
        borderRadius: BorderRadius.circular(10), // Rounded corners
      ),
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.all(0),
      height: 300, // Fixed height of the container
      width: 300, // Fixed width of the container
      child: child, // Child widget to be displayed inside the container
    );
  }

  @override
  Widget build(BuildContext context) {
    // Extracting the meal ID from the route arguments
    final mealId = ModalRoute.of(context).settings.arguments as String;
    // Finding the selected meal from dummy data
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text(
            selectedMeal.title), // Displaying the meal title in the app bar
      ),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            SizedBox(
              child: Hero(
                tag:
                    'hero-tag-${selectedMeal.imageUrl}', // Unique tag for Hero animation
                child: Image.network(
                  selectedMeal.imageUrl,
                  fit: BoxFit.cover,
                  height: 300, // Image height
                  width: double.infinity, // Image width
                ),
              ),
            ),
            buildSectionTitle(context,
                'Ingredients'), // Building section title for ingredients
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 25,
                  ),
                  child: Text(selectedMeal
                      .ingredients[index]), // Displaying each ingredient
                ),
                itemCount: selectedMeal.ingredients.length,
              ),
            ),
            buildSectionTitle(
                context, 'Steps'), // Building section title for steps
            buildContainer(
              ListView.builder(
                itemBuilder: (ctx, index) => Column(
                  children: [
                    ListTile(
                      leading: CircleAvatar(
                        child: Text('${(index + 1)}'), // Step number
                      ),
                      title: Text(
                        selectedMeal.steps[index], // Displaying each step
                      ),
                    ),
                    const Divider() // Divider between steps
                  ],
                ),
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      // Floating action button to toggle favorite status
      floatingActionButton: FloatingActionButton(
        child: Icon(
          isFavorite(mealId)
              ? Icons.star
              : Icons.star_border, // Icon changes based on favorite status
        ),
        onPressed: () =>
            toggleFavorite(mealId), // Calling toggleFavorite function on press
      ),
    );
  }
}
