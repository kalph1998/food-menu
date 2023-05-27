import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Stack(
              children: [
                Align(
                    alignment: Alignment.centerLeft,
                    child: Image.asset(
                      'assets/pan.jpg',
                      height: 400,
                      fit: BoxFit.cover,
                      alignment: Alignment.center,
                    ))
              ],
            ),
            Container(
              decoration: const BoxDecoration(
                  color: kDarkColor,
                  borderRadius: BorderRadius.all(Radius.circular(30))),
              height: 300,
              padding: EdgeInsets.symmetric(vertical: 38),
              width: MediaQuery.of(context).size.width * 0.8,
              child: Column(children: [
                Text(
                  "Simplify your \n cooking plan",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: kLightFontColor,
                      fontSize: 28,
                      fontWeight: FontWeight.w700),
                )
              ]),
            )
          ],
        ),
      ),
    );
  }
}
