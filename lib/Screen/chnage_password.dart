import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PasswordChange extends StatefulWidget {
  static const String id = 'PasswordChange';
  @override
  _PasswordChangeState createState() => _PasswordChangeState();
}

class _PasswordChangeState extends State<PasswordChange> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Reset password'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              cursorColor: Colors.orange,
              obscureText: true,
              style: TextStyle(
                color: Colors.black,
              ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.all(8.0),
                labelText: 'Enter your email',
                labelStyle: TextStyle(),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(Radius.circular(25.0)),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
                  borderRadius: BorderRadius.circular(25.0),
                ),
                icon: Icon(
                     Icons.email,
                  size: 30.0,
                ),
              ),
            ),

            RaisedButton(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
              color: Colors.grey,
              textColor: Colors.white,
              elevation: 10.0,
              onPressed: () {
                setState(() {});
              },
              child: Text(
                'Next',
                style: GoogleFonts.lato(),
              ),
            ),

          ],

        ),
      ),
    );
  }
}
