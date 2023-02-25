// ignore: file_names
// ignore_for_file: file_names, duplicate_ignore

import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

import '../utils/colors_code.dart';
import 'bottom_nav_controller.dart';
import 'mobile_sign_in_page.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {

  @override
  void initState() {

    setState(() {
      final auth = FirebaseAuth.instance;
      final user = auth.currentUser;

      if (user != null) {
        Timer.periodic(Duration(seconds: 0), (timer) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context,) => BottomNavController()),
                  (route) => false);
        });
      } else {
        Timer.periodic(Duration(seconds: 2), (timer) {
          Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(builder: (context) => MobileSignInView()),
                  (route) => false);
        });}
    });



    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    // ignore: prefer_const_constructors

    return Scaffold(
      backgroundColor: ColorsCode.page_background_color,
      body: Container(
        // decoration: const BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage(Images.splashbackgroundimage),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(30.0),
            //   child: Image.asset(
            //     "Images.logo",
            //     height: 250,
            //     width: 400,
            //   ),
            // ),
            const SizedBox(
              height: 15,
            ),
            const SpinKitWave(
              color: ColorsCode.primary_color,
            ),
          ],
        ),
      ),
    );
  }
}
