import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart'; // Importing the main drawer widget

// StatefulWidget for managing filters settings
class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters'; // Route name for navigation

  final Function saveFilters; // Function to save the filters
  final Map<String, bool> currentFilters; // Current filter settings

  // Constructor to initialize FiltersScreen with currentFilters and saveFilters
  const FiltersScreen(this.currentFilters, this.saveFilters, {Key key})
      : super(key: key);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  // Variables to store filter states
  bool _glutenFree = false;
  bool _vegetarian = false;
  bool _vegan = false;
  bool _lactoseFree = false;

  @override
  void initState() {
    // Initializing filter states from currentFilters
    _glutenFree = widget.currentFilters['gluten'];
    _lactoseFree = widget.currentFilters['lactose'];
    _vegetarian = widget.currentFilters['vegetarian'];
    _vegan = widget.currentFilters['vegan'];
    super.initState();
  }

  // Helper method to build a switch list tile for filters
  Widget _buildSwitchListTile(
    String title,
    String description,
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile(
      title: Text(title),
      value: currentValue,
      subtitle: Text(description),
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'), // App bar title
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.save), // Save icon
            onPressed: () {
              // Creating a map of selected filters
              final selectedFilters = {
                'gluten': _glutenFree,
                'lactose': _lactoseFree,
                'vegan': _vegan,
                'vegetarian': _vegetarian,
              };
              widget.saveFilters(
                  selectedFilters); // Calling the saveFilters function
            },
          )
        ],
      ),
      drawer: const MainDrawer(), // Drawer widget for navigation
      body: Column(
        children: <Widget>[
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection', // Header text
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(fontSize: 18), // Customizing text style
            ),
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free',
                  'Only include gluten-free meals.',
                  _glutenFree,
                  (newValue) {
                    setState(() {
                      _glutenFree = newValue; // Updating state
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Lactose-free',
                  'Only include lactose-free meals.',
                  _lactoseFree,
                  (newValue) {
                    setState(() {
                      _lactoseFree = newValue; // Updating state
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegetarian',
                  'Only include vegetarian meals.',
                  _vegetarian,
                  (newValue) {
                    setState(() {
                      _vegetarian = newValue; // Updating state
                    });
                  },
                ),
                _buildSwitchListTile(
                  'Vegan',
                  'Only include vegan meals.',
                  _vegan,
                  (newValue) {
                    setState(() {
                      _vegan = newValue; // Updating state
                    });
                  },
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
