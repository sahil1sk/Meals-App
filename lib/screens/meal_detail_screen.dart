import 'package:flutter/material.dart';

import '../dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  static const routeName = '/meal-detail'; // giving routename

  final Function toggleFavorite;
  final Function isFavorite;

  MealDetailScreen(this.toggleFavorite, this.isFavorite);

  Widget buildSectionTitle(BuildContext context, String text) {
    return Container(
            margin: EdgeInsets.symmetric(vertical: 10),
            child: Text(
              text,
              style: Theme.of(context).textTheme.headline6, // giving the style of heading6 which define in main.dart file
            ),
          );
  }

  Widget buildContainer({Widget child}){ // {} for passing as name argument
    return Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10),
            ),
            margin: EdgeInsets.all(10),
            padding: EdgeInsets.all(10),
            height: 150, // we are also able to set height and width using media query
            width: 300,
            child: child,
    );
  }

  @override
  Widget build(BuildContext context) {
    final mealId = ModalRoute.of(context).settings.arguments as String;
    // firstWhere return the element not the iterable 
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(title: Text('${selectedMeal.title}')),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Container(
              height: 300,
              width: double.infinity,
              child: Image.network(
                selectedMeal.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
            FlatButton.icon(
              icon: Icon(isFavorite(mealId) ? Icons.star : Icons.star_border),
              onPressed: () => toggleFavorite(mealId), 
              label: Text(isFavorite(mealId) ? 'Favorite' : 'Add Favorite'),
            ),
            buildSectionTitle(context, 'Ingredients'),
            buildContainer(
              child: ListView.builder( // adding dynamic list
                  itemBuilder: (ctx, index) { //builder function context and index
                    return Card(
                      color: Theme.of(context).accentColor,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: 5, 
                          horizontal:10,
                        ),
                        child: Text(selectedMeal.ingredients[index])
                      ),
                    );
                  },
                  itemCount: selectedMeal.ingredients.length,
                ),
            ),
            buildSectionTitle(context, 'Steps'),
            buildContainer(
              child: ListView.builder(
                itemBuilder: (ctx, index) {
                  return Column(
                    children: [
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${(index + 1)}'), // showing Numbering using index
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(), // this will draw the horizontal line
                    ],
                  );
                },
                itemCount: selectedMeal.steps.length,
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(
          Icons.delete,
          color: Colors.white,
        ),
        onPressed: () {
          Navigator.of(context).pop(mealId); // so here passing back we mealId
        },
      ),
    );
  }
}