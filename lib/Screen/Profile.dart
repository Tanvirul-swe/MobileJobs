import 'dart:io';
import 'dart:ui';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobilejob/Constants/Colors.dart';
import 'package:mobilejob/Constants/Icon_list.dart';
import 'package:mobilejob/Constants/String_value.dart';
import 'package:mobilejob/CustomWidget/Select_Servies.dart';
import 'package:mobilejob/CustomWidget/Select_gender.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:url_launcher/url_launcher.dart';
String? phone;
class Profile extends StatefulWidget {
  static String id = 'Profile';
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  bool isSwitched = false;
  var textValue = 'Switch is OFF';
  TabController? _tabController;
  ScrollController _scrollController = ScrollController();
  bool closeTopContainer = false;
  bool permissionGranted = false;
  File? _image;
  final ImagePicker _picker = ImagePicker();
  final String data = 'provider data';
  final double login = 100.0;
  void toggleSwitch(bool value) {
    if (isSwitched == false) {
      setState(() {
        isSwitched = true;
        textValue = 'Active';
      });
    } else {
      setState(() {
        isSwitched = false;
        textValue = 'Deactivate';
      });
      print('Switch Button is OFF');
    }
  }

  GetImageFromGallery() async {
    final files = await _picker.getImage(source: ImageSource.gallery);
    setState(() {
      if (files != null) {
        _image = File(files.path);
      }
    });
  }

  @override
  void initState() {
    _getStoragePermission();
    _tabController = TabController(length: 2, vsync: this);
    _scrollController.addListener(() {
      setState(() {
        closeTopContainer = _scrollController.offset > 50;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
    _tabController!.dispose();
  }

  Future _getStoragePermission() async {
    if (await Permission.storage.request().isGranted) {
      setState(() {
        permissionGranted = true;
      });
    } else if (await Permission.storage.request().isPermanentlyDenied) {
      await openAppSettings();
    } else if (await Permission.storage.request().isDenied) {
      setState(() {
        permissionGranted = false;
      });
    }
  }

  Future<void> _displayTextInputDialog(
      BuildContext context, int index, String oldvalue) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: index == 0
                ? Text('Update Email')
                : index == 1
                    ? Text('Update number')
                    : index == 4
                        ? Text('Update address')
                        : index == 10
                            ? Text('Update About')
                            : index == 11
                                ? Text('Update Service')
                                : index == 12
                                    ? Text('Update Experience')
                                    : null,
            content: TextFormField(
              onChanged: (value) {
                setState(() {});
              },
              initialValue: oldvalue,
              decoration: InputDecoration(
                hintText: "Registered gmail",
              ),
            ),
            actions: <Widget>[
              FlatButton(
                color: Colors.white,
                textColor: Colors.black,
                child: Text('Cancel'),
                onPressed: () {
                  setState(() {
                    Navigator.pop(context);
                  });
                },
              ),
              FlatButton(
                color: Colors.white,
                textColor: Colors.black,
                child: Text('Ok'),
                onPressed: () {
                  setState(() {});
                },
              ),
            ],
          );
        });
  }

