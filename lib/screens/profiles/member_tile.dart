import 'package:flutter/material.dart';
import 'package:swim_safe/models/member.dart';

class MemberTile extends StatefulWidget {
  @override
  _MemberTileState createState() => _MemberTileState();
  final Member member;
  MemberTile({this.member});
}

class _MemberTileState extends State<MemberTile> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 8.0),
      child: Column(
        children: <Widget>[
          Container(
            height: 500,
            child: Card(
              margin: EdgeInsets.fromLTRB(20.0, 6.0, 20.0, 0.0),
              child: Column(
                children: <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: Colors.lightBlue[
                            memberCareNeeded(widget.member.careNeeded)]),
                    title: Text(widget.member.name),
                    subtitle: Text('Needs ${widget.member.careNeeded}'),
                  ),
                  CircleAvatar(
                    child: _buildListItem(context, widget.member),
                    radius: 200,
                    backgroundColor: Colors.white,
                    backgroundImage: AssetImage('lib/assets/Loading.gif'),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildListItem(BuildContext context, Member member) {
    final record = member;

    return Container(
      key: ValueKey(record.imagePath),
      child: Container(
        width: 320,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.lightBlue),
          borderRadius: BorderRadius.circular(100.0),
        ),
        child: ListTile(
          title: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.network(
                record.url,
                width: 500,
                height: 300,
              ),
              SizedBox(
                height: 20,
              ),
              Text('Checked In'),
              Icon(Icons.check),
            ],
          ),
        ),
      ),
    );
  }
}

int memberCareNeeded(String member) {
  if (member == "High Attention") {
    return 400;
  } else if (member == "Moderate Attention") {
    return 200;
  } else {
    return 0;
  }
}
