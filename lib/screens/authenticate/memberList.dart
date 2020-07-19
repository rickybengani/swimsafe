import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
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

    return ListView.builder(
      itemCount: members.length,
      itemBuilder: (context, index) {
        return MemberTile(member: members[index]);
      },
    );
  }
}
