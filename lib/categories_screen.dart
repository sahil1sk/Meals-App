import 'package:flutter/material.dart';

import './dummy_data.dart';
import './category_item.dart';

class CategoriesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('DeliMeal'), 
      ),
      body: GridView(
        padding: const EdgeInsets.all(15),
        children: DUMMY_CATEGORIES
          .map((catData) => CategoryItem(
              catData.title,
              catData.color,
            )
          ).toList(),
        // Like listView we have GridView, we can also make GridViewBuilder For dynamic like we do for ListView Builder
        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
          maxCrossAxisExtent: 200,  // width of each box
          childAspectRatio: 3 / 2,  // height
          crossAxisSpacing: 20,  // generating the spacing
          mainAxisSpacing: 20,   // for spacing
        ),  
      )
    ); 
  }
}