import 'package:flutter/material.dart';

import './favorites_screen.dart';
import './categories_screen.dart';

class TabsScreen extends StatefulWidget {
  @override
  _TabsScreenState createState() => _TabsScreenState();
}

// Note:- the only difference b/w appBar TabBar and Bottom TabBar is that
// the appBar tabBar is controlled auto by flutter but bottom tabBar we will control that

class _TabsScreenState extends State<TabsScreen> {
  // making final list of pages
  final List<Map<String, Object>> _pages = [
    {
      'page': CategoriesScreen(), 
      'title': 'Categories'
    },
    {
      'page': FavoritesScreen(), 
      'title': 'Your Favorite'
    },
  ];
  int _selectedPageIndex = 0;

  void _selectPage(int index){ // auto get index by flutter which tab we select
    setState(() {
      _selectedPageIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_pages[_selectedPageIndex]['title']),
      ),
      body: _pages[_selectedPageIndex]['page'], // setting the page which we want to show
      bottomNavigationBar: BottomNavigationBar( // adding so that our tab will show at bottom
        onTap: _selectPage, // in this we pass the index on which item we click so set according to there index
        backgroundColor: Theme.of(context).primaryColor,
        unselectedItemColor: Colors.white,
        selectedItemColor: Theme.of(context).accentColor,
        currentIndex: _selectedPageIndex, // so here we pass which item is selected now
        type: BottomNavigationBarType.shifting, // for giving animation effect
        items: [
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            backgroundColor: Theme.of(context).primaryColor,
            icon: Icon(Icons.star),
            label: 'Favorites',
          ),
        ],
      ),
    );
  }
}