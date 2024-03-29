import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilejob/Constants/TextField_design.dart';
import 'package:mobilejob/Screen/home_screen.dart';
import 'package:mobilejob/Screen/registrationScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';

class LoginTextField extends StatefulWidget {
  static const String id = 'LoginScreen';
  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  // final signIn = Authentication();
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  bool passwordValidation = false;
  bool emailValidation = false;
  bool emailEmptyValidation = false;
  bool passwordEmptyValidation = false;
  bool emailVerify = false;
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  Future<void> _displayTextInputDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Please enter your gmail'),
            content: TextField(
              onChanged: (value) {
                setState(() {
                  email = value;
                });
              },
              decoration: InputDecoration(hintText: "Registered gmail"),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.red,
                textColor: Colors.white,
                child: Text('Cancel'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.green,
                textColor: Colors.white,
                child: Text('Ok'),
                onPressed: () {
                  setState(() {
                    codeDialog = email;
                    sendPasswordResetEmail(email!);
                    Navigator.pop(context);
                    print(email);
                  });
                },
              ),
            ],
          );
        });
  }

  Future<void> _SelectRegistrationType(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
              title: Text('Please Select User type'),
              content: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Registration('hire')));

                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.blueAccent,
                        textColor: Colors.white,
                        elevation: 10.0,
                        child: Text('Hire worker')),
                    RaisedButton(
                        onPressed: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => Registration('worker')));
                        },
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0)),
                        color: Colors.green,
                        textColor: Colors.white,
                        elevation: 10.0,
                        child: Text('Worker')),
                  ],
                ),
              ));
        });
  }

  //Reset user password send reset link in user register email
  Future sendPasswordResetEmail(String email) async {
    // Toast.show("Check email", context,
    //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
    return _firebaseAuth.sendPasswordResetEmail(email: email);
  }

  String ?codeDialog;
  String ?email;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDFE1F3),
      // appBar: AppBar(
      //   title: Text('Login',
      //   ),
      // ),

      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Colors.lightBlue, Colors.white],
          )),
          child: Padding(
            padding: const EdgeInsets.all(25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height / 4,
                  // color: Colors.purpleAccent,
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Icon(
                            Icons.ac_unit,
                            size: 140.0,
                            color: Colors.green,
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Mobile Job',
                            style: TextStyle(
                                fontSize: 35.0,
                                fontWeight: FontWeight.bold,
                                color: Colors.brown),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          Text(
                            'Mobile job help to find \n job in you nearest area',
                            style: TextStyle(
                                fontSize: 20.0, color: Colors.black45),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.all(15.0),
                  height: MediaQuery.of(context).size.height / 2,
                  decoration: BoxDecoration(
                      color: Color(0xFFDFE1F3),
                      borderRadius: BorderRadius.circular(10.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.purpleAccent,
                          offset: const Offset(3.0, 3.0),
                          blurRadius: 5.0,
                          spreadRadius: 2.0,
                        ),
                      ]),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      //Here User email Input field design.
                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        cursorColor: Colors.orange,
                        controller: emailController,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: KTextFieldDecoration.copyWith(
                            errorText: emailValidation
                                ? 'Email not registered'
                                : emailEmptyValidation
                                    ? 'Empty email'
                                    : emailVerify
                                        ? 'Email not verify check email'
                                        : null,
                            labelText: 'Email',
                            prefixIcon: Icon(Icons.email_outlined)),
                      ),

                      //User password field design

                      SizedBox(
                        height: 10.0,
                      ),
                      TextField(
                        cursorColor: Colors.orange,
                        controller: passwordController,
                        obscureText: true,
                        style: TextStyle(
                          color: Colors.black,
                        ),
                        decoration: KTextFieldDecoration.copyWith(
                            labelText: 'Password',
                            errorText: passwordValidation
                                ? 'wrong password'
                                : passwordEmptyValidation
                                    ? 'Empty password'
                                    : null,
                            prefixIcon: Icon(Icons.password_rounded)),
                      ),
                      SizedBox(
                        height: 10.0,
                      ),

                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: [
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.blueAccent,
                            textColor: Colors.white,
                            elevation: 10.0,
                            onPressed: () async {
                              try {
                                UserCredential userCredential =
                                    await FirebaseAuth.instance
                                        .signInWithEmailAndPassword(
                                  email: emailController.text.toString(),
                                  password: passwordController.text.toString(),
                                );
                                User? user = FirebaseAuth.instance.currentUser;

                                if (user != null && user.emailVerified) {
                                  emailVerify = false;
                                  print(user.uid);
                                  // await DatabaseService(uid: user.uid).updateUserData('tanvir', 'dhaka', 123);
                                  Navigator.pushNamed(context, HomeScreen.id);
                                } else if (user != null &&
                                    !user.emailVerified) {
                                  setState(() {
                                    emailVerify = true;
                                  });
                                }
                              } on FirebaseAuthException catch (e) {
                                setState(() {
                                  emailController.text.isEmpty
                                      ? emailEmptyValidation = true
                                      : emailEmptyValidation = false;
                                  passwordController.text.isEmpty
                                      ? passwordEmptyValidation = true
                                      : passwordEmptyValidation = false;
                                  e.code == 'user-not-found'
                                      ? emailValidation = true
                                      : emailValidation = false;
                                  e.code == 'wrong-password'
                                      ? passwordValidation = true
                                      : passwordValidation = false;
                                });
                              }
                            },
                            child: Text(
                              'Login',
                              style: GoogleFonts.lato(),
                            ),
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          GestureDetector(
                            child: Text(
                              'Forgot password',
                              style: TextStyle(
                                decoration: TextDecoration.underline,
                                color: Colors.redAccent,
                              ),
                            ),
                            onTap: () {
                              _displayTextInputDialog(context);
                              // Do something when click forgot button.
                            },
                          ),
                          SizedBox(
                            height: 10.0,
                          ),
                          RaisedButton(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10.0)),
                            color: Colors.grey,
                            textColor: Colors.white,
                            elevation: 10.0,
                            onPressed: () {
                              _SelectRegistrationType(context);
                              setState(() {});
                            },
                            child: Text(
                              'Create Account',
                              style: GoogleFonts.lato(),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
