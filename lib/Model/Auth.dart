//
//
//
//
// import 'package:firebase_auth/firebase_auth.dart';
//
// class Authentication {
//    bool t = false;
//   FirebaseAuth auth = FirebaseAuth.instance;
//
//   // ignore: non_constant_identifier_names
//   Future UserRegistration(String email, String password) async {
//     print(email);
//     try {
//       UserCredential userCredential =
//       await FirebaseAuth.instance.createUserWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'weak-password') {
//         print('The password provided is too weak.');
//       }
//       else if (e.code == 'email-already-in-use') {
//         print('The account already exists for that email.');
//       }
//     } catch (e) {
//       print(e);
//     }
//   }
//
//   // ignore: non_constant_identifier_names
//   Future UserSignIn(String email, String password) async {
//     try {
//       UserCredential userCredential = await FirebaseAuth.instance
//           .signInWithEmailAndPassword(
//         email: email,
//         password: password,
//       );
//     } on FirebaseAuthException catch (e) {
//       if (e.code == 'user-not-found') {
//         print('No user found for that email.');
//       } else if (e.code == 'wrong-password') {
//         print('Wrong password provided for that user.');
//       }
//     }
//   }
// }