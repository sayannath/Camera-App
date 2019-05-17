import 'package:flutter/material.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'dart:io';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  File _image;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('My Camera App'),
      ),
      body: Center(
        child: _image == null ? Text('No Image') : Image.file(_image),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _optionDialogBox,
        child: Icon(Icons.add_a_photo),
        tooltip: 'Open Camera',
      ),
    );
  }

  Future<void> _optionDialogBox() {
    return showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: Colors.blue,
            shape: RoundedRectangleBorder(),
            content: SingleChildScrollView(
              child: ListBody(
                children: <Widget>[
                  GestureDetector(
                    child: Text(
                      'Take a Picture',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: openCamera,
                  ),
                  Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  GestureDetector(
                    child: Text(
                      'Select image from Gallery',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                      ),
                    ),
                    onTap: openGallery,
                  ),
                ],
              ),
            ),
          );
        });
  }

//Camera Method
  Future openCamera() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

//Gallery Method
  Future openGallery() async {
    var picture = await ImagePicker.pickImage(source: ImageSource.gallery);

    setState(() {
      _image = picture;
    });
  }
}
