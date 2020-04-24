import 'package:flutter/material.dart';

import './Utils/dummy_data.dart';
import './models/meal.dart';
import './screens/filters_screen.dart';
import './screens/tabs_screen.dart';
import './screens/meal_detail_screen.dart';
import './Utils/constants.dart';
import './screens/category_meals_screen.dart';
import './screens/categories_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Map<String, bool> _filters = {
    'isGluttenFree': false,
    'isLactoseFree': false,
    'isVegan': false,
    'isVegetarian': false,
  };

  List<Meal> _availableMeals = DUMMY_MEALS;

  List<Meal> _favourateMeals = [];

  void _setFilters(Map<String, bool> filterData) {
    setState(() {
      _filters = filterData;

      _availableMeals = DUMMY_MEALS.where((meal) {
        if (_filters['isGluttenFree'] && !meal.isGluttenFree) {
          return false;
        }
        if (_filters['isLactoseFree'] && !meal.isLactoseFree) {
          return false;
        }
        if (_filters['isVegan'] && meal.isVegan) {
          return false;
        }
        if (_filters['isVegetarian'] && meal.isVegetarian) {
          return false;
        }

        return true;
      }).toList();
    });
  }

  void _toggleFavouateMeal(String mealId) {
    //getting the the meal is present by getting its index otherwise it will return -1; if no match found;
    final existingIndex =
        _favourateMeals.indexWhere((meal) => meal.id == mealId);

    if (existingIndex >= 0) {
      setState(() {
        _favourateMeals.removeAt(existingIndex);
      });
    } else {
      setState(() {
        _favourateMeals.add(
          DUMMY_MEALS.firstWhere((meal) => meal.id == mealId),
        );
      });
    }
  }

  bool _isMealInFavourate(String id) {
    return _favourateMeals.any((meal) => meal.id == id);
  }

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
        Constants.INITIAL_ROUTE: (ctx) => TabsScreen(_favourateMeals),
        Constants.CATEGORY_MEAL_ROUTE: (ctx) => CategoryMealsScreen(
              _availableMeals,
            ),
        Constants.SINLE_MEAL_DETAIL_ROUTE: (ctx) => MealDetailScreen(
              _toggleFavouateMeal,
              _isMealInFavourate,
            ),
        Constants.FILTERS_PAGE_ROUTE: (ctx) => FiltersScreen(
              _filters,
              _setFilters,
            ),
      },
      // onGenerateRoute: (settings) {
      //   //To add a dyanmic route to the app
      //   //print(settings);
      //   // if(settings.name == '/meal-detail'){

      //   // }else{

      //   // }
      //   return MaterialPageRoute(
      //     builder: (ctx) => CategoriesScreen(),
      //   );
      // },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (ctx) => CategoriesScreen(),
        );
      },
    );
  }
}
