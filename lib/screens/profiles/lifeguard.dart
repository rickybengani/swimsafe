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
  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Member>>.value(
      value: DatabaseService().members,
      child: Scaffold(
        appBar: AppBar(
          title: Text('Lifeguard'),
        ),
        body: MemberList(),
      ),
    );
  }
}
