import 'package:flutter/material.dart';
import '../screens/filters_screen.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
            leading: Icon(
              icon,
              size: 26,
            ),
            title: Text(
              title,
              style: TextStyle(
                fontFamily: 'RobotoCondensed',
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
            ),
            onTap: tapHandler,
          );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer( // helps to create the side bar
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft, // setting just like text_align
            color: Theme.of(context).accentColor,
            child: Text(
              'Cooking Up!',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          SizedBox(height: 20), // for giving space
          buildListTile(
            'Meals', 
            Icons.restaurant,
            () { // pushReplacementNamed replace the page with the given page not push any page
              Navigator.of(context).pushReplacementNamed('/');
            }
          ),
          buildListTile(
            'Filters', 
            Icons.settings,
            () {                     // when only using push use pushReplacement()
              Navigator.of(context).pushReplacementNamed(FiltersScreen.routeName);
            }
          ),         
        ],
      ),
    );
  }
}