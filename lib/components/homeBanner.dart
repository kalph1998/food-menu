import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';

class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 30),
      decoration: BoxDecoration(
          border: Border.all(color: kDarkGreyColor, width: 2),
          borderRadius: BorderRadius.circular(20),
          boxShadow: const [
            BoxShadow(
              offset: Offset(3, 7),
              spreadRadius: -4,
              blurRadius: 11,
              color: Color.fromRGBO(0, 0, 0, 1),
            )
          ]),
      child: Stack(
        children: [
          ClipRRect(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              'assets/home.jpg',
              fit: BoxFit.cover,
              alignment: Alignment.topRight,
              height: 150,
            ),
          ),
          Positioned(
            left: 16,
            top: 16,
            child: Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Menu for Dinner",
                    style: TextStyle(
                        color: kDarkGreyFontColor,
                        fontSize: 14,
                        fontWeight: FontWeight.w700),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Chicken Baked",
                    style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 18,
                        fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(4)),
                        child: const Icon(
                          Icons.schedule,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "30 min",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 20,
                        width: 20,
                        decoration: BoxDecoration(
                            color: kPrimaryColor,
                            borderRadius: BorderRadius.circular(4)),
                        child: const Icon(
                          Icons.local_fire_department_outlined,
                          size: 18,
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      const Text(
                        "Easy lvl",
                        style: TextStyle(color: kPrimaryColor),
                      ),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
    ;
  }
}
