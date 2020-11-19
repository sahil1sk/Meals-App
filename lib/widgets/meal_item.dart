import 'package:flutter/material.dart';
import '../models/meal.dart'; // for using Complexity type

class MealItem extends StatelessWidget {
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;

  MealItem({
    @required this.title, 
    @required this.imageUrl, 
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
  });

  void selectMeal() {}

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: selectMeal,
      child: Card(
        shape: RoundedRectangleBorder( // so here we override the shape of card
          borderRadius: BorderRadius.circular(15) 
        ),
        elevation: 4, // setting shadow effect
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack( // this wiget will help to add widget one over another
              children: <Widget>[
                ClipRRect( // this will make inside widget look like its our shape
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15), // giving radius to topleft corner
                    topRight: Radius.circular(15), // to topright corner
                  ),
                  child: Image.network( // using network because we getting image from url not from assets
                    imageUrl,
                    height: 250,
                    width: double.infinity,
                    fit: BoxFit.cover, // helps to fit into the cover
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}