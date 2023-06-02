import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/widgets/homeAppBar.dart';

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
        // Important: Remove any padding from the ListView.
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
            title: Row(children: const [
              Icon(
                Icons.home_outlined,
                color: kDarkGreyFontColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Home',
                style: TextStyle(
                    color: kLightFontColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ]),
            onTap: () {
              // Update the state of the app.
              // ...
            },
          ),
          ListTile(
            title: Row(children: const [
              Icon(
                Icons.favorite,
                color: kDarkGreyFontColor,
              ),
              SizedBox(
                width: 10,
              ),
              Text(
                'Favorites',
                style: TextStyle(
                    color: kLightFontColor,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              ),
            ]),
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
