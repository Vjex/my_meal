import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../models/meal.dart';

class CategoryMealsScreen extends StatefulWidget {
  // final String categoryId;
  final List<Meal> availableMeal;

  CategoryMealsScreen(this.availableMeal);

  @override
  _CategoryMealsScreenState createState() => _CategoryMealsScreenState();
}

class _CategoryMealsScreenState extends State<CategoryMealsScreen> {
  Map<String, String> routeArgs;

  String categoryTitle;
  List<Meal> displayedMeals;

  var _loadedInitData = false;

  @override
  void initState() {
    //....
    super.initState();
  }

//This method is called every time buld is called. (we are using it bcz contextProvide bt this state
//class inside InitState () is not actually the context of the Widgets on the screeen hence code of
//this method cant be placed inside the InitState())
  @override
  void didChangeDependencies() {
    if (!_loadedInitData) {
      final routeArgs =
          (ModalRoute.of(context).settings.arguments as Map<String, String>);
      final String categoryId = routeArgs['id'];
      categoryTitle = routeArgs['title'];
      displayedMeals = widget.availableMeal.where((meal) {
        return meal.categories.contains(categoryId);
      }).toList();
      _loadedInitData = true;
    }
    super.didChangeDependencies();
  }

  // void _removeAMeal(String mealId) {
  //   setState(() {
  //     displayedMeals.removeWhere((meal) => meal.id == mealId);
  //   });
  // }

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
            title: displayedMeals[index].titile,
            imageUrl: displayedMeals[index].imageUrl,
            duration: displayedMeals[index].duration,
            complexity: displayedMeals[index].complexity,
            affordability: displayedMeals[index].affordability,
            // removeItem: _removeAMeal,
          );
        },
        itemCount: displayedMeals.length,
      ),
    );
  }
}
