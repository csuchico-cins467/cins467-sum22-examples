import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:nav_stack/first.dart';

void main() {
  if (kIsWeb) {
    runApp(const MaterialApp(
      title: 'Navigation Basics',
      home: FirstRoute(),
    ));
  } else if (Platform.isAndroid) {
    runApp(const MaterialApp(
      title: 'Navigation Basics',
      home: FirstRoute(),
    ));
  } else {
    runApp(const MaterialApp(
      title: 'Navigation Basics',
      home: FirstRoute(),
    ));
  }
}
