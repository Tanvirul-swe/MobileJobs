import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobilejob/Constants/Colors.dart';
import 'package:mobilejob/Screen/Profile.dart';
import 'package:mobilejob/Services/demo.dart';

class ActiveWorker extends StatefulWidget {
  static String id = 'ActiveWorker';

  @override
  _ActiveWorkerState createState() => _ActiveWorkerState();
}

class _ActiveWorkerState extends State<ActiveWorker> {
  List<String> name = [
    "Tanvir islam",
    "Alamin toke",
    "Zahid ontro",
    "Shanto islam",
  ];
  @override
  void initState() {
    User? user = FirebaseAuth.instance.currentUser;
    Demo(user!.uid);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFDFE1F3),
      appBar: AppBar(

        backgroundColor: blue,
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                showSearch(context: context, delegate: DataSearch());
              },
              icon: Icon(Icons.search))
        ],
        title: Text('Active worker'),
      ),
      body: RefreshIndicator(
        onRefresh: _refresh,
        backgroundColor: blue,
        color: Colors.white,
        strokeWidth: 2,
        displacement: 50,
        child: ListView.builder(
            itemCount: name.length,
            itemBuilder: (context, index) {
              return InkWell(
                onTap: () {
                  Navigator.pushNamed(context, Profile.id);
                  print(index);
                },
                child: Card(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {},
                        child: Container(
                          child: CircleAvatar(
                            radius: 50.0,
                            backgroundColor: Colors.greenAccent[100],
                            child: CircleAvatar(
                              radius: 45.0,
                              backgroundImage: AssetImage('Images/pic.png'),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        width: 15.0,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(
                                name[index],
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 17.0,
                                ),
                              ),
                              SizedBox(
                                width: 5.0,
                              ),
                              Icon(
                                Icons.verified_outlined,
                                color: Colors.green,
                                size: 15.0,
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 3.0,
                          // ),
                          Row(
                            children: [
                              Icon(
                                Icons.star,
                                color: Colors.lightGreen,
                                size: 18.0,
                              ),
                              Icon(
                                Icons.star_half,
                                color: Colors.lightGreen,
                                size: 18.0,
                              ),
                            ],
                          ),
                          // SizedBox(
                          //   height: 3.0,
                          // ),
                          Text('Mirpur1 majar road'),
                          SizedBox(
                            height: 3.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text('Nurse'),
                              SizedBox(
                                width: 10.0,
                              ),
                              Icon(
                                Icons.my_location,
                                color: Colors.black54,
                                size: 20.0,
                              ),
                              Text(
                                ' 500m',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }),
      ),
    );
  }
  Future<void> _refresh()async {
    return Future.delayed(
      Duration(seconds: 3),
    );
  }
}

class DataSearch extends SearchDelegate<String> {
  final cities = [
    'Dhaka',
    'Rajshahi',
    'Naogaon',
    'Nator',
    'tangile',
    'Borisal',
    'Khulna',
  ];
  final recentCites = [
    'tangile',
    'Borisal',
    'Khulna',
  ];
  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
          onPressed: () {
            query = "";
          },
          icon: Icon(Icons.clear)),
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
        onPressed: () {
          close(context, '');
        },
        icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation,
        ));
  }

  @override
  Widget buildResults(BuildContext context) {
     return Center(
       child: Container(
         color: Colors.redAccent,
         height: 100,
         width: 100,
         child: Text(query),
       ),
     );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    final suggestionList = query.isEmpty ? recentCites : cities.where((p) => p.startsWith(query)).toList();
    return ListView.builder(
      itemBuilder: (context, index) => ListTile(
        onTap: (){
      showResults(context);
        },
        leading: Icon(Icons.location_city),
        title: RichText(
          text: TextSpan(
            text: suggestionList[index].substring(0,query.length),
            style: TextStyle(
              color: Colors.black,fontWeight: FontWeight.bold,
            ),
            children: [
              TextSpan(
                text: suggestionList[index].substring(query.length),
                style: TextStyle(
                  color: Colors.grey,
                ),
              ),
            ],
          ),
        ),
      ),
      itemCount: suggestionList.length,
    );
  }
}
