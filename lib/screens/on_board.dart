import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/screens/login.dart';
import 'package:food_menu/translations/locale_keys.g.dart';

class OnboardScreen extends StatelessWidget {
  const OnboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kPrimaryColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Image.asset(
                'assets/pan.png',
                height: 400,
                fit: BoxFit.cover,
                alignment: Alignment.center,
              ),
              Container(
                margin: const EdgeInsets.only(bottom: 50),
                decoration: const BoxDecoration(
                    color: kDarkColor,
                    borderRadius: BorderRadius.all(
                      Radius.circular(30),
                    ),
                    boxShadow: [
                      BoxShadow(
                        offset: Offset(0, 23),
                        spreadRadius: -20,
                        blurRadius: 39,
                        color: Color.fromRGBO(0, 0, 0, 1),
                      )
                    ]),
                padding: const EdgeInsets.symmetric(vertical: 38),
                width: MediaQuery.of(context).size.width * 0.8,
                child: Column(
                  children: [
                    Text(
                      LocaleKeys.Hello.tr(),
                      style: const TextStyle(
                          color: kLightFontColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                    const Text(
                      "Simplify your \n cooking plan",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: kLightFontColor,
                          fontSize: 28,
                          fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    const Text(
                      "No more confused about \n your meal menu",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: kDarkGreyFontColor,
                        fontSize: 18,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () => Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (ctx) => const Login())),
                      child: Container(
                        alignment: Alignment.center,
                        height: 52,
                        width: 200,
                        decoration: BoxDecoration(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: const Text(
                          "Let's go",
                          style: TextStyle(
                              fontSize: 20, fontWeight: FontWeight.w700),
                        ),
                      ),
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
