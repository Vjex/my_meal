import 'package:flutter/material.dart';

import '../Utils/dummy_data.dart';

class MealDetailScreen extends StatelessWidget {
  final Function toggleFavourateMeal;
  final Function isMealInFavourate;

  MealDetailScreen(this.toggleFavourateMeal, this.isMealInFavourate);

  Widget getSectionTitle(BuildContext context, String sectionTitle) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      child: Text(
        sectionTitle,
        style: Theme.of(context).textTheme.title,
      ),
    );
  }

  Widget getListContainer(Widget child) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(10),
        ),
        margin: const EdgeInsets.all(10),
        padding: const EdgeInsets.all(10),
        height: 150,
        width: 300,
        child: child);
  }

  @override
  Widget build(BuildContext context) {
    //getting meal id from the route on wh=hich user clicked.
    final mealId = ModalRoute.of(context).settings.arguments as String;
    final selectedMeal = DUMMY_MEALS.firstWhere((meal) => meal.id == mealId);

    return Scaffold(
      appBar: AppBar(
        title: Text('${selectedMeal.titile}'),
      ),
      body: Center(
        child: SingleChildScrollView(
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

              /////List of Ingredients
              getSectionTitle(context, 'Ingredients'),
              getListContainer(
                ListView.builder(
                  itemCount: selectedMeal.ingredients.length,
                  itemBuilder: (ctx, index) => Card(
                    color: Theme.of(context).accentColor,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: 5,
                        horizontal: 10,
                      ),
                      child: Text(
                        selectedMeal.ingredients[index],
                      ),
                    ),
                  ),
                ),
              ),

              //List of Steps
              getSectionTitle(context, 'Steps'),

              getListContainer(
                ListView.builder(
                  itemBuilder: (ctx, index) => Column(
                    children: <Widget>[
                      ListTile(
                        leading: CircleAvatar(
                          child: Text('# ${index + 1}'),
                        ),
                        title: Text(selectedMeal.steps[index]),
                      ),
                      Divider(),
                    ],
                  ),
                  itemCount: selectedMeal.steps.length,
                ),
              )
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
          child: Icon(
            isMealInFavourate(mealId) ? Icons.star : Icons.star_border,
          ),
          onPressed: () {
            toggleFavourateMeal(mealId);
            // //Poping this page and passing the mealId to delete the meal Item from the list Partially.
            // Navigator.of(context).pop(mealId);
          }),
    );
  }
}
