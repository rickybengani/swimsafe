import 'package:flutter/material.dart';
import 'package:swim_safe/screens/profiles/checker.dart';
import 'package:swim_safe/screens/profiles/lifeguard.dart';
import 'package:swim_safe/services/auth.dart';

class Selection extends StatefulWidget {
  @override
  _SelectionState createState() => _SelectionState();
}

class _SelectionState extends State<Selection> {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue[50],
      appBar: AppBar(
        title: Text(
          'Swim Safe',
        ),
        backgroundColor: Colors.lightBlue[100],
        elevation: 0.0,
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Logout'),
            onPressed: () async {
              await _auth.signOut();
            },
          )
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Checker()));
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: 300,
                    height: 300,
                    child: Center(
                      child: Text(
                        'Checker',
                        style: TextStyle(fontSize: 60),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                  ),
                ),
                SizedBox(height: 50),
                RaisedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) => Lifeguard()));
                  },
                  textColor: Colors.white,
                  padding: const EdgeInsets.all(0.0),
                  child: Container(
                    width: 300,
                    height: 300,
                    child: Center(
                      child: Text(
                        'Lifeguard',
                        style: TextStyle(fontSize: 60),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    decoration: const BoxDecoration(
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                    padding: const EdgeInsets.all(10.0),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
