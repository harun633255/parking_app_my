// ignore_for_file: prefer_const_constructors_in_immutables, prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:parking_app/page/review/parking_review.dart';
import 'package:parking_app/page/review/user_review.dart';

import '../../../../../utils/styles.dart';
import '../../customs/custom_label_for_text_field.dart';
import '../../customs/custom_text_field.dart';
import '../../utils/colors_code.dart';
import '../mobile_sign_in_page.dart';
import 'bottom_nav_controller.dart';

class AddParkingReview extends StatefulWidget {
  AddParkingReview(this.Id, {Key? key}) : super(key: key);
  var Id;

  @override
  State<AddParkingReview> createState() => _AddParkingReviewState();
}

class _AddParkingReviewState extends State<AddParkingReview> {
  TextEditingController review = TextEditingController();

  void AddParkingReviewData(
    String parkingReview,
  ) async {
    setState(() {
      //loding = true;
    });

    User? currentUser = FirebaseAuth.instance.currentUser;

    final databaseRef = FirebaseDatabase.instance.ref("ParkingReview");
    var id = DateTime.now().microsecondsSinceEpoch.toString();

    databaseRef.child(widget.Id).child(id).set({
      "parkingReview": parkingReview,
      "uid": currentUser!.uid,
    }).then((value) {
      Fluttertoast.showToast(
          msg: "Sucessfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.red,
          fontSize: 16.0);
      setState(() {
        // loding = false;
      });
      Fluttertoast.showToast(msg: "Register Sucessfully !");

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => ParkingReview(id)),
          (route) => false);
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCode.page_background_color,

      appBar: AppBar(
        backgroundColor: ColorsCode.primary_color,
        actions: [
          IconButton(
              onPressed: () {
                FirebaseAuth.instance.signOut();
                Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => MobileSignInView()),
                    (route) => false);
              },
              icon: Icon(Icons.logout))
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          width: double.infinity,
          //height: Get.height,
          padding: EdgeInsets.only(left: 0, top: 120, right: 0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Center(
                child: CustomLabelField(
                  text: "Park Review ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w600,
                      fontFamily: 'Roboto'),
                ),
              ),
              Style.distan_size20,
              CustomLabelField(
                text: "Write Review About Park",
                style: Style.robotoRegular,
              ),
              CustomTextField(
                baseColor: ColorsCode.text_field_base_colors,
                borderColor: ColorsCode.text_border_color,
                errorColor: ColorsCode.text_field_error_colors,
                controller: review,
                hint: "",
                inputType: TextInputType.text,
                icon: null,
                eyesIcon: false,
                onChangedFunction: null,
                // validator: Validator.validateEmail,
              ),
              Style.distan_size20,
              Container(
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    GestureDetector(
                      onTap: () {
                        var reviewText = review.text.trim().toString();
                        if (reviewText.isEmpty) {
                          setState(() {
                            Fluttertoast.showToast(
                              msg: "Name con not be empty !",
                            );
                          });
                        } else {
                          AddParkingReviewData(
                            reviewText,
                          );
                        }
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
                            "Confirm",
                            style: TextStyle(
                                color: Color(0xFFFFFFFF),
                                fontSize: 12,
                                fontWeight: FontWeight.w600,
                                fontFamily: 'Roboto'),
                          ),
                        ),
                      ),
                    ),
                    Style.distan_size5,
                  ],
                ),
              ),
            ],
          ),
        ),
      ), // Column
    );
  }
}
