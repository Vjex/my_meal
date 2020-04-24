import 'package:flutter/material.dart';

import '../widgets/meal_item.dart';
import '../Utils/dummy_data.dart';

class CategoryMealsScreen extends StatelessWidget {
  // final String categoryId;
  // final String categoryTitle;

  // CategoryMealsScreen(this.categoryId, this.categoryTitle);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context).settings.arguments as Map<String, String>;
    final String categoryId = routeArgs['id'];
    final String categoryTitle = routeArgs['title'];
    final categoryMealsFiltered = DUMMY_MEALS.where((meal) {
      return meal.categories.contains(categoryId);
    }).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(categoryTitle),
      ),
      body: ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: categoryMealsFiltered[index].id,
            title: categoryMealsFiltered[index].titile,
            imageUrl: categoryMealsFiltered[index].imageUrl,
            duration: categoryMealsFiltered[index].duration,
            complexity: categoryMealsFiltered[index].complexity,
            affordability: categoryMealsFiltered[index].affordability,
          );
        },
        itemCount: categoryMealsFiltered.length,
      ),
    );
  }
}
