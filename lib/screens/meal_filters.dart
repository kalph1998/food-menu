import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/providers/filters_provider.dart';
import 'package:food_menu/widgets/home_app_bar.dart';
import 'package:food_menu/widgets/main_drawer.dart';

class FilterScreen extends ConsumerStatefulWidget {
  static const routeName = '/filters';
  const FilterScreen({super.key});

  @override
  ConsumerState<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends ConsumerState<FilterScreen> {
  var _glutenFreeFilterSet = false;
  var _lactoseFreeFilterSet = false;
  var _vegetarianFilterSet = false;
  var _veganFilterSet = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    final activeFilters = ref.read(filtersProvider);
    _glutenFreeFilterSet = activeFilters[Filter.glutenFree]!;
    _lactoseFreeFilterSet = activeFilters[Filter.lactoseFree]!;
    _vegetarianFilterSet = activeFilters[Filter.vegetarian]!;
    _veganFilterSet = activeFilters[Filter.vegan]!;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar:
          const HomeAppBar(title: 'Filters', subtitle: 'Filter out your meals'),
      drawer: const MainDrawer(),
      body: WillPopScope(
        onWillPop: () async {
          ref.read(filtersProvider.notifier).setFilters({
            Filter.glutenFree: _glutenFreeFilterSet,
            Filter.lactoseFree: _lactoseFreeFilterSet,
            Filter.vegetarian: _vegetarianFilterSet,
            Filter.vegan: _veganFilterSet,
          });
          return true;
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Column(
            children: [
              SwitchListTile(
                value: _glutenFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _glutenFreeFilterSet = isChecked;
                    ref
                        .read(filtersProvider.notifier)
                        .setFilter(Filter.glutenFree, isChecked);
                  });
                },
                title: Text(
                  'Gluten-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: kLightFontColor,
                      ),
                ),
                subtitle: Text(
                  'Only include gluten-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: kLightGreyFontColor,
                      ),
                ),
                activeColor: kPrimaryColor,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _lactoseFreeFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _lactoseFreeFilterSet = isChecked;
                    ref
                        .read(filtersProvider.notifier)
                        .setFilter(Filter.lactoseFree, isChecked);
                  });
                },
                title: Text(
                  'Lactose-free',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: kLightFontColor,
                      ),
                ),
                subtitle: Text(
                  'Only include lactose-free meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: kLightGreyFontColor,
                      ),
                ),
                activeColor: kPrimaryColor,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _vegetarianFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _vegetarianFilterSet = isChecked;
                    ref
                        .read(filtersProvider.notifier)
                        .setFilter(Filter.vegetarian, isChecked);
                  });
                },
                title: Text(
                  'Vegetarian',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: kLightFontColor,
                      ),
                ),
                subtitle: Text(
                  'Only include vegetarian meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: kLightGreyFontColor,
                      ),
                ),
                activeColor: kPrimaryColor,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
              SwitchListTile(
                value: _veganFilterSet,
                onChanged: (isChecked) {
                  setState(() {
                    _veganFilterSet = isChecked;
                    ref
                        .read(filtersProvider.notifier)
                        .setFilter(Filter.vegan, isChecked);
                  });
                },
                title: Text(
                  'Vegan',
                  style: Theme.of(context).textTheme.titleLarge!.copyWith(
                        color: kLightFontColor,
                      ),
                ),
                subtitle: Text(
                  'Only include vegan meals.',
                  style: Theme.of(context).textTheme.labelMedium!.copyWith(
                        color: kLightGreyFontColor,
                      ),
                ),
                activeColor: kPrimaryColor,
                contentPadding: const EdgeInsets.only(left: 34, right: 22),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
