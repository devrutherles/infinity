import 'package:flutter/material.dart';
import 'package:infinitywallet/core/my_themes.dart';
import 'package:infinitywallet/routes/routes.dart';
import 'package:infinitywallet/screens/homepage/homepage.dart';
import 'package:infinitywallet/screens/initialpage/initialpage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyApp extends StatelessWidget {
  final SharedPreferences? prefs;
  const MyApp({Key? key, this.prefs}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Infinity Wallet',
      routes: AppRoutes.routes,
      debugShowCheckedModeBanner: false,
      theme: MyThemes.defaultTheme,
      home: prefs!.getString('userWallet') == null
          ? const InitialPage()
          : const HomePage(),
    );
  }
}
