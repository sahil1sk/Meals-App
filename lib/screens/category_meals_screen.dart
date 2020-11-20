import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  // you can set the static route name so that without initialize we will use it anywhere
  static const routeName = '/category-meals'; 
  final List<Meal> availableMeals;

  CategoryMealsScreen(this.availableMeals);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  String categoryTitle;
  List <Meal> displayedMeals;
  var _loadedInitData = false;

  @override
  void initState() { 
    // initState is occur before creating any context that's why there is error to use context
    super.initState();    
  }

  @override
  void didChangeDependencies() {  // whenever the refrence of state changed this function is called and this function is called before build method
    super.didChangeDependencies();

    if(!_loadedInitData){   
      // Extracting the data from the route // context available in statefull globally
      final routeArgs = ModalRoute.of(context).settings.arguments as Map<String, String>;
      categoryTitle = routeArgs['title'];
      final categoryId = routeArgs['id'];
      displayedMeals = widget.availableMeals.where((meal) {
        return meal.categories.contains(categoryId); // where our id exists return that
      }).toList();

      _loadedInitData = true; // once the data is there we will not again get data when again this funtion called when setState trigger
    }
  }

   void _removeMeal(String mealId) {
    setState(() {
      displayedMeals.removeWhere((meal) => meal.id == mealId);
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) { 
          return MealItem(
            id: displayedMeals[index].id,
            title: displayedMeals[index].title,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            affordability: displayedMeals[index].affordability,
            complexity: displayedMeals[index].complexity,
            removeItem: _removeMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    ); 
  }
}