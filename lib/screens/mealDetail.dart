import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';

class MealDetail extends StatelessWidget {
  static const routeName = '/meal';
  const MealDetail({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      backgroundColor: kDarkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Container(
          decoration: BoxDecoration(
              color: kDarkGreyColor, borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            icon: const Icon(
              Icons.chevron_left,
              color: kDarkGreyFontColor,
              size: 34,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 20),
            decoration: BoxDecoration(
                color: kLightRedColor,
                borderRadius: BorderRadius.circular(10),
                boxShadow: const [
                  BoxShadow(
                    offset: Offset(1, 1),
                    spreadRadius: -6,
                    blurRadius: 39,
                    color: kLightRedColor,
                  )
                ]),
            child: IconButton(
              icon: const Icon(
                Icons.favorite,
                color: kRedColor,
                size: 28,
              ),
              onPressed: () => Navigator.of(context).pop(),
            ),
          ),
        ],
      ),
      body: Column(children: [
        Image.network(
            'https://img.freepik.com/free-photo/penne-pasta-tomato-sauce-with-chicken-tomatoes-wooden-table_2829-19739.jpg?w=1800&t=st=1685435116~exp=1685435716~hmac=c2be6006ffef3ccc7d2dd8915dd9182f220907a8da47b29111a661dfd16581d5')
      ]),
    );
  }
}
