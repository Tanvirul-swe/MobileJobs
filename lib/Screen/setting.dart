import 'package:flutter/material.dart';

class Setting extends StatefulWidget {
  static const String id = 'SettingScreen';
  @override
  _SettingState createState() => _SettingState();
}

class _SettingState extends State<Setting> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings'),
      ),
      body: Row(
        children: [
          Text('i am  Settings screen'),
        ],
      ),
    );
  }
}
