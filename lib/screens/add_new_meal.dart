import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/data/meal.dart';
import 'package:food_menu/widgets/app_bar.dart';
import 'package:food_menu/widgets/main_drawer.dart';

class AddNewMeal extends StatefulWidget {
  const AddNewMeal({super.key});

  @override
  State<AddNewMeal> createState() => _AddNewMealState();
}

class _AddNewMealState extends State<AddNewMeal> {
  InputDecoration inputDecorationStyle(String title) {
    return InputDecoration(
      label: Text(
        title,
        style: const TextStyle(color: kLightFontColor),
      ),
      enabledBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
        ),
      ),
      focusedBorder: const UnderlineInputBorder(
        borderSide: BorderSide(
          color: kPrimaryColor,
        ),
      ),
      floatingLabelStyle: const TextStyle(color: kPrimaryColor),
    );
  }

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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TextFormField(
                style: const TextStyle(color: kLightFontColor),
                decoration: inputDecorationStyle('Meal name'),
              ),
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Duration',
                style: TextStyle(color: kLightFontColor, fontSize: 20),
              ),
              Row(
                children: [
                  Expanded(
                    child: TextFormField(
                        style: const TextStyle(color: kLightFontColor),
                        decoration: inputDecorationStyle('Hour')),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: TextFormField(
                      style: const TextStyle(color: kLightFontColor),
                      decoration: inputDecorationStyle('Min'),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButtonFormField(
                dropdownColor: kDarkGreyColor,
                items: [
                  DropdownMenuItem(
                    value: Complexity.challenging,
                    child: Text(
                      Complexity.challenging.name,
                    ),
                  ),
                  DropdownMenuItem(
                    value: Complexity.hard,
                    child: Text(
                      Complexity.hard.name,
                    ),
                  ),
                  DropdownMenuItem(
                    value: Complexity.simple,
                    child: Text(
                      Complexity.simple.name,
                    ),
                  ),
                ],
                onChanged: (value) {},
                style: const TextStyle(color: kLightFontColor),
                decoration: const InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.white,
                    ),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(
                      color: kPrimaryColor,
                    ),
                  ),
                  floatingLabelStyle: TextStyle(color: kPrimaryColor),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
