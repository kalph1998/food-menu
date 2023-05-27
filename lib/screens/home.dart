import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';

class HomeScreen extends StatelessWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: kDarkColor,
        appBar: AppBar(
          backgroundColor: kDarkColor,
          title:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Text(
              "Hi,Arnold",
              style: TextStyle(
                  color: kLightFontColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 24),
            ),
            Text('Ready to cook for dinner ?',
                style: TextStyle(
                    color: kLightGreyFontColor,
                    fontWeight: FontWeight.w700,
                    fontSize: 14))
          ]),
          centerTitle: false,
        ));
  }
}
