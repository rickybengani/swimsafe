import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swim_safe/models/location.dart';
import 'package:swim_safe/screens/authenticate/authenticate.dart';
import 'package:swim_safe/screens/authenticate/selection.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final location = Provider.of<Location>(context);
    // return either authenticate or checker/lifeguard

    if (location == null) {
      return Authenticate();
    } else {
      return Selection();
    }
  }
}
