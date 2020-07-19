import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:swim_safe/models/member.dart';

class DatabaseService {
  final String locationName;
  final String memberName;
  DatabaseService({this.locationName, this.memberName});
  // collection reference
  final CollectionReference locationCollection =
      Firestore.instance.collection('locations');
  final CollectionReference locationDataCollection =
      Firestore.instance.collection('locationData');

  Future setMemberData(String location, String name, String imagePath,
      String url, String careNeeded) async {
    return await locationCollection.document(name).setData({
      'name': name,
      'imagePath': imagePath,
      'url': url,
      'careNeeded': careNeeded,
    });
  }

  Future deleteMemberData(String name) async {
    return await locationCollection.document(name).delete();
  }

  Future setLocationData(String uid, String locationName) async {
    return await locationDataCollection.document(uid).setData({
      'Location UID': uid,
      'Location Name': locationName,
    });
  }

  List<Member> _memberListFromSnapshot(QuerySnapshot snapshot) {
    return snapshot.documents.map((doc) {
      return Member(
        name: doc.data['name'] ?? '',
        imagePath: doc.data['imagePath'] ?? '',
        url: doc.data['url'] ?? '',
        careNeeded: doc.data['careNeeded'] ?? '',
      );
    }).toList();
  }

  Stream<List<Member>> get members {
    return locationCollection.snapshots().map(_memberListFromSnapshot);
  }
}
