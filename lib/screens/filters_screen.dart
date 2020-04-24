import 'package:flutter/material.dart';

import '../widgets/main_drawer.dart';

enum FilterSwitch {
  GlutenFree,
  LactoseFree,
  Vegetarian,
  Vegan,
}

class FiltersScreen extends StatefulWidget {
  final Function filterMethod;
  final Map<String, bool> currentFilters;

  FiltersScreen(this.currentFilters, this.filterMethod);

  @override
  _FiltersScreenState createState() => _FiltersScreenState();
}

class _FiltersScreenState extends State<FiltersScreen> {
  bool _glutenFree = false;
  bool _vegan = false;
  bool _lactoseFree = false;
  bool _vegetarian = false;

  @override
  void initState() {
    _glutenFree = widget.currentFilters['isGluttenFree'];
    _vegan = widget.currentFilters['isVegan'];
    _lactoseFree = widget.currentFilters['isLactoseFree'];
    _vegetarian = widget.currentFilters['isVegetarian'];
    super.initState();
  }

  void _hangeSwitchVal(bool val, FilterSwitch filterSwitch) {
    setState(() {
      switch (filterSwitch) {
        case FilterSwitch.LactoseFree:
          _lactoseFree = val;
          break;

        case FilterSwitch.GlutenFree:
          _glutenFree = val;
          break;
        case FilterSwitch.Vegan:
          _vegan = val;
          break;
        case FilterSwitch.Vegetarian:
          _vegetarian = val;
          break;

        default:
          break;
      }
    });
  }

  Widget _buildFilterListTile(
      String title, String subTitle, bool switchVal, FilterSwitch filterTo) {
    return ListTile(
      title: Text(
        title,
        style: Theme.of(context).textTheme.title,
      ),
      subtitle: Text(
        subTitle,
        style: TextStyle(color: Colors.grey[500]),
      ),
      trailing: Switch(
          activeColor: Theme.of(context).accentColor,
          value: switchVal,
          onChanged: (val) {
            _hangeSwitchVal(val, filterTo);
          }),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Your Filters'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.save),
            onPressed: () {
              final mySlectedFilters = {
                'isGluttenFree': _glutenFree,
                'isLactoseFree': _lactoseFree,
                'isVegan': _vegan,
                'isVegetarian': _vegetarian,
              };
              widget.filterMethod(mySlectedFilters);
            },
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            margin: const EdgeInsets.all(10),
            child: const Text(
              'Adjust your meal selection',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 4,
          ),
          Expanded(
            child: ListView(
              children: <Widget>[
                _buildFilterListTile(
                  'Gluten-free',
                  'Only include gluten-free meals',
                  _glutenFree,
                  FilterSwitch.GlutenFree,
                ),
                _buildFilterListTile(
                  'Lactose-free',
                  'Only include lactose-free meals',
                  _lactoseFree,
                  FilterSwitch.LactoseFree,
                ),
                _buildFilterListTile(
                  'Vegetarian',
                  'Only include vegetarian meals',
                  _vegetarian,
                  FilterSwitch.Vegetarian,
                ),
                _buildFilterListTile(
                  'Vegan',
                  'Only include vegan meals',
                  _vegan,
                  FilterSwitch.Vegan,
                ),
              ],
            ),
          ),
        ],
      ),
      drawer: MainDrawer(),
    );
  }
}
