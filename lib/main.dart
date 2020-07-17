import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: Text('Material App Bar'),
        ),
        body: Center(
          child: Container(
            child: Text('Hello World'),
          ),
        ),
      ),
    );
  }
}

// HOME PAGE

// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   // This widget is the root of your application.
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter Demo',
//       theme: ThemeData(
//         // This is the theme of your application.
//         //
//         // Try running your application with "flutter run". You'll see the
//         // application has a blue toolbar. Then, without quitting the app, try
//         // changing the primarySwatch below to Colors.green and then invoke
//         // "hot reload" (press "r" in the console where you ran "flutter run",
//         // or simply save your changes to "hot reload" in a Flutter IDE).
//         // Notice that the counter didn't reset back to zero; the application
//         // is not restarted.
//         primarySwatch: Colors.lightBlue,
//         // This makes the visual density adapt to the platform that you run
//         // the app on. For desktop platforms, the controls will be smaller and
//         // closer together (more dense) than on mobile platforms.
//         visualDensity: VisualDensity.adaptivePlatformDensity,
//       ),
//       home: MyHomePage(),
//     );
//   }
// }

// class MyHomePage extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(
//           title: Text(
//             'SwimSafe',
//             style: TextStyle(color: Colors.white),
//           ),
//         ),
//         body: Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//             children: <Widget>[
//               RaisedButton(
//                 onPressed: () {
//                   // Navigate to Checker page
//                 },
//                 textColor: Colors.white,
//                 padding: const EdgeInsets.all(0.0),
//                 child: Container(
//                   width: 300,
//                   height: 300,
//                   child: Center(
//                     child: Text(
//                       'Checker',
//                       style: TextStyle(fontSize: 60),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: <Color>[
//                         Color(0xFF0D47A1),
//                         Color(0xFF1976D2),
//                         Color(0xFF42A5F5),
//                       ],
//                     ),
//                   ),
//                   padding: const EdgeInsets.all(10.0),
//                 ),
//               ),
//               SizedBox(height: 10),
//               RaisedButton(
//                 onPressed: () {
//                   // Navigate to Checker page
//                 },
//                 textColor: Colors.white,
//                 padding: const EdgeInsets.all(0.0),
//                 child: Container(
//                   width: 300,
//                   height: 300,
//                   child: Center(
//                     child: Text(
//                       'Lifeguard',
//                       style: TextStyle(fontSize: 60),
//                       textAlign: TextAlign.center,
//                     ),
//                   ),
//                   decoration: const BoxDecoration(
//                     gradient: LinearGradient(
//                       colors: <Color>[
//                         Color(0xFF0D47A1),
//                         Color(0xFF1976D2),
//                         Color(0xFF42A5F5),
//                       ],
//                     ),
//                   ),
//                   padding: const EdgeInsets.all(10.0),
//                 ),
//               ),
//             ],
//           ),
//         ));
//   }
// }
