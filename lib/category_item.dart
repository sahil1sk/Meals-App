import 'package:flutter/material.dart';

import './category_meals_screen.dart';

class CategoryItem extends StatelessWidget { 
  final String title;
  final Color color; // Color type is built in flutter not in dart

  CategoryItem(this.title, this.color);

  // this is funtion will trigger when someone tap the grid element
  void selectCategory(BuildContext ctx) {

    // so we are basically adding page above page using push // we using MaterialPageRoute we can also use cupertinoPageRoute
    Navigator.of(ctx).push(MaterialPageRoute(
      builder: (context) { // builder has it's own context
        // inside we will return the page which we want to show
        return CategoryMealsScreen();
      },
    ));
  }

  @override
  Widget build(BuildContext context) {
    return InkWell( // this widget will help to tap and double tap with wave effect otherwise we GestureDetector which doesn't give wave effect
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor, // this splash effect is availble in inK well give the color to splashes
      borderRadius: BorderRadius.circular(15),
      child: Container(
        padding: const EdgeInsets.all(15),
        child: Text(
          title,
          style: Theme.of(context).textTheme.headline6,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient( // setting linear gradient effect
            colors: [
              color.withOpacity(0.7), // little transparent
              color,                  // normal color which we pass
            ],
            begin: Alignment.topLeft, // gradient start from top left corner
            end: Alignment.bottomRight, // gradient end at bottom right corner
          ),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}