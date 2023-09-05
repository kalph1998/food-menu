import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/screens/add_new_meal.dart';
import 'package:food_menu/screens/tab.dart';
import 'package:food_menu/widgets/app_bar.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: kDarkGreyColor,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          const DrawerHeader(
            decoration: BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 36,
                  backgroundImage: NetworkImage(HomeAppBar.profileUrl),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  "Amanda Cerny",
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                )
              ],
            ),
          ),
          ListTile(
            leading: const Icon(
              Icons.home,
              color: kDarkGreyFontColor,
            ),
            title: const Text(
              'Home',
              style: TextStyle(
                  color: kLightFontColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeBottomNavBar(
                    selectedTabIndex: 0,
                  ),
                ),
              );
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.add,
              color: kDarkGreyFontColor,
            ),
            title: const Text(
              'Add new meal',
              style: TextStyle(
                  color: kLightFontColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (_) => const AddNewMeal()),
              );
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.favorite,
              color: kDarkGreyFontColor,
            ),
            title: const Text(
              'Favorites',
              style: TextStyle(
                  color: kLightFontColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (_) => HomeBottomNavBar(
                    selectedTabIndex: 1,
                  ),
                ),
              );
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: kDarkGreyFontColor,
            ),
            title: const Text(
              'Settings',
              style: TextStyle(
                  color: kLightFontColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
        ],
      ),
    );
  }
}
