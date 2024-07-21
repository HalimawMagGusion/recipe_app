import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart'; // Importing the main drawer widget
import './favorites_screen.dart'; // Importing the Favorites screen
import './categories_screen.dart'; // Importing the Categories screen
import '../models/meal.dart'; // Importing the Meal model

class TabsScreen extends StatefulWidget {
  final List<Meal> favoriteMeals; // List of favorite meals passed to TabsScreen

  // Constructor to initialize TabsScreen with favoriteMeals
  const TabsScreen(this.favoriteMeals, {Key key}) : super(key: key);

  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  List<Map<String, Object>> _pages; // List of pages and titles
  int _selectedPageIndex = 0; // Index of the currently selected page

  @override
  void initState() {
    // Initializing the list of pages with corresponding titles
    _pages = [
      {
        'page': const CategoriesScreen(), // First page: CategoriesScreen
        'title': 'CookBox!', // Title for the Categories screen
      },
      {
        'page': FavoritesScreen(widget
            .favoriteMeals), // Second page: FavoritesScreen with favoriteMeals
        'title': 'Your Favorites', // Title for the Favorites screen
      },
    ];
    super.initState();
  }

  // Method to update the selected page index
  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index; // Updating the selected page index
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]
            ['title']), // Title of the app bar based on selected page
      ),
      drawer: const MainDrawer(), // Drawer for navigation
      body: _pages[_selectedPageIndex]
          ['page'], // Displaying the content of the selected page
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectPage, // Callback to handle page selection
        backgroundColor: Theme.of(context)
            .primaryColor, // Background color of the navigation bar
        unselectedItemColor:
            Color.fromARGB(110, 80, 7, 13), // Color for unselected items
        selectedItemColor:
            Theme.of(context).colorScheme.secondary, // Color for selected items
        currentIndex: _selectedPageIndex, // Current selected page index
        items: [
          BottomNavigationBarItem(
            backgroundColor:
                Theme.of(context).primaryColor, // Background color of the item
            icon: const Icon(Icons.category), // Icon for the Categories item
            label: 'Categories', // Label for the Categories item
          ),
          BottomNavigationBarItem(
            backgroundColor:
                Theme.of(context).primaryColor, // Background color of the item
            icon: const Icon(Icons.star), // Icon for the Favorites item
            label: 'Favorites', // Label for the Favorites item
          ),
        ],
      ),
    );
  }
}
