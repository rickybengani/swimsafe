import 'package:flutter/material.dart';
import 'package:swim_safe/screens/authenticate/authenticate.dart';
import 'package:swim_safe/screens/authenticate/sign_in.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // return either authenticate or checker/lifeguard
    return Container(
      child: SignIn(),
    );
  }
}
