import 'package:flutter/material.dart';

class Lifeguard extends StatefulWidget {
  @override
  _LifeguardState createState() => _LifeguardState();
}

class _LifeguardState extends State<Lifeguard> {
  int _currentIndex = 0;

  final tabs = [
    All(),
    Center(
      child: Text('High Attention'),
    ),
    Center(
      child: Text('Medium Attention'),
    ),
    Center(
      child: Text('Low Attention'),
    ),
  ];

  @override
  Widget build(BuildContext context) {
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
  }
}

class All extends StatefulWidget {
  @override
  _AllState createState() => _AllState();
}

class _AllState extends State<All> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 30),
      child: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            ProfileBlock(
              imagePath:
                  'https://i.pinimg.com/originals/e0/62/b4/e062b485740c56474646b8002af0ab03.jpg',
              name: 'Kan Man',
              careNeeded: 'Moderate Attention',
            ),
            ProfileBlock(
              imagePath:
                  'https://www.zbrushcentral.com/uploads/default/original/4X/5/d/3/5d328a521205c6f0e57d83743216756d280485f3.jpeg',
              name: 'Rick Man',
              careNeeded: 'Low Attention',
            ),
            ProfileBlock(
              imagePath:
                  'https://i.pinimg.com/originals/e0/62/b4/e062b485740c56474646b8002af0ab03.jpg',
              name: 'Po Man',
              careNeeded: 'Low Attention',
            ),
            ProfileBlock(
              imagePath:
                  'https://www.zbrushcentral.com/uploads/default/original/4X/5/d/3/5d328a521205c6f0e57d83743216756d280485f3.jpeg',
              name: 'Yo Man',
              careNeeded: 'Low Attention',
            ),
          ],
        ),
      ),
    );
  }
}

class ProfileBlock extends StatefulWidget {
  final String imagePath;
  final String name;
  final String careNeeded;

  ProfileBlock({this.imagePath, this.name, this.careNeeded});

  @override
  _ProfileBlockState createState() => _ProfileBlockState();
}

class _ProfileBlockState extends State<ProfileBlock> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 20),
      child: Row(
        children: <Widget>[
          Image(
            image: NetworkImage(widget.imagePath),
            height: 200,
            width: 200,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(widget.name,
                  style: TextStyle(fontSize: 20), textAlign: TextAlign.left),
              SizedBox(
                height: 10,
              ),
              Text(
                widget.careNeeded,
                style: TextStyle(fontSize: 20),
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ],
      ),
    );
  }
}
