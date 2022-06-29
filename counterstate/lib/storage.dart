import 'dart:async';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:counterstate/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:image_picker/image_picker.dart';
import 'package:uuid/uuid.dart';

class SecondScreen extends StatefulWidget {
  const SecondScreen({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<SecondScreen> createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  File? _image;
  bool _initialized = false;
  FirebaseApp? app;

  Future<void> initializeDefault() async {
    app = await Firebase.initializeApp(
        options: DefaultFirebaseOptions.currentPlatform);
    _initialized = true;
    if (kDebugMode) {
      print('Initialized default app $app');
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    initializeDefault();
  }

  void _getImage() async {
    final ImagePicker _picker = ImagePicker();
    // Pick an image
    final XFile? pickedImage =
        await _picker.pickImage(source: ImageSource.camera);
    setState(() {
      if (pickedImage != null) {
        _image = File(pickedImage.path);
      } else {
        if (kDebugMode) {
          print('No image selected.');
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(widget.title)),
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            _image == null
                ? Text('No image selected.')
                : Image.file(_image!, width: 300),
            ElevatedButton(
                onPressed: () {
                  _upload();
                },
                child: const Text("Submit", style: TextStyle(fontSize: 20))),
          ]),
      floatingActionButton: FloatingActionButton(
        onPressed: _getImage,
        tooltip: 'Add a photo',
        child: const Icon(Icons.add_a_photo),
      ),
    );
  }

  Future<String> _uploadFile(filename) async {
    if (!_initialized) {
      await initializeDefault();
    }
    final Reference ref = FirebaseStorage.instance.ref().child('$filename.jpg');
    final SettableMetadata metadata =
        SettableMetadata(contentType: 'image/jpeg', contentLanguage: 'en');
    final UploadTask uploadTask = ref.putFile(_image!, metadata);
    final downloadURL = await (await uploadTask).ref.getDownloadURL();
    if (kDebugMode) {
      print(downloadURL.toString());
    }
    return downloadURL.toString();
  }

  void _upload() async {
    if (!_initialized) {
      await initializeDefault();
    }
    if (_image != null) {
      var uuid = Uuid();
      final String uid = uuid.v4();
      if (kDebugMode) {
        print(uid);
      }
      final String downloadURL = await _uploadFile(uid);
      await _addItem(downloadURL, uid);
      Navigator.pop(context);
    }
  }

  Future<void> _addItem(String downloadURL, String title) async {
    if (!_initialized) {
      await initializeDefault();
    }
    await FirebaseFirestore.instance.collection('photos').add(<String, dynamic>{
      'downloadURL': downloadURL,
      'title': title,
      'geopoint': GeoPoint(4.5, 3.5),
      'timestamp': DateTime.now()
    });
  }
}
