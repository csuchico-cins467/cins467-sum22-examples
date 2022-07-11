// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:form_example/main.dart';

void main() {
  group('String Validation Function Test', () {
    test('Check for Null 1', () {
      const widget = MyHomePage(
        title: 'test',
      );

      var rwidget = widget.textValidator("");

      expect(rwidget, "Please enter some text");
    });

    test('Check for Null 2', () {
      const widget = MyHomePage(
        title: 'test',
      );

      var rwidget = widget.textValidator(null);

      expect(rwidget, "Please enter some text");
    });

    test('Check for bob', () {
      const widget = MyHomePage(
        title: 'test',
      );

      var rwidget = widget.textValidator("bob4567890");

      expect(rwidget, "Input can't start with bob");
    });

    test('Check for less than 10 chars', () {
      const widget = MyHomePage(
        title: 'test',
      );

      var rwidget = widget.textValidator("ten");

      expect(rwidget, "Input must be more than 10 chars");
    });

    test('Check for starts with hi', () {
      const widget = MyHomePage(
        title: 'test',
      );

      var rwidget = widget.textValidator("hi Here's a Valid String");

      expect(rwidget, "Input can't start with hi");
    });

    test('Check for Success', () {
      const widget = MyHomePage(
        title: 'test',
      );

      var rwidget = widget.textValidator("Here's a Valid String");

      expect(rwidget, null);
    });

    // test('value should be decremented', () {
    //   final counter = Counter();

    //   counter.decrement();

    //   expect(counter.value, -1);
    // });
  });
  // testWidgets('Counter increments smoke test', (WidgetTester tester) async {
  //   // Build our app and trigger a frame.
  //   await tester.pumpWidget(const MyApp());

  //   // Verify that our counter starts at 0.
  //   expect(find.text('0'), findsOneWidget);
  //   expect(find.text('1'), findsNothing);

  //   // Tap the '+' icon and trigger a frame.
  //   await tester.tap(find.byIcon(Icons.add));
  //   await tester.pump();

  //   // Verify that our counter has incremented.
  //   expect(find.text('0'), findsNothing);
  //   expect(find.text('1'), findsOneWidget);
  // });
}
