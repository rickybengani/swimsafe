import 'package:flutter/material.dart';
import 'package:swim_safe/screens/authenticate/authenticate.dart';
import 'package:swim_safe/screens/profiles/checker.dart';
import 'package:swim_safe/screens/wrapper.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Wrapper(),
    );
  }
}