  DateTime selectedDate = DateTime.now();
  Future<Null> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime(2015, 8),
        lastDate: DateTime(2101));
    if (picked != null && picked != selectedDate)
      setState(() {
        selectedDate = picked;
      });
  }

  bool checkedValue = false;
  Future<void> _selectGender(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('Select Gender'),
            content: SelectGender(),
          );
        });
  }

  Future<void> _SelectService(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Column(
              children: [
                Text('Select Services'),
                Text(
                  'Note : Maximum 3 item',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            content: SelectServices(),
            actionsAlignment: MainAxisAlignment.spaceAround,
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('Cancel')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text('OK')),
            ],
          );
        });
  }

  _makingPhoneCall() async {

    if (await canLaunch('tel:$phone')) {
      await launch('tel:$phone');
    } else {
      throw 'Could not launch tel:$phone';
    }
  }
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('UserInformation')
      .doc('worker')
      .collection('general')
      .snapshots();
  User? user = FirebaseAuth.instance.currentUser;

  bool? check;
  @override
  Widget build(BuildContext context) {
    // var width = MediaQuery.of(context).size.width;
    // var height = MediaQuery.of(context).size.height;
    final Size size = MediaQuery.of(context).size;
    CollectionReference users = FirebaseFirestore.instance
        .collection('UserInformation')
        .doc('worker')
        .collection('general');
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.white, //change your color here
        ),
        backgroundColor: blue,
        centerTitle: true,
        title: Text(
          'Profile',
          style: TextStyle(color: Colors.white),
        ),
      ),
      body: FutureBuilder<DocumentSnapshot>(
        future: users.doc(user!.uid).get(),
        builder:
            (BuildContext context, AsyncSnapshot<DocumentSnapshot> snapshot) {
          if (snapshot.hasError) {
            return Text("Something went wrong");
          }

          if (snapshot.hasData && !snapshot.data!.exists) {
            return Text("Document does not exist");
          }

          if (snapshot.connectionState == ConnectionState.done) {
            Map<String, dynamic> data =
                snapshot.data!.data() as Map<String, dynamic>;
            // final List userinformation = [];
            // userinformation.add(data['email']);
            // userinformation.add(data['phone']);
            // userinformation.add(data['gender']);
            // userinformation.add(data['birthday']);
            // userinformation.add(data['permanent_address']);
            // userinformation.add('notverified');

            GetUserData getUserData = GetUserData(
                data['name'],
                data['email'],
                data['phone'],
                data['gender'],
                data['birthday'],
                data['permanent_address'],
                'notverify');
            final List userdata = [getUserData.email,getUserData.phone,getUserData.gender,getUserData.birthday,getUserData.present_address,getUserData.nid_verifycheck];
          phone = getUserData.phone;
            return Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                child: Column(
                  children: [
                    AnimatedContainer(
                      duration: Duration(milliseconds: 200),
                      height: closeTopContainer ? 0 : size.height * 0.3,
                      width: double.infinity,
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Container(
                              height: 120,
                              width: double.infinity,
                              child: CircleAvatar(
                                radius: 75.0,
                                backgroundColor: Colors.brown,
                                child: _image != null
                                    ? CircleAvatar(
                                        backgroundImage: NetworkImage(
                                            'https://media-exp1.licdn.com/dms/image/C5603AQFiaRzVQlRjVQ/profile-displayphoto-shrink_800_800/0/1607543467153?e=1637798400&v=beta&t=JMEcj3cPp5BuDezAmHbI8rq9bqyKINEpeo4jSUWY4fs'),
                                        radius: 58,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      offset: Offset(
                                                          0.0, 2.0), //(x,y)
                                                      blurRadius: 5.0,
                                                    ),
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Center(
                                                    child: IconButton(
                                                  onPressed: () {
                                                    GetImageFromGallery();
                                                  },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    size: 20,
                                                  ),
                                                  color: IconColor,
                                                )),
                                              ),
                                              top: 75,
                                              right: -10,
                                            ),
                                          ],
                                          overflow: Overflow.visible,
                                        ),
                                      )
                                    : CircleAvatar(
                                        backgroundImage: AssetImage(
                                          'Images/default_pro_pic.jpg',
                                        ),
                                        radius: 60,
                                        child: Stack(
                                          children: [
                                            Positioned(
                                              child: Container(
                                                height: 35,
                                                width: 35,
                                                decoration: BoxDecoration(
                                                  boxShadow: [
                                                    BoxShadow(
                                                      color: Colors.grey,
                                                      offset: Offset(
                                                          0.0, 2.0), //(x,y)
                                                      blurRadius: 5.0,
                                                    ),
                                                  ],
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                                child: Center(
                                                    child: IconButton(
                                                  onPressed: () {
                                                    GetImageFromGallery();
                                                  },
                                                  icon: Icon(
                                                    Icons.edit,
                                                    size: 20,
                                                  ),
                                                  color: IconColor,
                                                )),
                                              ),
                                              top: 75,
                                              right: -10,
                                            ),
                                          ],
                                          overflow: Overflow.visible,
                                        ),
                                      ),
                              ),
                            ),
                            Text(
                              // data['name'],
                              getUserData.name,
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.w400),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            Text('Mirpur 1 Majar road'),
                            SizedBox(
                              height: 5,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.star,
                                  size: 18.0,
                                  color: Colors.lightGreen,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18.0,
                                  color: Colors.lightGreen,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18.0,
                                  color: Colors.lightGreen,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18.0,
                                  color: Colors.lightGreen,
                                ),
                                Icon(
                                  Icons.star,
                                  size: 18.0,
                                  color: Colors.lightGreen,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {});
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: blue,
                                      borderRadius: BorderRadius.circular(25),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.email_outlined,
                                          color: Colors.white,
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text(
                                          'Email',
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    _makingPhoneCall();
                                  },
                                  child: Container(
                                    height: 40,
                                    width: 150,
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(25),
                                      border: Border.all(color: Colors.black38),
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.call),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Text('Call'),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 5,
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        child: Column(
                          children: [
                            Container(
                              height: 30,
                              decoration: BoxDecoration(
                                  border: Border(
                                      bottom: BorderSide(
                                color: Colors.grey,
                                width: 2.0,
                              ))),
                              child: TabBar(
                                controller: _tabController,
                                indicator: BoxDecoration(
                                  border: Border(
                                    bottom: BorderSide(
                                      color: blue,
                                      width: 2.0,
                                    ),
                                  ),
                                ),
                                labelColor: Colors.black,
                                unselectedLabelColor: Colors.black54,
                                tabs: [
                                  Tab(
                                    text: 'General',
                                  ),
                                  Tab(
                                    text: 'Work Area',
                                  ),
                                ],
                              ),
                            ),
// tab bar view here
                            Expanded(
                              child: Container(
                                color: Color(0xFFEAEBF1),
                                child: TabBarView(
                                  controller: _tabController,
                                  children: [
                                    Expanded(
//Todo: Listview
                                      child: ListView.builder(
                                        controller: _scrollController,
                                        itemCount: 6,
                                        physics: BouncingScrollPhysics(),
                                        itemBuilder: (context, index) {
                                          return InkWell(
                                            onTap: () {
                                              index == 2
                                                  ? _selectGender(context)
                                                  : index == 3
                                                      ? _selectDate(context)
                                                      : _displayTextInputDialog(
                                                          context,
                                                          index,
                                                          userdata[
                                                              index]);
                                            },
                                            child: Container(
                                                width: double.infinity,
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                        color: Colors.white,
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      height: 60,
                                                      width: double.infinity,
                                                      child: Column(
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            height: 5,
                                                          ),
                                                          Row(
                                                            children: [
                                                              Icon(
                                                                IconList[index],
                                                                size: 20,
                                                                color:
                                                                    IconColor,
                                                              ),
                                                              SizedBox(
                                                                width: 15,
                                                              ),
                                                              Text(
                                                                general[index],
                                                                style: TextStyle(
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize:
                                                                        15),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            children: [
                                                              SizedBox(
                                                                width: 36,
                                                              ),
                                                              Text(
                                                                userdata[
                                                                        index]
                                                                    .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .black54,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      height: 5,
                                                    ),
                                                  ],
                                                )),
                                          );
                                        },
                                      ),
                                    ),
                                    Container(
                                      color: Colors.white,
                                      child: SingleChildScrollView(
                                        child: Column(
                                          children: [
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'About Me',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      _displayTextInputDialog(
                                                          context,
                                                          10,
                                                          'This is old value');
                                                    },
                                                    icon: Icon(
                                                      Icons.edit,
                                                      color: IconColor,
                                                    ))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                  child: Text(
                                                    'Hi this is tanvir islam.I am a Flutter developer i have more then 2 year real life project expariance with proper documentation and i can use statmanagement ',
                                                    style: TextStyle(
                                                      color: Colors.black87,
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'My Service',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      _displayTextInputDialog(
                                                          context,
                                                          11,
                                                          'This is old value');
                                                    },
                                                    icon: Icon(Icons.edit,
                                                        color: IconColor))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 10,
                                            ),
                                            Wrap(
                                              alignment:
                                                  WrapAlignment.spaceBetween,
                                              direction: Axis.horizontal,
                                              children: [
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    child: Center(
                                                        child: Text(
                                                            'Electrician')),
                                                    height: 30,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[300],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    child: Center(
                                                        child: Text(
                                                            'Electrician')),
                                                    height: 30,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[300],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                ),
                                                Padding(
                                                  padding:
                                                      const EdgeInsets.all(8.0),
                                                  child: Container(
                                                    child: Center(
                                                        child: Text(
                                                            'Electrician')),
                                                    height: 30,
                                                    width: 100,
                                                    decoration: BoxDecoration(
                                                      color: Colors.grey[300],
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15),
                                                    ),
                                                  ),
                                                ),
                                              ],
                                            ),
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                              children: [
                                                Text(
                                                  'My Experience',
                                                  style: TextStyle(
                                                    fontSize: 17,
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                                ),
                                                IconButton(
                                                    onPressed: () {
                                                      _SelectService(context);
                                                    },
                                                    icon: Icon(Icons.edit,
                                                        color: IconColor))
                                              ],
                                            ),
                                            SizedBox(
                                              height: 15,
                                            ),
                                            Row(
                                              children: [
                                                Expanded(
                                                    child: Text(
                                                        'I have more then 10 year hanson exparience and i can solve may problem about my relevent problem')),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }

          return Center(child: CircularProgressIndicator());
        },
      ),
    );
  }
}

//
// class StackOver extends StatefulWidget {
//   @override
//   _StackOverState createState() => _StackOverState();
// }
//
// class _StackOverState extends State<StackOver>
//     with SingleTickerProviderStateMixin {
//   TabController _tabController;
//   double loginWidth = 100.0;
//   ScrollController _scrollController = ScrollController();
//   bool closeTopContainer = false;
//
//   @override
//   void initState() {
//     _tabController = TabController(length: 2, vsync: this);
//     _scrollController.addListener(() {
//       setState(() {
//         closeTopContainer = _scrollController.offset > 50;
//       });
//     });
//     super.initState();
//   }
//
//   @override
//   void dispose() {
//     super.dispose();
//     _tabController.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Padding(
//         padding: const EdgeInsets.all(8.0),
//         child: Column(
//           children: [
//             Container(
//               height: 30,
//               decoration: BoxDecoration(
//                   border: Border(
//                       bottom: BorderSide(
//                 color: Colors.grey[300],
//                 width: 2.0,
//               ))),
//               child: TabBar(
//                 controller: _tabController,
//                 indicator: BoxDecoration(
//                   border: Border(
//                     bottom: BorderSide(
//                       color: Colors.blue,
//                       width: 2.0,
//                     ),
//                   ),
//                 ),
//                 labelColor: Colors.black,
//                 unselectedLabelColor: Colors.black54,
//                 tabs: [
//                   Tab(
//                     text: 'General',
//                   ),
//                   Tab(
//                     text: 'Work Area',
//                   ),
//                 ],
//               ),
//             ),
//             // tab bar view here
//             Expanded(
//               child: Container(
//                 child: TabBarView(
//                   controller: _tabController,
//                   children: [
//                     RaisedButton(
//                       onPressed: () {
//                         setState(() {
//                           loginWidth = 300.0;
//                         });
//                       },
//                       child: Expanded(
//                         child: ListView.builder(
//                           controller: _scrollController,
//                           itemCount: 40,
//                           physics: BouncingScrollPhysics(),
//                           itemBuilder: (context, index) {
//                             return Text(Provider.of(context));
//                           },
//                         ),
//                       ),
//                     ),
//                     Center(
//                       child: Text('demo'),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
