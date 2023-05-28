import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/data/dummyData.dart';

class MealGridView extends StatefulWidget {
  const MealGridView({super.key});

  @override
  State<MealGridView> createState() => _MealGridViewState();
}

class _MealGridViewState extends State<MealGridView> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
        itemCount: dummyMeals.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.3),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return Container(
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                color: kDarkGreyColor, borderRadius: BorderRadius.circular(23)),
            child: Column(
              children: [
                Image.network(
                  dummyMeals[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 120,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Column(children: [
                    Text(
                      dummyMeals[index].title,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: kLightFontColor, fontSize: 18),
                    )
                  ]),
                )
              ],
            ),
          );
        });
  }
}
