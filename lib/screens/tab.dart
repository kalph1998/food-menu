import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/screens/favorites.dart';
import 'package:food_menu/screens/home.dart';

class HomeBottomNavBar extends StatefulWidget {
  int selectedTabIndex;
  static const routeName = '/tab';
  HomeBottomNavBar({super.key, this.selectedTabIndex = 0});

  @override
  State<HomeBottomNavBar> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<HomeBottomNavBar> {
  void _selectPage(int index) {
    setState(() {
      widget.selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget activePage = const HomeScreen();

    if (widget.selectedTabIndex == 1) {
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
        currentIndex: widget.selectedTabIndex,
        onTap: _selectPage,
        items: [
          BottomNavigationBarItem(
              icon: Column(
                children: [
                  const Icon(
                    Icons.home_outlined,
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 4),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                        color: widget.selectedTabIndex == 0
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
                    margin: const EdgeInsets.only(top: 4),
                    height: 6,
                    width: 6,
                    decoration: BoxDecoration(
                      color: widget.selectedTabIndex == 1
                          ? kPrimaryColor
                          : Colors.transparent,
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                ],
              ),
              label: ''),
        ],
      ),
    );
  }
}
