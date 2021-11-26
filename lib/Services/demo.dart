import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class Demo extends StatelessWidget {
  final String documentId;

  Demo(this.documentId);


  @override
  Widget build(BuildContext context) {
    // final brew1 = Provider.of<QuerySnapshot>(context);
    // for(var doc in brew1.docs){
    //   print(doc.data());
    // }
    CollectionReference users = FirebaseFirestore.instance.collection('users');

    return FutureBuilder<DocumentSnapshot>(
      future: users.doc(documentId).get(),
      builder:
          (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          Map<String, dynamic> data = snapshot.data!.data() as Map<String, dynamic>;
          print({data['name']});
        }

        return Text("loading");
      },
    );
  }
}
