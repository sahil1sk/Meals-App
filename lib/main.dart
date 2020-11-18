import 'package:flutter/material.dart';

import './categories_screen.dart';
import './category_meals_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'DeliMeals',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway', // giving the fontfamily to the app
        textTheme: ThemeData.light().textTheme.copyWith( // setting the new color and style for body and headings
          bodyText1: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          bodyText2: TextStyle(
            color: Color.fromRGBO(20, 51, 51, 1),
          ),
          headline6: TextStyle( 
            fontSize: 20,
            fontFamily: 'RobotoCondensed',
            fontWeight: FontWeight.bold,
          ),
        )
      ),
      //home: CategoriesScreen(),
      initialRoute: '/', // adding the initial route you can also add other like /abc
      routes: { // setting the routes // we use this approach so that it's clear how many routes there are
        '/': (ctx) => CategoriesScreen(), // flutter always go to / this route first but you can also add initial route
        CategoryMealsScreen.routeName: (ctx) => CategoryMealsScreen(), 
      },
    );
  }
}
