import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:swim_safe/models/member.dart';
import 'package:swim_safe/screens/profiles/member_tile.dart';

class MemberList extends StatefulWidget {
  @override
  _MemberListState createState() => _MemberListState();
}

class _MemberListState extends State<MemberList> {
  @override
  Widget build(BuildContext context) {
    final members = Provider.of<List<Member>>(context);
    int length = members?.length ?? 0;

    List<int> count = [];
    for (int i = 0; i < length; i++) {
      count.add(i);
    }

    return (ListView(
      children: [
        for (var i in count) ...[
          MemberTile(
            member: members[i],
          ),
        ]
      ],
    ));
  }
}

class MemberListHigh extends StatefulWidget {
  @override
  _MemberListHighState createState() => _MemberListHighState();
}

class _MemberListHighState extends State<MemberListHigh> {
  @override
  Widget build(BuildContext context) {
    final members = Provider.of<List<Member>>(context);
    int length = members?.length ?? 0;
    List<int> count = [];
    for (int i = 0; i < length; i++) {
      if (members[i].careNeeded == 'High Attention') {
        count.add(i);
      }
    }

    return (ListView(
      children: [
        for (var i in count) ...[
          MemberTile(
            member: members[i],
          ),
        ]
      ],
    ));
  }
}

class MemberListMedium extends StatefulWidget {
  @override
  _MemberListMediumState createState() => _MemberListMediumState();
}

class _MemberListMediumState extends State<MemberListMedium> {
  @override
  Widget build(BuildContext context) {
    final members = Provider.of<List<Member>>(context);
    int length = members?.length ?? 0;
    List<int> count = [];
    for (int i = 0; i < length; i++) {
      if (members[i].careNeeded == 'Moderate Attention') {
        count.add(i);
      }
    }

    return (ListView(
      children: [
        for (var i in count) ...[
          MemberTile(
            member: members[i],
          ),
        ]
      ],
    ));
  }
}

class MemberListLow extends StatefulWidget {
  @override
  _MemberListLowState createState() => _MemberListLowState();
}

class _MemberListLowState extends State<MemberListLow> {
  @override
  Widget build(BuildContext context) {
    final members = Provider.of<List<Member>>(context);
    int length = members?.length ?? 0;
    List<int> count = [];
    for (int i = 0; i < length; i++) {
      if (members[i].careNeeded == 'Low Attention') {
        count.add(i);
      }
    }

    return (ListView(
      children: [
        for (var i in count) ...[
          MemberTile(
            member: members[i],
          ),
        ]
      ],
    ));
  }
}
