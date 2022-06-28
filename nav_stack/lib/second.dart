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
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const SecondRoute()),
              );
            },
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: const Text('Go back!'),
          ),
        ],
      )),
    );
  }
}
