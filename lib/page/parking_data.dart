// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:parking_app/page/review/add_parking_review.dart';
import 'package:parking_app/page/review/parking_review.dart';
import 'package:parking_app/page/review/user_review.dart';

import '../../../../utils/styles.dart';
import '../utils/colors_code.dart';

class ParkingPersionData extends StatelessWidget {
  ParkingPersionData(this.dataId,{Key? key}) : super(key: key);

  var dataId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCode.page_background_color,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: ColorsCode.primary_color,
        bottomOpacity: 0.0,
        elevation: 0.0,

      ),
      // floatingActionButton: FloatingActionButton(
      //     onPressed: ()
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          //height: Get.height,
          padding: EdgeInsets.only(left: 20, top: 120, right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text("Parking Information", style: Style.textNormal),

              Style.distan_size20,
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 110,
                      child:
                      Text("Parking Name", style: Style.textNormal),
                    ),
                    SizedBox(
                      child: Text(": dhaka bangladesh",
                          style: Style.textNormal),
                    )
                  ]),
              Style.distan_size5,  Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 110,
                      child:
                      Text("Username", style: Style.textNormal),
                    ),
                    SizedBox(
                      child: Text(": Md. Ashikur Rahman",
                          style: Style.textNormal),
                    )
                  ]),
              Style.distan_size5,
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 110,
                      child: Text("User Phone",
                          style: Style.textNormal),
                    ),
                    SizedBox(
                      child: Text(": +88 01230-350205",
                          style: Style.textNormal),
                    )
                  ]),
              Style.distan_size5,
              Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 110,
                      child: Text("User E-mail",
                          style: Style.textNormal),
                    ),
                    SizedBox(
                      child: Text(": example@gmail.com",
                          style: Style.textNormal),
                    )
                  ]),
              Style.distan_size5,

              Divider(height: 100),

              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => ParkingReview(dataId)));
                    // Get.offAndToNamed(RouteManeger.gymadmission);
                  },
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xff128041),
                    ),
                    child: Center(
                      child: Text(
                        "Parking",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => UserReview(dataId)));
                    // Get.offAndToNamed(RouteManeger.gymadmission);
                  },
                  child: Container(
                    height: 35,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8.0),
                      color: Color(0xff128041),
                    ),
                    child: Center(
                      child: Text(
                        "User Review",
                        style: TextStyle(
                            color: Color(0xFFFFFFFF),
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                            fontFamily: 'Roboto'),
                      ),
                    ),
                  ),
                ),
              ],)

            ],
          ),
        ),
      ), // Column
    );
  }
}


