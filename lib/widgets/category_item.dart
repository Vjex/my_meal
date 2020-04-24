import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class CategoryItem extends StatelessWidget {
  final String id;
  final String title;
  final Color color;

  CategoryItem(this.id, this.title, this.color);

//Navigating to the CategoryMeal PAge.
  void selectCategory(BuildContext ctx) {
    Navigator.of(ctx).pushNamed(
      Constants.CATEGORY_MEAL_ROUTE,
      arguments: {
        'id': id,
        'title': title,
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => selectCategory(context),
      splashColor: Theme.of(context).primaryColor,
      borderRadius: BorderRadius.circular(
          15), //same as teh Conatiner just get good effect.
      child: Container(
        padding: const EdgeInsets.all(
          15,
        ), //added const to improve performanc so that on rebuild this EdgeInset will not required to rebuild as its a static constant.
        child: Text(
          title,
          style: Theme.of(context).textTheme.title,
        ),
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.withOpacity(0.7),
              color,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(15),
        ), //inside colors: (initial color, final color)
      ),
    );
  }
}
