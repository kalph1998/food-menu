import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/screens/add_new_meal.dart';
import 'package:food_menu/screens/on_board.dart';
import 'package:food_menu/screens/tab.dart';
import 'package:food_menu/utils/firebase.dart';
import 'package:food_menu/widgets/app_bar.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    String userName = FirebaseAuthenticationWrapper().userName ?? 'Amanda';
    return Drawer(
      backgroundColor: kDarkGreyColor,
      // Add a ListView to the drawer. This ensures the user can scroll
      // through the options in the drawer if there isn't enough vertical
      // space to fit everything.
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
            decoration: const BoxDecoration(
              color: kPrimaryColor,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const CircleAvatar(
                  radius: 36,
                  backgroundImage: NetworkImage(HomeAppBar.profileUrl),
                ),
                const SizedBox(
                  height: 10,
                ),
                Text(
                  userName,
                  style: const TextStyle(
                      fontWeight: FontWeight.w700, fontSize: 18),
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
                  builder: (_) => const HomeBottomNavBar(
                    selectedTab: 0,
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
                  builder: (_) => const HomeBottomNavBar(
                    selectedTab: 1,
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
          ListTile(
            leading: const Icon(
              Icons.logout,
              color: kDarkGreyFontColor,
            ),
            title: const Text(
              'Logout',
              style: TextStyle(
                  color: kLightFontColor,
                  fontSize: 18,
                  fontWeight: FontWeight.bold),
            ),
            onTap: () {
              FirebaseAuth.instance.signOut();
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (ctx) => const OnboardScreen()));
            },
          ),
        ],
      ),
    );
  }
}
