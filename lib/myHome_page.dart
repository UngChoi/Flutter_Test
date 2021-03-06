import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  File _image;

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = image;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Image Picker Example'),
      ),
      body: Center(
        child: _image == null
            ? Text('No image selected.')
            : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}

//Future<void> retrieveLostData() async {
//  final LostDataResponse response =
//  await ImagePicker.retrieveLostData();
//  if (response == null) {
//    return;
//  }
//  if (response.file != null) {
//    setState(() {
//      if (response.type == RetrieveType.video) {
//        _handleVideo(response.file);
//      } else {
//        _handleImage(response.file);
//      }
//    });
//  } else {
//    _handleError(response.exception);
//  }
//}