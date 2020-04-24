import 'package:flutter/material.dart';

import '../models/meal.dart';
import '../widgets/meal_item.dart';

class FavouratesScreen extends StatelessWidget {
  final List<Meal> favourateMeal;

  FavouratesScreen(this.favourateMeal);

  @override
  Widget build(BuildContext context) {
    if (favourateMeal.isEmpty) {
      return Center(
        child: Text('You have no favourates yet - Start adding some!!'),
      );
    } else {
      return ListView.builder(
        itemBuilder: (ctx, index) {
          return MealItem(
            id: favourateMeal[index].id,
            title: favourateMeal[index].titile,
            imageUrl: favourateMeal[index].imageUrl,
            duration: favourateMeal[index].duration,
            complexity: favourateMeal[index].complexity,
            affordability: favourateMeal[index].affordability,
          );
        },
        itemCount: favourateMeal.length,
      );
    }
  }
}
