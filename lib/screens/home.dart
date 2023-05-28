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
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
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
          ],
        ),
        centerTitle: false,
        actions: [
          Stack(
            clipBehavior: Clip.none,
            children: [
              Container(
                margin: EdgeInsets.only(right: 20),
                width: 50,
                height: 50,
                decoration: BoxDecoration(
                  color: kPrimaryColor,
                  borderRadius: BorderRadius.circular(14),
                ),
              ),
              Positioned(
                right: 18,
                top: -3,
                child: Container(
                  height: 14,
                  width: 14,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: kRedColor,
                      border: Border.all(color: Colors.white, width: 1)),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
