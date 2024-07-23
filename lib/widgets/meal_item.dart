import 'package:flutter/material.dart';

import '../screens/meal_detail_screen.dart';
import '../models/meal.dart';

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  const MealItem({
    Key key,
    @required this.id,
    @required this.title,
    @required this.imageUrl,
    @required this.affordability,
    @required this.complexity,
    @required this.duration,
  }) : super(key: key);

  // Returns a string representing the complexity of the meal
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
      case Complexity.Challenging:
        return 'Challenging';
      case Complexity.Hard:
        return 'Hard';
      default:
        return 'Unknown';
    }
  }

  // Returns a string representing the affordability of the meal
  String get affordabilityText {
    switch (affordability) {
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  // Navigates to the MealDetailScreen when a meal item is tapped
  void selectMeal(BuildContext context) {
    Navigator.of(context)
        .pushNamed(
      MealDetailScreen.routeName,
      arguments: id,
    )
        .then((result) {
      if (result != null) {
        // Optional: handle the result (e.g., remove item from favorites)
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context), // Navigate to meal details on tap
      child: Card(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(15), // Rounded corners for the card
        ),
        elevation: 5, // Shadow effect for the card
        margin: const EdgeInsets.all(20), // Margin around the card
        color:
            Color.fromARGB(255, 248, 234, 220), // Background color of the card
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Hero(
                  tag:
                      'hero-tag-$imageUrl', // Unique tag for the hero transition
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                    ),
                    child: Image.network(
                      imageUrl,
                      height: 250, // Height of the image
                      width: double.infinity, // Full width of the card
                      fit: BoxFit.cover, // Cover the entire space
                    ),
                  ),
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  left: 0, // Ensure the gradient spans the full width
                  child: FractionallySizedBox(
                    widthFactor: 1, // Full width
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          colors: [
                            Colors.transparent, // Gradient Start Color
                            Color.fromARGB(
                                207, 33, 33, 33) // Gradient End Color
                          ],
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                        ),
                      ),
                      padding: const EdgeInsets.only(
                        top: 50,
                        bottom: 10,
                      ),
                      child: Align(
                        alignment: Alignment.center,
                        child: Padding(
                          padding: const EdgeInsets.only(
                              left: 0), // Horizontal padding for the text
                          child: Text(
                            title,
                            style: const TextStyle(
                              fontSize: 18, // Font size for the title
                              color: Colors.white, // Color of the title text
                            ),
                            softWrap: true,
                            overflow:
                                TextOverflow.fade, // Text overflow handling
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(20), // Padding around the info row
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.schedule,
                        color: Color(0xFF50070D), // Icon color
                      ),
                      const SizedBox(
                        width: 6, // Space between icon and text
                      ),
                      Text('$duration min'), // Display duration
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.work,
                        color: Color(0xFF50070D), // Icon color
                      ),
                      const SizedBox(
                        width: 6, // Space between icon and text
                      ),
                      Text(complexityText), // Display complexity
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(
                        Icons.attach_money,
                        color: Color(0xFF50070D), // Icon color
                      ),
                      const SizedBox(
                        width: 0, // Space between icon and text
                      ),
                      Text(affordabilityText), // Display affordability
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
