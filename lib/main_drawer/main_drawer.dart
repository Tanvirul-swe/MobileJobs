import 'package:flutter/material.dart';
import 'package:mobilejob/Constants/Colors.dart';

import 'package:mobilejob/Screen/Profile.dart';
import 'package:mobilejob/Screen/loginScreen.dart';
import 'package:mobilejob/Screen/setting.dart';

class MainDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        children: [
          Container(
            width: double.infinity,
            padding: EdgeInsets.all(20.0),
            color: blue,
            child: Center(
              child: Column(
                children: [
                  Container(
                    width: 100.0,
                    height: 100.0,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                        image: NetworkImage(
                            'https://codestoresolutions.com/wp-content/uploads/2020/03/flutterDev.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  Text(
                    'Tanvir islam',
                    style: TextStyle(fontSize: 20.0, color: Colors.white),
                  ),
                  Text(
                    'tanvir@gmail.com',
                    style: TextStyle(fontSize: 15.0, color: Colors.white),
                  )
                ],
              ),
            ),
          ),
          ListTile(
            leading: Icon(
              Icons.person,
              color: IconColor,
            ),
            title: Text('Profile'),
            onTap: () {
              Navigator.pushNamed(context, Profile.id);
            },
          ),
          ListTile(
            leading: Icon(
              Icons.settings,
              color: IconColor,
            ),
            title: Text('Settings'),
            onTap: () {
              Navigator.pop(context);
              Navigator.pushNamed(context, Setting.id);
            },
          ),
          Divider(
            height: 10.0,
            thickness: 1,
            color: Colors.black45,
          ),
          ListTile(
            leading: Icon(
              Icons.support_agent_outlined,
              color: IconColor,
            ),
            title: Text('Support'),
            onTap: null,
          ),
          ListTile(
            leading: Icon(
              Icons.help_center_outlined,
              color: IconColor,
            ),
            title: Text('About Us'),
            onTap: null,
          ),
          ListTile(
            leading: Icon(
              Icons.star_rate_outlined,
              color: IconColor,
            ),
            title: Text('Rate Us'),
            onTap: null,
          ),
          Divider(
            height: 10.0,
            thickness: 1,
            color: Colors.black45,
          ),
          ListTile(
            leading: Icon(
              Icons.logout_outlined,
              color: IconColor,
            ),
            title: Text(
              'Logout',
              style: TextStyle(
                color: FontColor,
              ),
            ),
            onTap: () {
              // Toast.show("Logout Successful", context,
              //     duration: Toast.LENGTH_LONG, gravity: Toast.BOTTOM);
              Navigator.pushNamed(context, LoginTextField.id);
            },
          ),
        ],
      ),
    );
  }
}
