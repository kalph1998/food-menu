import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/widgets/app_bar.dart';
import 'package:food_menu/widgets/main_drawer.dart';

class AddNewMeal extends StatefulWidget {
  const AddNewMeal({super.key});

  @override
  State<AddNewMeal> createState() => _AddNewMealState();
}

class _AddNewMealState extends State<AddNewMeal> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: const HomeAppBar(
        title: 'Add your own meal',
        subtitle: 'happy meal',
      ),
      drawer: const MainDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Form(
          child: Column(
            children: [
              TextFormField(
                style: TextStyle(color: kLightFontColor),
                decoration: const InputDecoration(
                  label: Text('Meal name'),
                  enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(color: Colors.white)),
                  floatingLabelStyle: TextStyle(color: kPrimaryColor),
                ),
              ),
              TextFormField(
                style: TextStyle(color: kLightFontColor),
                decoration: const InputDecoration(
                  label: Text('Meal name'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
