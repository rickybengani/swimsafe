import 'package:flutter/material.dart';
import 'package:swim_safe/services/auth.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();

  String locationName = '';
  String email = '';
  String password = '';
  String error = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlue[100],
        elevation: 0.0,
        title: Text('Sign up to Swim Safe'),
        actions: <Widget>[
          FlatButton.icon(
            icon: Icon(Icons.person),
            label: Text('Sign In'),
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
          child: Column(
            children: <Widget>[
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) =>
                    val.isEmpty ? 'Please Enter Location Name' : null,
                decoration: InputDecoration(hintText: 'Enter Location Name'),
                onChanged: (val) {
                  setState(() => locationName = val);
                },
              ),
              SizedBox(height: 20.0),
              TextFormField(
                validator: (val) => val.isEmpty ? 'Enter a Valid Email' : null,
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
                  child: Text('Register'),
                  onPressed: () async {
                    if (_formKey.currentState.validate() == true) {
                      print('register.dart: ' + locationName);
                      dynamic result = await _auth.registerWithEmailAndPassword(
                          locationName, email, password);
                      if (result == null) {
                        setState(() => error = 'Please supply a valid email');
                      }
                    }
                  }),
              SizedBox(
                height: 12.0,
              ),
              Text(error, style: TextStyle(color: Colors.red, fontSize: 14.0))
            ],
          ),
        ),
        color: Colors.lightBlue[50],
      ),
    );
  }
}
