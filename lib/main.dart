import 'package:flutter/material.dart';

import 'package:monhun_random/screens/home.dart';
import 'package:monhun_random/screens/weapon.dart';
import 'package:monhun_random/screens/customized.dart';
import 'package:monhun_random/screens/spinwheel.dart';

void main() {
  runApp(MaterialApp(

    // Need 4 screens:
    // 1. Home Screen shows all choices
    // 2. Weapon Randomizing Screen
    // 3. Custom Randomizing Screen
    initialRoute: '/',
    routes: { // This is the map property, expects key-value pairs, (context) means that the function input is context
      '/': (context) => Home(),
      '/weapon': (context) => Weapon(),
      '/customized': (context) => Customized(),
      '/spinwheel': (context) => Spinningwheel(),
    },
    debugShowCheckedModeBanner: false,

  ));
}