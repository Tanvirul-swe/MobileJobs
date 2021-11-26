import 'package:flutter/material.dart';
enum Gender { Male, Female, Other }

class SelectGender extends StatefulWidget {
  @override
  _SelectGenderState createState() => _SelectGenderState();
}

class _SelectGenderState extends State<SelectGender> {
  Gender _gender = Gender.Male;

  Widget build(BuildContext context) {
    return Container(
      width: 220,
      height: 220,
      child: Column(
        children: <Widget>[
          ListTile(
            title: const Text('Male'),
            leading: Radio(
              value: Gender.Male,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(() {
                  _gender = value!;
                  print(_gender);
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Female'),
            leading: Radio(
              value: Gender.Female,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(() {
                  _gender = value!;
                });
              },
            ),
          ),
          ListTile(
            title: const Text('Other'),
            leading: Radio(
              value: Gender.Other,
              groupValue: _gender,
              onChanged: (Gender? value) {
                setState(() {
                  _gender = value!;
                });
              },
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('Chancel'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text('OK'),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
