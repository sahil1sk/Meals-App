import 'package:flutter/material.dart';

import '../screens/meal_detail_screen.dart';
import '../models/meal.dart'; // for using Complexity type

class MealItem extends StatelessWidget {
  final String id;
  final String title;
  final String imageUrl;
  final int duration;
  final Complexity complexity;
  final Affordability affordability;
  final Function removeItem;

  MealItem({
    @required this.id,
    @required this.title, 
    @required this.imageUrl, 
    @required this.duration,
    @required this.complexity,
    @required this.affordability,
    @required this.removeItem,
  });

  // for calculating complexity level we using gatter
  String get complexityText {
    switch (complexity) {
      case Complexity.Simple:
        return 'Simple';
        break;
      case Complexity.Challenging:
        return 'Challenging';
        break;
      case Complexity.Hard:
        return 'Hard';
        break;
      default:
        return 'Unknown';
    }
  }

  // for getting affordability we use this getter
  String get affordabilityText {
    switch (affordability){
      case Affordability.Affordable:
        return 'Affordable';
      case Affordability.Pricey:
        return 'Pricey';
      case Affordability.Luxurious:
        return 'Expensive';
      default:
        return 'Unknown';
    }
  }

  // this function will trigger when we click any card
  void selectMeal(BuildContext ctx) {
    // going to meal detail route and passing id as argument
    Navigator.of(ctx).pushNamed(
      MealDetailScreen.routeName, 
      arguments: id
    ).then((result) { // .then is trigger when we come back from the pushed page
      // we will get result if pass any data through the pop method
      if(result != null) {
        removeItem(result);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectMeal(context),
      child: Card(
        shape: RoundedRectangleBorder( // so here we override the shape of card
          borderRadius: BorderRadius.circular(15) 
        ),
        elevation: 4, // setting shadow effect
        margin: EdgeInsets.all(10),
        child: Column(
          children: <Widget>[
            Stack( // this wiget will help to add widget one over another
              children: <Widget>[ // in stack bottom children will write first
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
                Positioned( // In Stack Positioned widget is help to set the position of the child element
                  bottom: 20, // distance from bottom
                  right: 10,  // distance from right
                  child: Container(
                    padding: EdgeInsets.symmetric(
                      vertical: 5,
                      horizontal: 20,
                    ),
                    width: 300, 
                    color: Colors.black54, // transparent black
                    child: Text(
                      title,
                      style: TextStyle(
                        fontSize: 26,
                        color: Colors.white,
                      ),
                      softWrap: true, // if text length is large then come to next line
                      overflow: TextOverflow.fade, // if the text is large and not fitted then fade it means don't show it normally
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.all(20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Icon(Icons.schedule),
                      SizedBox(width: 6), // for little spacing
                      Text('$duration min'),                 
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.work),
                      SizedBox(width: 6), // for little spacing
                      Text(complexityText),                 
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Icon(Icons.attach_money),
                      SizedBox(width: 6), // for little spacing
                      Text(affordabilityText),                 
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}