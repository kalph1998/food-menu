import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/widgets/homeAppBar.dart';
import 'package:food_menu/widgets/mainDrawer.dart';

class FavoritesScreen extends StatelessWidget {
  static const routeName = '/favorites';
  const FavoritesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: const HomeAppBar(),
      drawer: const MainDrawer(),
      body: Center(child: Text('favorites screen')),
    );
  }
}
