import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nav_stack/first.dart';
import 'package:nav_stack/second.dart';

void main() {
  if (kIsWeb) {
    runApp(MaterialApp(
      title: 'Named Routes Demo Web',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstRoute(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondRoute(),
      },
    ));
  } else {
    runApp(MaterialApp(
      title: 'Named Routes Demo Mobile',
      // Start the app with the "/" named route. In this case, the app starts
      // on the FirstScreen widget.
      initialRoute: '/',
      routes: {
        // When navigating to the "/" route, build the FirstScreen widget.
        '/': (context) => const FirstRoute(),
        // When navigating to the "/second" route, build the SecondScreen widget.
        '/second': (context) => const SecondRoute(),
      },
    ));
  }
  // if (kIsWeb) {
  //   runApp(const MaterialApp(
  //     title: 'Navigation Basics',
  //     home: FirstRoute(),
  //   ));
  // } else if (Platform.isAndroid) {
  //   runApp(const MaterialApp(
  //     title: 'Navigation Basics',
  //     home: FirstRoute(),
  //   ));
  // } else {
  //   runApp(const MaterialApp(
  //     title: 'Navigation Basics',
  //     home: FirstRoute(),
  //   ));
  // }
}
