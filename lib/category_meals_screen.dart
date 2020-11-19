import 'package:flutter/material.dart';
import './dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // you can set the static route name so that without initialize we will use it anywhere
  static const routeName = '/category-meals'; 

  @override
  Widget build(BuildContext context) {
    // Extracting the data from the route
    final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
    final categoryTitle = routeArgs['title'];
    final categoryId = routeArgs['id'];
    final categoryMeals = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId); // where our id exists return that
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) { 
          return Text(categoryMeals[index].title);
        },
        itemCount: categoryMeals.length,
      ),
    ); 
  }
}