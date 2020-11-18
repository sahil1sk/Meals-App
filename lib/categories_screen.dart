import 'package:flutter/material.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GridView(
      children: <Widget>[

      ],
      // Like listView we have GridView, we can also make GridViewBuilder For dynamic like we do for ListView Builder
      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 200,  // width of each box
        childAspectRatio: 3 / 2,  // height
        crossAxisSpacing: 20,  // generating the spacing
        mainAxisSpacing: 20,   // for spacing
      ),
      
    );
  }
}