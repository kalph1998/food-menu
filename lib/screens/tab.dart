import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/screens/favorites.dart';
import 'package:food_menu/screens/home.dart';

class HomeBottomNavBar extends StatefulWidget {
  static const routeName = '/tab';
  const HomeBottomNavBar({super.key});

  @override
  State<HomeBottomNavBar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeBottomNavBar> {
  int selectedTabIndex = 0;

  void _selectPage(int index) {
    setState(() {
      selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomeScreen();

    if (selectedTabIndex == 1) {
      activePage = const FavoritesScreen();
    }

    return Scaffold(
      body: activePage,
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: kDarkColor,
        selectedItemColor: kPrimaryColor,
        showSelectedLabels: false,
        showUnselectedLabels: false,
        type: BottomNavigationBarType.fixed,
        unselectedItemColor: kDarkGreyFontColor,
        currentIndex: selectedTabIndex,
        onTap: _selectPage,
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
    );
  }
}
