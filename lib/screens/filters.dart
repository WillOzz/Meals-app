import 'package:flutter/material.dart';
import 'package:meals_app/widgets/filter_switch_tile.dart';

enum Filter {
  glutenFree,
  lactoseFree,
  vegetarian,
  vegan,
}

class FiltersScreen extends StatefulWidget {
  const FiltersScreen({
    super.key,
    required this.currentFilters,
  });

  final Map<Filter, bool> currentFilters;
  @override
  State<FiltersScreen> createState() {
    return _FiltersScreenState();
  }
}

class _FiltersScreenState extends State<FiltersScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFreeFilterSet = false;
  var _veganFreeFilterSet = false;

  @override
  void initState() {
    super.initState();
    _glutenFreeFilterSet = widget.currentFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = widget.currentFilters[Filter.lactoseFree]!;
    _veganFreeFilterSet = widget.currentFilters[Filter.vegan]!;
    _vegetarianFreeFilterSet = widget.currentFilters[Filter.vegetarian]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Your Filters'),
      ),
      body: PopScope(
        canPop: false,
        onPopInvoked: (bool didPop) {
          if (didPop) return;
          Navigator.of(context).pop({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFreeFilterSet,
            Filter.vegan: _veganFreeFilterSet,
          });
        },
        child: Column(
          children: [
            FilterSwitchTile(
              value: _glutenFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _glutenFreeFilterSet = isChecked!;
                });
              },
              title: 'Gluten-Free',
              subtitle: 'Only include gluten-free meals.',
            ),
            FilterSwitchTile(
              value: _lactoseFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _lactoseFreeFilterSet = isChecked!;
                });
              },
              title: 'Lactose-Free',
              subtitle: 'Only include lactose-free meals.',
            ),
            FilterSwitchTile(
              value: _vegetarianFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _vegetarianFreeFilterSet = isChecked!;
                });
              },
              title: 'Vegetarian',
              subtitle: 'Only include vegetarian meals.',
            ),
            FilterSwitchTile(
              value: _veganFreeFilterSet,
              onChanged: (isChecked) {
                setState(() {
                  _veganFreeFilterSet = isChecked!;
                });
              },
              title: 'Vegan',
              subtitle: 'Only include vegan meals.',
            ),
          ],
        ),
      ),
    );
  }
}
