import 'package:flutter/material.dart';

import '../screens/filters_screen.dart'; // Importing the FiltersScreen

class MainDrawer extends StatelessWidget {
  const MainDrawer({Key key}) : super(key: key);

  // Helper method to create a ListTile for the drawer
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon, // Icon to display
        size: 26, // Size of the icon
      ),
      title: Text(
        title, // Title of the ListTile
        style: const TextStyle(
          fontFamily: 'Hummington', // Font family for the title
          fontSize: 23, // Font size for the title
          fontWeight: FontWeight.bold, // Font weight for the title
        ),
      ),
      onTap: tapHandler, // Callback function when the ListTile is tapped
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          // Header of the drawer with title
          Container(
            height: 180, // Height of the header
            width: double
                .infinity, // Width of the header, full width of the drawer
            padding: const EdgeInsets.all(20), // Padding inside the header
            alignment: Alignment.centerLeft, // Alignment of the text
            color: const Color(0xFF50070D), // Background color of the header
            child: const Text(
              'CookBox!', // Title text
              style: TextStyle(
                  fontWeight: FontWeight.w900, // Font weight for the title
                  fontSize: 30, // Font size for the title
                  color: Color(0xFFFCE6CF)), // Color of the title text
            ),
          ),
          const SizedBox(
            height: 20, // Space between header and drawer items
          ),
          // ListTile for navigating to the meals screen
          buildListTile('Meals', Icons.restaurant, () {
            Navigator.of(context).pushReplacementNamed('/');
          }),
          // ListTile for navigating to the filters screen
          buildListTile('Filters', Icons.settings, () {
            Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
          }),
        ],
      ),
    );
  }
}
