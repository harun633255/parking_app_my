// ignore_for_file: deprecated_member_use, prefer_const_constructors, unrelated_type_equality_checks, duplicate_ignore

import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../customs/custom_label_for_text_field.dart';
import '../customs/custom_text_field.dart';
import '../customs/custom_winkwell_button.dart';
import '../customs/customs_label.dart';
import '../customs/customs_submit_button.dart';
import '../utils/colors_code.dart';
import '../utils/styles.dart';
import 'bottom_nav_controller.dart';
import 'mobile_sign_in_page.dart';

// ignore: must_be_immutable
class ParkingRegistrationPage extends StatefulWidget {
  ParkingRegistrationPage(this.latid, this.longid, {super.key});

  var latid;
  var longid;

  @override
  State<ParkingRegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<ParkingRegistrationPage> {
  TextEditingController parkingnameController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  bool loding = false;

  void SignUp(String parking,
      String address,) async {
    setState(() {
      loding = true;
    });

    User? currentUser = FirebaseAuth.instance.currentUser;

    final databaseRef = FirebaseDatabase.instance.ref("UserParking");
    var id = DateTime
        .now()
        .microsecondsSinceEpoch
        .toString();

    databaseRef.child(id).set({
      "parkingname": parking,
      "address": address,
      "uid": currentUser!.uid.toString(),
      "lat": widget.latid,
      "long": widget.longid
    }).then((value) {
      Fluttertoast.showToast(
          msg: "Sucessfully",
          toastLength: Toast.LENGTH_LONG,
          gravity: ToastGravity.BOTTOM,
          backgroundColor: Colors.black,
          textColor: Colors.red,
          fontSize: 16.0);
      setState(() {
        loding = false;
      });
      Fluttertoast.showToast(msg: "Register Sucessfully !");

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) => BottomNavController()),
              (route) => false);
    }).onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());
    });
  }

  @override
  Widget build(context) =>
      Scaffold(
        backgroundColor: ColorsCode.page_background_color,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorsCode.primary_color,
          bottomOpacity: 0.0,
          elevation: 0.0,

        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Style.distan_size10,
                      const Center(
                          child: CustomLabelText(
                            text: 'User Parking Registration',
                            style: Style.robotoHeader20primaryColor,
                          )),
                      Style.distan_size10,
                      const CustomLabelField(
                        text: "Your Parking Name*",
                        style: Style.robotoRegular,
                      ),
                      CustomTextField(
                        baseColor: ColorsCode.text_field_base_colors,
                        borderColor: ColorsCode.text_border_color,
                        errorColor: ColorsCode.text_field_error_colors,
                        controller: parkingnameController,
                        hint: "Parking Name",
                        inputType: TextInputType.text,
                        icon: const Icon(
                          Icons.person,
                          color: ColorsCode.icon_primary_colors,
                        ),
                        eyesIcon: false,
                        // validator: Validator.validateEmail,
                      ),

                      const CustomLabelField(
                        text: "Your Address*",
                        style: Style.robotoRegular,
                      ),
                      CustomTextField(
                        baseColor: ColorsCode.text_field_base_colors,
                        borderColor: ColorsCode.text_border_color,
                        errorColor: ColorsCode.text_field_error_colors,
                        controller: addressController,
                        hint: "Address",
                        inputType: TextInputType.text,
                        icon: const Icon(
                          Icons.email,
                          color: ColorsCode.icon_primary_colors,
                        ),
                        eyesIcon: false,
                        // validator: Validator.validateEmail,
                      ),
                      CustomSubmitButton(
                          text: "Registration",
                          style: Style.submit_button_style,
                          padding: const EdgeInsets.only(top: 10, bottom: 10),
                          color: ColorsCode.submit_button_primary_color,
                          onPressed: () {
                            var parkingname =
                            parkingnameController.text.trim().toString();
                            var address = addressController.text.trim()
                                .toString();
                            if (parkingname.isEmpty) {
                              setState(() {
                                Fluttertoast.showToast(
                                  msg: "Name con not be empty !",
                                );
                              });
                            } else if (address.isEmpty) {
                              Fluttertoast.showToast(
                                  msg: "Address con not be empty !");
                            } else {
                              SignUp(
                                parkingname,
                                address,
                              );
                              print(widget.longid);
                              print(widget.latid);
                            }
                          },
                          booldata: true,
                          leftpad: 56,
                          rightpad: 56,
                          borderCircular: 20),
                      Style.distan_size10,
                      Center(
                        child: CustomtWinkwellButton(
                            text1: "Already have an account ?  ",
                            text2: "Log In",
                            style1: Style.robotoRegular,
                            style2: Style.text_style,
                            onPressed: () {}),
                      ),
                    ]))),
      );
}
