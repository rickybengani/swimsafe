import 'package:flutter/material.dart';
import 'package:swim_safe/services/auth.dart';

class SignIn extends StatefulWidget {
  final Function toggleView;
  SignIn({this.toggleView});
  @override
  _SignInState createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        elevation: 0.0,
        title: Text(
          'Sign in to SwimSafe',
        ),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign Up'),
            onPressed: () {
              widget.toggleView();
            },
          )
        ],
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Image(
                  image: AssetImage('lib/assets/SwimSafeLogo.png'),
                  height: 400,
                  width: 400,
                ),
                TextFormField(
                  validator: (val) => val.isEmpty ? 'Enter an Email' : null,
                  decoration: InputDecoration(hintText: 'Enter Email'),
                  onChanged: (val) {
                    setState(() => email = val);
                  },
                ),
                SizedBox(height: 20.0),
                TextFormField(
                    validator: (val) => val.length < 8
                        ? 'Enter a Password of 8+ Characters'
                        : null,
                    decoration: InputDecoration(hintText: 'Enter Password'),
                    obscureText: true,
                    onChanged: (val) {
                      setState(() => password = val);
                    }),
                SizedBox(height: 20.0),
                RaisedButton(
                  color: Colors.lightBlue[100],
                  child: Text('Sign In'),
                  onPressed: () async {
                    if (_formKey.currentState.validate() == true) {
                      dynamic result = await _auth.signInWithEmailAndPassword(
                          email, password);
                      if (result == null) {
                        setState(() => error = 'Wrong Credentials');
                      }
                    }
                  },
                ),
                SizedBox(
                  height: 12.0,
                ),
                Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0))
              ],
            ),
          ),
        ),
        color: Colors.white,
      ),
      backgroundColor: Colors.white,
    );
  }
}
