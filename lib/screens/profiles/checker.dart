import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'dart:io';
import 'package:progress_state_button/progress_button.dart';
import 'package:flutter/widgets.dart';
import 'package:swim_safe/services/storage.dart';

class Checker extends StatefulWidget {
  @override
  _CheckerState createState() => _CheckerState();
}

class _CheckerState extends State<Checker> {
  File _image;
  final picker = ImagePicker();
  final myController = TextEditingController();
  String _selectedText = 'Low Attention';

  Future getImage() async {
    final pickedFile = await picker.getImage(
      source: ImageSource.camera,
    );
    this.setState(() {
      _image = File(pickedFile.path);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
          backgroundColor: Colors.lightBlue[100],
          elevation: 0.0,
          title: Text('Check-In')),
      body: GestureDetector(
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              SizedBox(
                height: 20,
              ),
              Container(
                alignment: Alignment.topCenter,
                child: SizedBox(
                    width: 200,
                    height: 300,
                    child: Center(
                      child: _image == null
                          ? Text(
                              'No image selected.',
                              textAlign: TextAlign.center,
                            )
                          : Image.file(_image),
                    )),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    hintText: 'Name',
                  ),
                  controller: myController,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: DropdownButton<String>(
                  isExpanded: true,
                  hint: Text("Status"),
                  value: _selectedText,
                  items: <String>[
                    'Low Attention',
                    'Moderate Attention',
                    'High Attention'
                  ].map((String value) {
                    return new DropdownMenuItem<String>(
                      value: value,
                      child: new Text(value),
                    );
                  }).toList(),
                  onChanged: (String val) {
                    _selectedText = val;
                    setState(() {
                      _selectedText = val;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Uploader(
                file: _image,
                name: myController.text,
                careNeeded: _selectedText,
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: getImage,
        tooltip: 'Pick Image',
        child: Icon(Icons.add_a_photo),
      ),
    );
  }
}
