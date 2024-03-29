import 'package:flutter/material.dart';
import 'package:food_menu/constants.dart';

class HomeAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String subtitle;
  static const String profileUrl =
      'https://images.pexels.com/photos/5795034/pexels-photo-5795034.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=2';
  const HomeAppBar({super.key, required this.title, required this.subtitle});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: kDarkColor,
      leading: IconButton(
          onPressed: () {
            Scaffold.of(context).openDrawer();
          },
          icon: const Icon(
            Icons.menu,
            color: kLightFontColor,
          )),
      title: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
                color: kLightFontColor,
                fontWeight: FontWeight.bold,
                fontSize: 24),
          ),
          Text(
            subtitle,
            style: const TextStyle(
              color: kLightGreyFontColor,
              fontWeight: FontWeight.w700,
              fontSize: 14,
            ),
          )
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
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
