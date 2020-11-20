import 'package:flutter/material.dart';
import '../widgets/main_drawer.dart';

class FiltersScreen extends StatefulWidget {
  static const routeName = '/filters';

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFree = false;
  var _lactoseFree = false;
  var _vegetarian = false;
  var _vegan = false;

  Widget _buildSwitchListTile(
    String title, 
    String description, 
    bool currentValue,
    Function updateValue,
  ) {
    return SwitchListTile( // like listTile 
      title: Text(title),
      subtitle: Text(description),
      value: currentValue, 
      onChanged: updateValue,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters')
      ),
      drawer: MainDrawer(), // setting our drawer
      body: Column(
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(20),
            child: Text(
              'Adjust your meal selection.',
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          Expanded( // helps to take all the space
            child: ListView(
              children: <Widget>[
                _buildSwitchListTile(
                  'Gluten-free', 
                  'Only include gluten-free meals.', 
                  _glutenFree, 
                  (newVal) { // newVal pass by onChanged
                    setState(() {
                      _glutenFree = newVal;
                    });
                  }
                ),
                _buildSwitchListTile(
                  'Lactose-free', 
                  'Only include lactose-free meals.', 
                  _lactoseFree, 
                  (newVal) { // newVal pass by onChanged
                    setState(() {
                      _lactoseFree = newVal;
                    });
                  }
                ),
                _buildSwitchListTile(
                  'Vegetarian-free', 
                  'Only include vegetarian meals.', 
                  _vegetarian, 
                  (newVal) { // newVal pass by onChanged
                    setState(() {
                      _vegetarian = newVal;
                    });
                  }
                ),
                _buildSwitchListTile(
                  'Gluten-free', 
                  'Only include vegan meals.', 
                  _vegan, 
                  (newVal) { // newVal pass by onChanged
                    setState(() {
                      _vegan = newVal;
                    });
                  }
                ),
              ],
            ),
          ),
        ],
      ),
    ); 
  }
}