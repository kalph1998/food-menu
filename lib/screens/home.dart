import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';

class HomeScreen extends StatefulWidget {
  static const routeName = '/home';
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedTabIndex = 0;
  final String profileUrl =
      'https://images.pexels.com/photos/5795034/pexels-photo-5795034.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kDarkColor,
      appBar: AppBar(
        backgroundColor: kDarkColor,
        title: const Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Hi, Amanda",
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
                margin: const EdgeInsets.only(right: 20),
                width: 50,
                height: 50,
                decoration: BoxDecoration(),
                child: ClipRRect(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(14),
                  child: Image.network(profileUrl),
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
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kDarkColor,
        selectedItemColor: kPrimaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: kDarkGreyFontColor,
        currentIndex: selectedTabIndex,
        onTap: (index) {
          setState(() {
            selectedTabIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  const Icon(
                    Icons.home_outlined,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                        color: selectedTabIndex == 0
                            ? kPrimaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30)),
                  )
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Icon(
                    Icons.favorite_border,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                        color: selectedTabIndex == 1
                            ? kPrimaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30)),
                  )
                ],
              ),
              label: ''),
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  const Icon(
                    Icons.settings_outlined,
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 4),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                        color: selectedTabIndex == 2
                            ? kPrimaryColor
                            : Colors.transparent,
                        borderRadius: BorderRadius.circular(30)),
                  )
                ],
              ),
              label: ''),
        ],
      ),
      body: Container(
        width: double.infinity,
        margin: const EdgeInsets.symmetric(horizontal: 18),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(vertical: 30),
              decoration: BoxDecoration(
                border: Border.all(color: kDarkGreyColor, width: 2),
                borderRadius: BorderRadius.circular(20),
              ),
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
                    child: Column(
                      children: [
                        Text(
                          "Menu for Dinner",
                          style: TextStyle(
                              color: kDarkGreyFontColor, fontSize: 14),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Chicken Baked",
                          style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
