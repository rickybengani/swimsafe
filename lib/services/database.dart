import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseService {
  final String locationName;
  final String memberName;
  DatabaseService({this.locationName, this.memberName});
  // collection reference
  final CollectionReference locationCollection =
      Firestore.instance.collection('locations');
  Future updateLocationData(String location) async {
    return await locationCollection.document(locationName).setData({
      'locationName': location,
    });
  }

  Future updateMemberData(
      String name, String imagePath, String careNeeded) async {
    return await locationCollection
        .document(locationName)
        .collection('members')
        .document(memberName)
        .setData({
      'name': name,
      'imagePath': imagePath,
      'careNeeded': careNeeded,
    });
  }
}
