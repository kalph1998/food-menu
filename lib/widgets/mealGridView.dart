import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/data/dummyData.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:food_menu/data/meal.dart';
import 'package:food_menu/providers/meals_provider.dart';
import 'package:food_menu/screens/mealDetail.dart';
import 'package:riverpod/riverpod.dart';

class MealGridView extends ConsumerStatefulWidget {
  const MealGridView({super.key});

  @override
  ConsumerState<MealGridView> createState() => _MealGridViewState();
}

class _MealGridViewState extends ConsumerState<MealGridView> {
  @override
  Widget build(BuildContext context) {
    final meals = ref.watch(mealsProvider);

    return GridView.builder(
        itemCount: meals.length,
        physics: const NeverScrollableScrollPhysics(),
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            childAspectRatio: MediaQuery.of(context).size.width /
                (MediaQuery.of(context).size.height / 1.1),
            crossAxisCount: 2,
            crossAxisSpacing: 20,
            mainAxisSpacing: 20),
        shrinkWrap: true,
        itemBuilder: (ctx, index) {
          return MealTile(
            meal: meals[index],
          );
        });
  }
}

class MealTile extends StatelessWidget {
  final Meal meal;
  const MealTile({super.key, required this.meal});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => {
        Navigator.pushNamed(context, MealDetail.routeName, arguments: meal.id)
      },
      child: Container(
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
            Hero(
              tag: 'dash${meal.id}',
              child: Image.network(
                meal.imageUrl,
                fit: BoxFit.cover,
                height: 130,
              ),
            ),
            Expanded(
              child: Container(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        meal.title,
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: kLightFontColor,
                          fontSize: 16,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                      RatingBar.builder(
                        initialRating: meal.rating.toDouble(),
                        itemSize: 20,
                        minRating: 1,
                        direction: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, _) => const Icon(
                          Icons.star,
                          color: Colors.amber,
                          opticalSize: 10,
                        ),
                        onRatingUpdate: (rating) {},
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            '${meal.duration}  Min',
                            textAlign: TextAlign.center,
                            style: const TextStyle(
                              color: kLightGreyFontColor,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                          const SizedBox(
                            width: 40,
                            child: Divider(),
                          ),
                          Text(
                            '${meal.complexity.name} Lvl',
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
      ),
    );
  }
}
