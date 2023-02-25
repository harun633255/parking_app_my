import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:parking_app/page/review/user_review.dart';
import 'package:parking_app/utils/colors_code.dart';

import '../mobile_sign_in_page.dart';
import 'add_parking_review.dart';
import 'parking_review.dart';

class BottomREviewNavController extends StatefulWidget {
  BottomREviewNavController( this.uId, {super.key});

  var uId;
  @override
  _BottomNavControllerState createState() => _BottomNavControllerState();
}

class _BottomNavControllerState extends State<BottomREviewNavController> {
  final _pages = [
    // UserReview(),
    // ParkingReview(),
  ];

  var _currentIndex = 0;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: ColorsCode.primary_color,
        onPressed: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => AddParkingReview(widget.uId)));
        },
        child: Icon(Icons.add),
      ),
      appBar: AppBar(
        backgroundColor: ColorsCode.primary_color,

        actions: [
          IconButton(
              onPressed: () {
                print("aaaaaaaaaaaaaaaaaa"+widget.uId);

                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MobileSignInView()),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        elevation: 5,
        selectedItemColor: ColorsCode.primary_color,
        backgroundColor: Colors.white,
        unselectedItemColor: Colors.grey,
        currentIndex: _currentIndex,
        selectedLabelStyle:
            TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.park),
            label: "User Review",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_parking),
            label: "Parking Review",
          ),
        ],
        onTap: (index) {
          setState(() {
            _currentIndex = index;
            print(_currentIndex);
          });
        },
      ),
      body: _pages[_currentIndex],
    );
  }
}
