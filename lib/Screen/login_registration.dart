import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobilejob/Screen/welcome.dart';
import 'loginScreen.dart';

class LoginRegistration extends StatefulWidget {
  static const String id = 'LoginRegistration';
  @override
  _LoginRegistrationState createState() => _LoginRegistrationState();
}

class _LoginRegistrationState extends State<LoginRegistration> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Mobile Job'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Image.asset(
                  'Images/mobilejobicon.png',
                  height: 40,
                  width: 40,
                ),
                Container(
                  width: 250,
                  height: double.minPositive,
                  child: WavyAnimatedTextKit(
                    textStyle: TextStyle(
                      fontSize: 25.0,
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic,
                    ),

                    text: [
                      "Welcome to Mobile Job",
                    ],
                    isRepeatingAnimation: true,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              elevation: 7,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: () {
                Navigator.pushNamed(context, LoginTextField.id);
                setState(() {});
              },
              child: Text(
                'Sign In',
                style: GoogleFonts.lato(),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),

            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              color: Colors.grey,
              textColor: Colors.white,
              elevation: 7.0,
              onPressed: () {
                Navigator.pushNamed(context, WelcomePage.id);
                setState(() {});
              },
              child: Text(
                'Sign Up',
                style: GoogleFonts.lato(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
