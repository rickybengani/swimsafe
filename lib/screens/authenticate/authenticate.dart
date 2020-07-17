import 'package:flutter/material.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            'SwimSafe',
            style: TextStyle(color: Colors.white),
          ),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RaisedButton(
                onPressed: () {
                  // Navigate to Checker page
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
              SizedBox(height: 10),
              RaisedButton(
                onPressed: () {
                  // Navigate to Checker page
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
        ));
  }
}
