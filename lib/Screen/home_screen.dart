import 'package:flutter/material.dart';
import 'package:mobilejob/Constants/Colors.dart';
import 'package:mobilejob/Constants/work_category_decoration.dart';
import 'package:mobilejob/Screen/Active_worker_list.dart';

import 'package:mobilejob/main_drawer/main_drawer.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class HomeScreen extends StatefulWidget {
  static const String id = 'HomeScreen';
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  PageController? _pageController;

  @override
  void initState() {
    super.initState();

    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MainDrawer(),
      //Multiple ternary operations
      appBar: AppBar(
        backgroundColor: blue,
        title: (_currentIndex == 0
            ? Text("Home")
            : (_currentIndex == 1 ? Text('Messages') : Text('Notification'))),
      ),
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: <Widget>[
            Container(
                color: Colors.white38,
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        width: double.infinity,
                        height: 100,
                        color: Colors.white,
                        child: Image.asset(
                          'Images/add.png',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        color: Color(0xFFF5F9FC),
                        child: GridView.extent(
                          primary: false,
                          padding: const EdgeInsets.all(13),
                          crossAxisSpacing: 5,
                          mainAxisSpacing: 5,
                          maxCrossAxisExtent: 150.0,
                          children: <Widget>[
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, ActiveWorker.id);
                              },
                              child: Container(
                                decoration: KWorkCategory,
                                child: Padding(
                                  padding: const EdgeInsets.all(5.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image(
                                        image: AssetImage(
                                            'Images/wall_painter.png'),
                                        color: IconColor,
                                        width: 50.0,
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Wall Painter',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          color: FontColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            Container(
                              decoration: KWorkCategory,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage('Images/carrent.png'),
                                      color: IconColor,
                                      width: 50.0,
                                    ),
                                    Text(
                                      'Car Rental',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: FontColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: KWorkCategory,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image:
                                          AssetImage('Images/electrician.png'),
                                      color: IconColor,
                                      width: 50.0,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Electrician',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: FontColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: KWorkCategory,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Image(
                                      image:
                                          AssetImage('Images/carcleannig.png'),
                                      color: IconColor,
                                      width: 50.0,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Car Cleaning',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: FontColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: KWorkCategory,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage('Images/truck.png'),
                                      color: IconColor,
                                      width: 50.0,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Truck Rent',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: FontColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: KWorkCategory,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage('Images/ambulance.png'),
                                      color: IconColor,
                                      width: 50.0,
                                    ),
                                    Text(
                                      'Ambulance\nService',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: FontColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: KWorkCategory,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage('Images/desktop.png'),
                                      color: IconColor,
                                      width: 50.0,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Desktop Service',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: FontColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: KWorkCategory,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage('Images/laptop.png'),
                                      color: IconColor,
                                      width: 50.0,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'Laptop Service',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: FontColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            Container(
                              decoration: KWorkCategory,
                              child: Padding(
                                padding: const EdgeInsets.all(5.0),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image(
                                      image: AssetImage('Images/cleanning.png'),
                                      color: IconColor,
                                      width: 50.0,
                                    ),
                                    SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      'House Clean',
                                      style: TextStyle(
                                        fontWeight: FontWeight.normal,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                )),
            Container(
              color: Color(0xFFF2F5FC),
              child: Text('Message'),
            ),
            Container(
              color: Color(0xFFF2F5FC),
              child: ListView.builder(
                padding: EdgeInsets.all(8),
                itemCount: 5,
                itemBuilder: (context, index) {
                  return Container(
                    height: 100,
                    width: double.infinity,
                    color: Colors.redAccent,
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Icon(Icons.notifications_active_outlined,size: 50,),
                          ],
                        ),
                        Column(
                          children: [
                            Icon(Icons.notifications_active_outlined),
                          ],
                        )
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        backgroundColor: blue,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController!.jumpToPage(index);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
            title: Text(
              'Home',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            icon: Icon(
              Icons.home,
            ),
            inactiveColor: Colors.grey,
            activeColor: Colors.white,
          ),
          BottomNavyBarItem(
              title: Text(
                'Messages',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: Icon(
                Icons.message_outlined,
              ),
              inactiveColor: Colors.grey,
              activeColor: Colors.white),
          BottomNavyBarItem(
              title: Text(
                'Notification',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              icon: Icon(Icons.notifications_active_outlined),
              inactiveColor: Colors.grey,
              activeColor: Colors.white),
        ],
      ),
    );
  }
}
