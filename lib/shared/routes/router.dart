import 'package:app/modules/authentication/signup/signup.dart';
import 'package:app/modules/splash/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:app/modules/home/home_page.dart';
import 'package:app/modules/items/items_page.dart';

abstract class Router {
  static String home = "/";
  static String items = "/items";
  


  static Map<String, WidgetBuilder> getRoutes(context) {
    return {
      home: (context) => PokeSplashScreen(),
      // HomePage(),
      items: (context) => ItemsPage(),
    };
  }
}
