import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Form Demo App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  String? textValidator(value) {
    if (value == null || value.isEmpty) {
      return 'Please enter some text';
    }
    if (value.toString().startsWith("hi")) {
      return "Input can't start with hi";
    }
    if (value.toString().startsWith("bob")) {
      return "Input can't start with bob";
    }
    if (value.toString().length < 10) {
      return "Input must be more than 10 chars";
    }
    return null;
  }

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  String text = "";
  final TextEditingController _controller = TextEditingController();

  void submit() {
    // Validate returns true if the form is valid, or false otherwise.
    if (_formKey.currentState!.validate()) {
      text = _controller.text;
      if (kDebugMode) {
        print(text);
      }
      // If the form is valid, display a snackbar. In the real world,
      // you'd often call a server or save the information in a database.
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Processing Data')),
      );
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(children: [
        Text(text),
        Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              TextFormField(
                controller: _controller,
                decoration: const InputDecoration(
                  icon: Icon(Icons.telegram),
                  hintText: 'Enter Something Awesome',
                  labelText: 'Some Text*',
                ),
                // The validator receives the text that the user has entered.
                validator: widget.textValidator,
              ),
              TextFormField(
                decoration: const InputDecoration(
                  icon: Icon(Icons.telegram),
                  hintText: 'Enter Something Awesome',
                  labelText: 'Some Text*',
                ),
                // The validator receives the text that the user has entered.
                validator: widget.textValidator,
              ),
              ElevatedButton(
                onPressed: submit,
                child: const Text('Submit'),
              ),
              // Add TextFormFields and ElevatedButton here.
            ],
          ),
        )
      ])), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
