import 'package:flutter/material.dart';
import 'package:nav_stack/components/drawer.dart';
import 'package:nav_stack/second.dart';

class FirstRoute extends StatelessWidget {
  const FirstRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('First Route'),
      ),
      drawer: getDrawer(context),
      body: Center(
        child: ElevatedButton(
          child: const Text('Push Second Route'),
          onPressed: () {
            Navigator.pushNamed(context, '/second');
          },
        ),
      ),
    );
  }
}
