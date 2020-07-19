import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swim_safe/screens/authenticate/memberList.dart';
import 'package:swim_safe/services/database.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swim_safe/models/member.dart';

class Lifeguard extends StatefulWidget {
  @override
  _LifeguardState createState() => _LifeguardState();
}

class _LifeguardState extends State<Lifeguard> {
  int _currentIndex = 0;
  String passcode = '';
  final _formKey = GlobalKey<FormState>();

  final tabs = [
    All(),
    High(),
    Medium(),
    Low(),
  ];

  @override
  Widget build(BuildContext context) {
    if (passcode == '1234') {
      return Scaffold(
        backgroundColor: Colors.lightBlue[50],
        appBar: AppBar(
            backgroundColor: Colors.lightBlue[100],
            elevation: 0.0,
            title: Text('Lifeguard')),
        body: tabs[_currentIndex],
        bottomNavigationBar: BottomNavigationBar(
          currentIndex: _currentIndex,
          items: [
            BottomNavigationBarItem(
              icon: Icon(
                Icons.all_inclusive,
                color: Colors.black,
              ),
              title: Text(
                'All',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.trending_up,
                color: Colors.black,
              ),
              title: Text(
                'High',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.trending_flat,
                color: Colors.black,
              ),
              title: Text(
                'Medium',
                style: TextStyle(color: Colors.black),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.trending_down,
                color: Colors.black,
              ),
              title: Text(
                'Low',
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
    } else {
      return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue[100],
          title: Text('Lifeguard Passcode'),
        ),
        body: Container(
          padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: Column(children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Incorrect Passcode' : null,
                decoration: InputDecoration(
                  hintText: 'Enter Passcode to Access Data',
                  border: OutlineInputBorder(),
                ),
                obscureText: true,
                onChanged: (val) {
                  setState(() => passcode = val);
                },
              ),
            ]),
          ),
        ),
      );
    }
  }
}

class All extends StatefulWidget {
  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Member>>.value(
      value: DatabaseService().members,
      child: Scaffold(
        body: MemberList(),
      ),
    );
  }
}

class High extends StatefulWidget {
  @override
  _HighState createState() => _HighState();
}

class _HighState extends State<High> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Member>>.value(
      value: DatabaseService().members,
      child: Scaffold(
        body: MemberListHigh(),
      ),
    );
  }
}

class Medium extends StatefulWidget {
  @override
  _MediumState createState() => _MediumState();
}

class _MediumState extends State<Medium> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Member>>.value(
      value: DatabaseService().members,
      child: Scaffold(
        body: MemberListMedium(),
      ),
    );
  }
}

class Low extends StatefulWidget {
  @override
  _LowState createState() => _LowState();
}

class _LowState extends State<Low> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Member>>.value(
      value: DatabaseService().members,
      child: Scaffold(
        body: MemberListLow(),
      ),
    );
  }
}
