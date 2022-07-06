import 'package:flutter/material.dart';
import 'package:nav_stack/components/drawer.dart';

class SecondRoute extends StatelessWidget {
  const SecondRoute({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
      ),
      drawer: getDrawer(context),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            child: const Text('Push Second Route'),
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                  context, '/second', ModalRoute.withName('/'));
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.popUntil(context, ModalRoute.withName('/'));
            },
            child: const Text('Start Over!'),
          ),
        ],
      )),
    );
  }
}
