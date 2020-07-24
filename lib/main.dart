import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swim_safe/models/location.dart';
import 'package:swim_safe/screens/wrapper.dart';
import 'package:swim_safe/services/auth.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<Location>.value(
      value: AuthService().location,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
          fontFamily: 'Sansation',
        ),
        home: Wrapper(),
      ),
    );
  }
}
