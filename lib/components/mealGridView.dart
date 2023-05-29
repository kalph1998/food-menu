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
                color: kDarkGreyColor,
                borderRadius: BorderRadius.circular(23),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(3, 7),
                    spreadRadius: -4,
                    blurRadius: 11,
                    color: Color.fromRGBO(0, 0, 0, 1),
                  )
                ]),
            child: Column(
              children: [
                Image.network(
                  dummyMeals[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 130,
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20, vertical: 10),
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            dummyMeals[index].title,
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: kLightFontColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '60 \n Min',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kLightGreyFontColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                '|',
                                style: TextStyle(
                                  color: kLightGreyFontColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Text(
                                'Hard \n Lvl',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: kLightGreyFontColor,
                                  fontWeight: FontWeight.w700,
                                ),
                              )
                            ],
                          )
                        ]),
                  ),
                )
              ],
            ),
          );
        });
  }
}