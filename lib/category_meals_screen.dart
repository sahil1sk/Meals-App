import 'package:flutter/material.dart';

class CategoryMealsScreen extends StatelessWidget {
  // you can set the static route name so that without initialize we will use it anywhere
  static const routeName = '/category-meals'; 

  @override
  Widget build(BuildContext context) {
    // Extracting the data from the route
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: Center(
        child: Text(
          'The Recipes For the Category!',
        ),
      ),
    ); 
  }
}