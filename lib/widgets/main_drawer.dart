import 'package:flutter/material.dart';

import '../Utils/constants.dart';

class MainDrawer extends StatelessWidget {
  Widget buildListTile(String title, IconData icon, Function tapHandler) {
    return ListTile(
      leading: Icon(
        icon,
        size: 26,
      ),
      title: Text(
        title,
        style: TextStyle(
          fontFamily: 'RobotoCondensed',
          fontSize: 24,
          fontWeight: FontWeight.bold,
        ),
      ),
      onTap: tapHandler,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: <Widget>[
          Container(
            height: 120,
            width: double.infinity,
            padding: EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            color: Theme.of(context).accentColor,
            child: Text(
              'Coocking Up',
              style: TextStyle(
                fontWeight: FontWeight.w900,
                fontSize: 30,
                color: Theme.of(context).primaryColor,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          buildListTile(
            'Coocking Up',
            Icons.restaurant,
            () {
              //going to home
              Navigator.of(context).pushReplacementNamed(
                Constants.INITIAL_ROUTE,
              ); //Replacing the existing page as we are adding the Drawer on each page.
            },
          ),
          buildListTile(
            'Filters',
            Icons.settings,
            () {
              //going to home
              Navigator.of(context).pushReplacementNamed(
                Constants.FILTERS_PAGE_ROUTE,
              );
            },
          ),
        ],
      ),
    );
  }
}
