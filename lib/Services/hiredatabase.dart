import 'package:cloud_firestore/cloud_firestore.dart';

class HireDatabaseService{
  final String uid;
  HireDatabaseService({required this.uid});

  CollectionReference users = FirebaseFirestore.instance
      .collection('UserInformation')
      .doc('worker')
      .collection('general');
  Future AddWorkerData(
      String name,
      String email,
      String phone,
      String password,
      String present_address,
      String parmanent_adress,
      String gender,
      String birthday) async {
    return users
        .doc(uid)
        .set({
      'name': name, // John Doe
      'email': email, // Stokes and Sons
      'phone': phone, // 42
      'password': password,
      'present_address': present_address,
      'permanent_address': parmanent_adress,
      'gender': gender,
      'birthday': birthday,
    })
        .then((value) => print("User Added"))
        .catchError((error) => print("Failed to add user: $error"));
  }

  Stream<QuerySnapshot> get brews {
    return users.snapshots();
  }
}