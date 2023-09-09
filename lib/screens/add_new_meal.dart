import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/data/dummy_data.dart';
import 'package:food_menu/models/meal.dart';
import 'package:food_menu/widgets/app_bar.dart';
import 'package:food_menu/widgets/main_drawer.dart';

class AddNewMeal extends StatefulWidget {
  const AddNewMeal({super.key});

  @override
  State<AddNewMeal> createState() => _AddNewMealState();
}

class _AddNewMealState extends State<AddNewMeal> {
  //form key
  final _formKey = GlobalKey<FormState>();

  final List<TextEditingController> _ingredientsControllers = [];
  final List<TextEditingController> _stepsController = [];

  @override
  void initState() {
    super.initState();
    _addIngredient();
    _addStep();
  }

  //values
  String mealName = '';
  String mealCategory = '';
  int duration = 0;
  Complexity complexity = Complexity.simple;
  Affordability affordability = Affordability.affordable;
  List<String> ingredients = [];
  List<String> steps = [];
  bool isVegan = false;
  bool isVegetarian = false;
  bool isGlutenFree = false;
  bool isLactoseFree = false;

  _addIngredient() {
    setState(() {
      _ingredientsControllers.add(TextEditingController());
    });
  }

  _removeIngredient(int index) {
    setState(() {
      _ingredientsControllers.removeAt(index);
    });
  }

  _addStep() {
    setState(() {
      _stepsController.add(TextEditingController());
    });
  }

  _removeStep(int index) {
    setState(() {
      _stepsController.removeAt(index);
    });
  }

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

  void _submit() {
    final isValid = _formKey.currentState!.validate();

    if (!isValid) {
      return;
    }
    _formKey.currentState!.save();

    for (var i = 0; i < _ingredientsControllers.length; i++) {
      print(_ingredientsControllers[i].text);
    }
  }

  String? requiredFieldValidator(String? value) {
    if (value == null || value.trim().isEmpty) {
      return "This field is required";
    }
    return null;
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
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextFormField(
                  style: const TextStyle(color: kLightFontColor),
                  decoration: inputDecorationStyle('Meal name'),
                  validator: requiredFieldValidator,
                  onSaved: (value) => mealName = value!,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Category',
                  style: TextStyle(color: kLightFontColor, fontSize: 20),
                ),
                const SizedBox(
                  height: 20,
                ),
                DropdownButtonFormField(
                  value: 'Quick & Easy',
                  dropdownColor: kDarkGreyColor,
                  items: availableCategories.map((category) {
                    return DropdownMenuItem(
                      value: category.title,
                      child: Text(category.title),
                    );
                  }).toList(),
                  onChanged: (value) {},
                  onSaved: (value) {
                    mealCategory = value!;
                  },
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
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Duration',
                  style: TextStyle(color: kLightFontColor, fontSize: 20),
                ),
                TextFormField(
                  style: const TextStyle(color: kLightFontColor),
                  decoration: inputDecorationStyle('Min'),
                  validator: requiredFieldValidator,
                  keyboardType: TextInputType.number,
                  inputFormatters: <TextInputFormatter>[
                    FilteringTextInputFormatter.digitsOnly
                  ], // Only numbers can be entered
                  onSaved: (value) => mealCategory = value!,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Complexity',
                  style: TextStyle(color: kLightFontColor, fontSize: 20),
                ),
                DropdownButtonFormField(
                  value: Complexity.simple,
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
                  onSaved: (newValue) => complexity = newValue!,
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
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Affordability',
                  style: TextStyle(color: kLightFontColor, fontSize: 20),
                ),
                DropdownButtonFormField(
                  value: Affordability.affordable,
                  dropdownColor: kDarkGreyColor,
                  items: [
                    DropdownMenuItem(
                      value: Affordability.affordable,
                      child: Text(
                        Affordability.affordable.name,
                      ),
                    ),
                    DropdownMenuItem(
                      value: Affordability.pricey,
                      child: Text(
                        Affordability.pricey.name,
                      ),
                    ),
                    DropdownMenuItem(
                      value: Affordability.luxurious,
                      child: Text(
                        Affordability.luxurious.name,
                      ),
                    ),
                  ],
                  onChanged: (value) {},
                  onSaved: (newValue) => affordability,
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
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Ingredients',
                  style: TextStyle(color: kLightFontColor, fontSize: 20),
                ),
                for (int i = 0; i < _ingredientsControllers.length; i++)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _ingredientsControllers[i],
                          style: const TextStyle(color: kLightFontColor),
                          decoration: inputDecorationStyle('Item'),
                          validator: requiredFieldValidator,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _removeIngredient(i);
                        },
                        child: const SizedBox(
                          child: Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _addIngredient,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kPrimaryColor)),
                      child: const Text(
                        'Add Item',
                        style: TextStyle(color: kDarkColor),
                      ),
                    ),
                  ],
                ),
                const Text(
                  'Steps',
                  style: TextStyle(color: kLightFontColor, fontSize: 20),
                ),
                for (int i = 0; i < _stepsController.length; i++)
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                        child: TextFormField(
                          controller: _stepsController[i],
                          style: const TextStyle(color: kLightFontColor),
                          decoration: inputDecorationStyle('Step'),
                          validator: requiredFieldValidator,
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          _removeStep(i);
                        },
                        child: const SizedBox(
                          child: Icon(
                            Icons.cancel,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: _addStep,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kPrimaryColor)),
                      child: const Text(
                        'Add Item',
                        style: TextStyle(color: kDarkColor),
                      ),
                    ),
                  ],
                ),
                CheckboxListTile(
                    title: const Text(
                      'Gluten free',
                      style: TextStyle(color: kLightFontColor),
                    ),
                    activeColor: kPrimaryColor,
                    side: const BorderSide(color: kLightFontColor),
                    overlayColor: const MaterialStatePropertyAll(kPrimaryColor),
                    value: isGlutenFree,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) {
                          isGlutenFree = value;
                        }
                      });
                    }),
                CheckboxListTile(
                    title: const Text(
                      'Vegetarian',
                      style: TextStyle(color: kLightFontColor),
                    ),
                    activeColor: kPrimaryColor,
                    side: const BorderSide(color: kLightFontColor),
                    overlayColor: const MaterialStatePropertyAll(kPrimaryColor),
                    value: isVegetarian,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) {
                          isVegetarian = value;
                        }
                      });
                    }),
                CheckboxListTile(
                    title: const Text(
                      'Vegan',
                      style: TextStyle(color: kLightFontColor),
                    ),
                    activeColor: kPrimaryColor,
                    side: const BorderSide(color: kLightFontColor),
                    overlayColor: const MaterialStatePropertyAll(kPrimaryColor),
                    value: isVegan,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) {
                          isVegan = value;
                        }
                      });
                    }),
                CheckboxListTile(
                    title: const Text(
                      'Lactose free',
                      style: TextStyle(color: kLightFontColor),
                    ),
                    activeColor: kPrimaryColor,
                    side: const BorderSide(color: kLightFontColor),
                    overlayColor: const MaterialStatePropertyAll(kPrimaryColor),
                    value: isLactoseFree,
                    onChanged: (bool? value) {
                      setState(() {
                        if (value != null) {
                          isLactoseFree = value;
                        }
                      });
                    }),
                const SizedBox(
                  height: 20,
                ),
                Align(
                  alignment: Alignment.center,
                  child: SizedBox(
                    width: 200,
                    child: ElevatedButton(
                      onPressed: _submit,
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(kPrimaryColor)),
                      child: const Text(
                        'Add meal',
                        style: TextStyle(color: kDarkColor),
                      ),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
