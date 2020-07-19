import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:progress_state_button/iconed_button.dart';
import 'dart:io';
import 'package:progress_state_button/progress_button.dart';
import 'package:flutter/widgets.dart';
import 'package:swim_safe/services/database.dart';
import 'package:swim_safe/services/storage.dart';
import 'package:provider/provider.dart';
import 'package:swim_safe/models/member.dart';

class Checker extends StatefulWidget {
  @override
  _CheckerState createState() => _CheckerState();
}

class _CheckerState extends State<Checker> {
  int _currentIndex = 0;

  final tabs = [
    CheckIn(),
    CheckOut(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
          backgroundColor: Colors.lightBlue[100],
          elevation: 0.0,
          title: Text('Checker')),
      body: tabs[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people,
              color: Colors.black,
            ),
            title: Text(
              'Check In',
              style: TextStyle(color: Colors.black),
            ),
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.people_outline,
              color: Colors.black,
            ),
            title: Text(
              'Check Out',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
      ),
    );
  }
}

class CheckOut extends StatefulWidget {
  @override
  _CheckOutState createState() => _CheckOutState();
}

class _CheckOutState extends State<CheckOut> {
  final checkOutController = TextEditingController();

  Future<void> _success() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Success!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('You have been checked out!'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                checkOutController.clear();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _failed() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Could Not Checkout!'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Your name may have already been checked out.'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Ok'),
              onPressed: () {
                Navigator.of(context).pop();
                checkOutController.clear();
              },
            ),
          ],
        );
      },
    );
  }

  Future<void> _response() async {
    // final members = Provider.of<List<Member>>(context);
    DatabaseService().deleteMemberData(checkOutController.text);
    // for (var i in members) {
    //   if (i.name == checkOutController.text) {
    await _success();
    Navigator.of(context).pop();
    //   }
    // }
    // await _failed();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).requestFocus(new FocusNode());
      },
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(20.0),
            child: TextField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: 'Name',
              ),
              controller: checkOutController,
            ),
          ),
          SizedBox(
            width: 200,
            height: 40,
            child: RaisedButton(
              onPressed: () {
                _response();
              },
              color: Colors.deepPurple,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20)),
              child: Text(
                "Check Out",
                style: TextStyle(color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CheckIn extends StatefulWidget {
  @override
  _CheckInState createState() => _CheckInState();
}

class _CheckInState extends State<CheckIn> {
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
    return GestureDetector(
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
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: <Widget>[
                RawMaterialButton(
                  onPressed: getImage,
                  elevation: 10.0,
                  fillColor: Colors.blue,
                  child: Icon(
                    Icons.add_a_photo,
                    size: 25.0,
                  ),
                  padding: EdgeInsets.all(15.0),
                  shape: CircleBorder(),
                ),
              ],
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
              height: 20,
            ),
            Uploader(
              file: _image,
              name: myController.text,
              careNeeded: _selectedText,
            ),
          ],
        ),
      ),
    );
  }
}
