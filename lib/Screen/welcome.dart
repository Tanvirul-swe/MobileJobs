
import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'registrationScreen.dart';

class WelcomePage extends StatefulWidget {
  static const String id = 'WelcomePage';
  @override
  _WelcomePageState createState() => _WelcomePageState();
}

class _WelcomePageState extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent,
        title: Text('Purpose of sign up'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(50.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              children: [
                Expanded(
                    child: Text(
                        'Note: Select your purpose if your are interest for work click "Find Work" and If you hire someone click "Hire Worker"',
                      style: TextStyle(
                        letterSpacing: 1.0,
                        wordSpacing: 3.0,
                        decoration: TextDecoration.underline,
                        color: Colors.blue,
                      ),

                    ),
                ),
              ],
            ),
            SizedBox(
              height: 20.0,
            ),
            RaisedButton(
              elevation: 7,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              textColor: Colors.white,
              color: Colors.green,
              onPressed: () {
                // Navigator.pushNamed(context, Registration.id);
                setState(() {});
              },
              child: Text(
                'Find Work',
                style: GoogleFonts.lato(),
              ),
            ),
            SizedBox(
              height: 10.0,
            ),
            RaisedButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.0)),
              color: Colors.grey,
              textColor: Colors.white,
              elevation: 7.0,
              onPressed: () {

                },
              child: Text(
                'Hire Worker',
                style: GoogleFonts.lato(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
