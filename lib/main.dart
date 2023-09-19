import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:food_menu/constants.dart';
import 'package:food_menu/screens/favorites.dart';
import 'package:food_menu/screens/meal_filters.dart';
import 'package:food_menu/screens/home.dart';
import 'package:food_menu/screens/meal_detail.dart';
import 'package:food_menu/screens/on_board.dart';
import 'package:food_menu/screens/tab.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:easy_localization/easy_localization.dart';

import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
    statusBarIconBrightness: Brightness.dark,
  ));
  runApp(
    EasyLocalization(
      supportedLocales: const [Locale('en'), Locale('nl')],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      child: const ProviderScope(
        child: MyApp(),
      ),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Food Menu',
      debugShowCheckedModeBanner: false,
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: kPrimaryColor),
        scaffoldBackgroundColor: kDarkColor,
        fontFamily: GoogleFonts.lato().fontFamily,
        useMaterial3: true,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: StreamBuilder(
          stream: FirebaseAuth.instance.authStateChanges(),
          builder: (ctx, snapshot) {
            if (snapshot.hasData) {
              return const HomeScreen();
            }
            return const OnboardScreen();
          }),
      routes: {
        HomeScreen.routeName: (ctx) => const HomeScreen(),
        MealDetail.routeName: (ctx) => const MealDetail(),
        FavoritesScreen.routeName: (ctx) => const FavoritesScreen(),
        HomeBottomNavBar.routeName: (ctx) => const HomeBottomNavBar(),
        FilterScreen.routeName: (ctx) => const FilterScreen()
      },
    );
  }
}
