import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilejob/Constants/Colors.dart';
import 'package:mobilejob/Constants/TextField_design.dart';

import 'package:mobilejob/Screen/home_screen.dart';
import 'package:mobilejob/Services/database.dart';
import 'package:mobilejob/Services/hiredatabase.dart';

class Registration extends StatefulWidget {
  // static const String id = 'Registration';
   final String userType;
  Registration(this.userType);
  @override
  _RegistrationState createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  GlobalKey<ScaffoldState> ?_key;

  bool email_validation = false;
  bool presentaddress_validation = false;
  bool permanentaddress_validation = false;
  bool name_validation = false;
  bool password_validation = false;
  bool re_password_validation = false;
  bool numberValidation = false;
  bool move = false;
  String ?_chosenValue;
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController Re_passwordController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController presentAddressController = TextEditingController();
  TextEditingController permanentAddressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  // final auth = Authentication();
  // FirebaseAuth auth = FirebaseAuth.instance;
  @override
  void initState() {
    print(widget.userType);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDFE1F3),
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: blue,
        title: Text('Registration Form'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextField(
                controller: nameController,
                cursorColor: Colors.orange,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: KTextFieldDecoration.copyWith(
                    labelText: 'Name',
                    errorText: name_validation ? 'Empty name' : null,
                    prefixIcon: Icon(Icons.people_alt_outlined)),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                cursorColor: Colors.orange,
                obscureText: false,
                controller: emailController,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: KTextFieldDecoration.copyWith(
                    errorText: email_validation ? 'Empty email address' : null,
                    labelText: 'Email',
                    prefixIcon: Icon(Icons.email_outlined)),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                cursorColor: Colors.orange,
                obscureText: false,
                controller: numberController,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: KTextFieldDecoration.copyWith(
                    errorText: email_validation ? 'Empty phone number' : null,
                    labelText: 'Phone',
                    prefixIcon: Icon(Icons.phone)),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                cursorColor: Colors.orange,
                controller: passwordController,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: KTextFieldDecoration.copyWith(
                    errorText: password_validation ? 'Empty password' : null,
                    labelText: 'Password',
                    prefixIcon: Icon(Icons.security_outlined)),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                cursorColor: Colors.orange,
                controller: Re_passwordController,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: KTextFieldDecoration.copyWith(
                    errorText: re_password_validation ? 'Empty password' : null,
                    labelText: 'Re-Password',
                    prefixIcon: Icon(Icons.password_outlined)),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                cursorColor: Colors.orange,
                controller: presentAddressController,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: KTextFieldDecoration.copyWith(
                    labelText: 'Present Address',
                    errorText:
                        presentaddress_validation ? 'Empty address' : null,
                    prefixIcon: Icon(Icons.apartment_outlined)),
              ),
              SizedBox(
                height: 10.0,
              ),
              TextField(
                cursorColor: Colors.orange,
                controller: permanentAddressController,
                style: TextStyle(
                  color: Colors.black,
                ),
                decoration: KTextFieldDecoration.copyWith(
                    labelText: 'Permanent Address',
                    errorText:
                        permanentaddress_validation ? 'Empty address' : null,
                    prefixIcon: Icon(Icons.apartment_outlined)),
              ),
              SizedBox(
                height: 5.0,
              ),
              // SizedBox(
              //   height: 15.0,
              // ),
              // Column(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   children: <Widget>[
              //     DropdownButton<String>(
              //       value: _chosenValue,
              //       // elevation: 5,
              //       style: TextStyle(color: Colors.black),
              //
              //       items: <String>[
              //         'Electrician',
              //         'Bike mechanics',
              //         'Cleaner',
              //         'Driver',
              //         'Care Mechanics'
              //             'Nurse'
              //       ].map<DropdownMenuItem<String>>((String value) {
              //         return DropdownMenuItem<String>(
              //           value: value,
              //           child: Text(value),
              //         );
              //       }).toList(),
              //       hint: Text(
              //         "Please choose a Skills",
              //         style: TextStyle(
              //             color: Colors.black45,
              //             fontSize: 15,
              //             fontWeight: FontWeight.normal),
              //       ),
              //       onChanged: (String value) {
              //         setState(() {
              //           _chosenValue = value;

              //           print(_chosenValue);
              //         });
              //       },
              //     ),
              //   ],
              // ),
              SizedBox(
                height: 10.0,
              ),
              RaisedButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8.0)),
                color: Colors.blue,
                textColor: Colors.white,
                elevation: 10.0,
                onPressed: () async {
                  String email = emailController.text.toString();
                  String password = passwordController.text.toString();
                  String name = nameController.text.toString();
                  String re_password = Re_passwordController.text.toString();
                  String presentAddress =
                      presentAddressController.text.toString();
                  String permanentAddress =
                      permanentAddressController.text.toString();
                  String number = numberController.text.toString();
                  print(emailController.text);
                  // auth.UserRegistration(email, password);

                  if (email.isEmpty ||
                      password.isEmpty ||
                      name.isEmpty ||
                      re_password.isEmpty ||
                      password.isEmpty ||
                      number.isEmpty ||
                      presentAddress.isEmpty ||
                      permanentAddress.isEmpty) {
                    setState(() {
                      nameController.text.isEmpty
                          ? name_validation = true
                          : name_validation = false;
                      numberController.text.isEmpty
                          ? numberValidation = true
                          : numberValidation = false;
                      emailController.text.isEmpty
                          ? email_validation = true
                          : email_validation = false;
                      passwordController.text.isEmpty
                          ? password_validation = true
                          : password_validation = false;
                      Re_passwordController.text.isEmpty
                          ? re_password_validation = true
                          : re_password_validation = false;
                      presentAddressController.text.isEmpty
                          ? presentaddress_validation = true
                          : presentaddress_validation = false;
                      permanentAddressController.text.isEmpty
                          ? permanentaddress_validation = true
                          : permanentaddress_validation = false;
                    });
                  } else {
                    try {
                      UserCredential userCredential = await FirebaseAuth
                          .instance
                          .createUserWithEmailAndPassword(
                        email: email,
                        password: password,
                      );
                      if (userCredential != null) {
                        User? user = FirebaseAuth.instance.currentUser;

                        if (user != null && !user.emailVerified) {
                          await user.sendEmailVerification();
                        }
                         if(widget.userType.toString()=='hire'){
                           await DatabaseService(uid: user!.uid).AddHireData(
                               name,
                               email,
                               number,
                               password,
                               presentAddress,
                               permanentAddress,
                               '',
                               '');
                           Navigator.pushNamed(context, HomeScreen.id);
                         }
                          if(widget.userType.toString()=='worker'){
                           await HireDatabaseService(uid: user!.uid).AddWorkerData(
                               name,
                               email,
                               number,
                               password,
                               presentAddress,
                               permanentAddress,
                               '',
                               '');
                           Navigator.pushNamed(context, HomeScreen.id);
                         }

                      }
                    } on FirebaseAuthException catch (e) {
                      if (e.code == 'weak-password') {
                        print('The password provided is too weak.');
                      } else if (e.code == 'email-already-in-use') {
                        print('The account already exists for that email.');
                      }
                    } catch (e) {
                      print(e);
                    }
                  }
                },
                child: Text(
                  'Done',
                  style: GoogleFonts.lato(),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
