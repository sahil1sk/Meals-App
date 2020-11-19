import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,  // how many tabs we want
      initialIndex: 1, // which tab we want to show first // 0 is the default
      child: Scaffold(
        appBar: AppBar(
          title: Text('Meals'),
          bottom: TabBar( // setting all items inside the tab
            tabs: <Widget>[ // we add 2 Tab in list because we choose length of 2
              Tab(
                icon: Icon(Icons.category), // adding icon to the tab
                text: 'Category', // adding text on the tab
              ), 
              Tab(
                icon: Icon(Icons.star),
                text: 'Favorites',
              ),
            ],
          ),
        ),
        body: TabBarView( // setting tabBar View
          children: <Widget>[
            CategoriesScreen(),
            FavoritesScreen(),
          ],
        ),
      ),
    );
  }
}