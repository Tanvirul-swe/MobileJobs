import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:mobilejob/Screen/Active_worker_list.dart';
import 'package:mobilejob/Screen/Profile.dart';
import 'package:mobilejob/Screen/chnage_password.dart';
import 'package:mobilejob/Screen/home_screen.dart';
import 'package:mobilejob/Screen/registrationScreen.dart';
import 'package:mobilejob/Screen/setting.dart';
import 'package:mobilejob/Screen/welcome.dart';
import 'Screen/login_registration.dart';
import 'Screen/loginScreen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: LoginTextField.id,
      routes: {
        LoginRegistration.id: (context) => LoginRegistration(),
        LoginTextField.id: (context) => LoginTextField(),
        // Registration.id: (context) => Registration(),
        WelcomePage.id: (context) => WelcomePage(),
        PasswordChange.id: (context) => PasswordChange(),
        Setting.id: (context) => Setting(),
        HomeScreen.id: (context) => HomeScreen(),
        ActiveWorker.id: (context) => ActiveWorker(),
        Profile.id: (context) => Profile(),
      },
      // home: LoginRegistration(),
    );
  }
}
