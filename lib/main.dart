import 'package:flutter/material.dart';

import './screens/meal_detail.dart';
import './Utils/constants.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Meal',
      theme: ThemeData(
        primarySwatch: Colors.pink,
        accentColor: Colors.amber,
        canvasColor: Color.fromRGBO(255, 254, 229, 1),
        fontFamily: 'Raleway',
        textTheme: ThemeData.light().textTheme.copyWith(
              body1: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              body2: TextStyle(
                color: Color.fromRGBO(20, 51, 51, 1),
              ),
              title: TextStyle(
                fontSize: 20,
                fontFamily: 'RobotoCondensed',
                fontWeight: FontWeight.bold,
              ),
            ),
      ),
      // home: CategoriesScreen(),
      initialRoute: Constants.INITIAL_ROUTE,
      routes: {
        Constants.INITIAL_ROUTE: (ctx) => CategoriesScreen(),
        Constants.CATEGORY_MEAL_ROUTE: (ctx) => CategoryMealsScreen(),
        Constants.SINLE_MEAL_DETAIL_ROUTE: (ctx) => MealDetail(),
      },
      onGenerateRoute: (settings) {
        //To add a
        print(settings);
        // if(settings.name == '/meal-detail'){

        // }else{

        // }
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
