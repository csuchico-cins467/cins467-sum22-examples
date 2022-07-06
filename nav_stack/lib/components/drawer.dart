import 'package:flutter/material.dart';
import 'package:nav_stack/first.dart';

import '../second.dart';

Widget getDrawer(context) {
  return Drawer(
    // Add a ListView to the drawer. This ensures the user can scroll
    // through the options in the drawer if there isn't enough vertical
    // space to fit everything.
    child: ListView(
      // Important: Remove any padding from the ListView.
      padding: EdgeInsets.zero,
      children: [
        const DrawerHeader(
          decoration: BoxDecoration(
            color: Colors.blue,
          ),
          child: Text('Pages'),
        ),
        ListTile(
          title: const Text('Home'),
          onTap: () {
            // Update the state of the app
            // ...
            // // Then close the drawer
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const FirstRoute()));
            //not named
            // Navigator.pushNamed(context, '/');
            Navigator.popUntil(context, ModalRoute.withName('/'));
          },
        ),
        ListTile(
          title: const Text('Page 2'),
          onTap: () {
            // Navigator.pushNamed(context, '/second');
            Navigator.pushNamedAndRemoveUntil(
                context, '/second', ModalRoute.withName('/'));
            // Navigator.push(context,
            //     MaterialPageRoute(builder: (context) => const SecondRoute()));
          },
        ),
      ],
    ),
  );
}
