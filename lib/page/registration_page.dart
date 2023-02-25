// ignore_for_file: deprecated_member_use, prefer_const_constructors, unrelated_type_equality_checks, duplicate_ignore

import 'package:cloud_firestore/cloud_firestore.dart';
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
import 'mobile_sign_in_page.dart';

// ignore: must_be_immutable
class RegistrationPage extends StatefulWidget {
  RegistrationPage({super.key});

  @override
  State<RegistrationPage> createState() => _RegistrationPageState();
}

class _RegistrationPageState extends State<RegistrationPage> {
  TextEditingController nameController = TextEditingController();
  TextEditingController phoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController conframpasswordController = TextEditingController();
  bool loding = false;

  void SignUp(
    String name,
    String email,
    String phone,
    String address,
    String password,
    String confram,
  ) async {
    setState(() {
      loding = true;
    });

    UserCredential credential = await FirebaseAuth.instance
        .createUserWithEmailAndPassword(email: email, password: password);
    var currentUser = FirebaseAuth.instance.currentUser;

    final databaseRef = FirebaseDatabase.instance.ref("User");

    databaseRef
        .child(currentUser!.uid)
        .set({
          "name": name,
          "address": address,
          "email": email,
          "phone": phone,
          "uid": currentUser.uid
        })
        .then((value) {
      Fluttertoast.showToast(msg: "Register Sucessfully !");
      Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context) => MobileSignInView()),
                (route) => false);

    })
        .onError((error, stackTrace) {
      Fluttertoast.showToast(msg: error.toString());

    });

    // myUser user = myUser(
    //   name: name,
    //   email: email,
    //   address: address,
    //   uid: credential.user!.uid,
    //   phone: phone,
    //
    // );

    // await FirebaseFirestore.instance
    //     .collection('User')
    //     .doc(credential.user!.uid)
    //     .set(user.toJson())
    //     .then((value) {
    //   Fluttertoast.showToast(
    //       msg: "Sucessfully",
    //       toastLength: Toast.LENGTH_LONG,
    //       gravity: ToastGravity.BOTTOM,
    //       backgroundColor: Colors.black,
    //       textColor: Colors.red,
    //       fontSize: 16.0);
    //   setState(() {
    //     loding = false;
    //   });
    //   Navigator.pushAndRemoveUntil(
    //       context,
    //       MaterialPageRoute(builder: (context) => MobileSignInView()),
    //       (route) => false);
    // });
    //}
  }

  @override
  Widget build(context) => Scaffold(
        backgroundColor: ColorsCode.page_background_color,
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: ColorsCode.primary_color,
          bottomOpacity: 0.0,
          elevation: 0.0,
          leading: IconButton(
            onPressed: () {},
            icon: Icon(Icons.arrow_back_ios_rounded,
                color: Theme.of(context).textTheme.bodyText1!.color),
          ),
        ),
        body: SafeArea(
            child: SingleChildScrollView(
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
              Style.distan_size10,
              const Center(
                  child: CustomLabelText(
                text: 'User Registration',
                style: Style.robotoHeader20primaryColor,
              )),
              Style.distan_size10,
              const CustomLabelField(
                text: "Your  Name*",
                style: Style.robotoRegular,
              ),
              CustomTextField(
                baseColor: ColorsCode.text_field_base_colors,
                borderColor: ColorsCode.text_border_color,
                errorColor: ColorsCode.text_field_error_colors,
                controller: nameController,
                hint: "Name",
                inputType: TextInputType.text,
                icon: const Icon(
                  Icons.person,
                  color: ColorsCode.icon_primary_colors,
                ),
                eyesIcon: false,
                // validator: Validator.validateEmail,
              ),
              const CustomLabelField(
                text: "Your Phone",
                style: Style.robotoRegular,
              ),
              CustomTextField(
                baseColor: ColorsCode.text_field_base_colors,
                borderColor: ColorsCode.text_border_color,
                errorColor: ColorsCode.text_field_error_colors,
                controller: phoneController,
                hint: "0100000000",
                inputType: TextInputType.emailAddress,
                icon: const Icon(
                  Icons.document_scanner,
                  color: ColorsCode.icon_primary_colors,
                ),
                eyesIcon: false,
                // validator: Validator.validateEmail,
              ),
              const CustomLabelField(
                text: "Your E-mail*",
                style: Style.robotoRegular,
              ),
              CustomTextField(
                baseColor: ColorsCode.text_field_base_colors,
                borderColor: ColorsCode.text_border_color,
                errorColor: ColorsCode.text_field_error_colors,
                controller: emailController,
                hint: "exmaple@mail.com",
                inputType: TextInputType.emailAddress,
                icon: const Icon(
                  Icons.email,
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
              const CustomLabelField(
                text: "Password*",
                style: Style.robotoRegular,
              ),
              CustomTextField(
                baseColor: ColorsCode.text_field_base_colors,
                borderColor: ColorsCode.text_border_color,
                errorColor: ColorsCode.text_field_error_colors,
                controller: passwordController,
                hint: "........",
                inputType: TextInputType.text,

                icon: const Icon(
                  Icons.lock,
                  color: ColorsCode.icon_primary_colors,
                ),
                eyesIcon: true,
                // validator: Validator.validateEmail,
              ),
              const CustomLabelField(
                text: "Confirm-Password*",
                style: Style.robotoRegular,
              ),
              CustomTextField(
                baseColor: ColorsCode.text_field_base_colors,
                borderColor: ColorsCode.text_border_color,
                errorColor: ColorsCode.text_field_error_colors,
                controller: conframpasswordController,
                hint: "........",
                inputType: TextInputType.text,
                icon: const Icon(
                  Icons.lock,
                  color: ColorsCode.icon_primary_colors,
                ),
                eyesIcon: true,
              ),
              CustomSubmitButton(
                  text: "Registration",
                  style: Style.submit_button_style,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  color: ColorsCode.submit_button_primary_color,
                  onPressed: () {
                    var name = nameController.text.trim().toString();
                    var phone = phoneController.text.trim().toString();
                    var email = emailController.text.trim().toString();
                    var address = addressController.text.trim().toString();
                    var password = passwordController.text.trim().toString();
                    var confram =
                        conframpasswordController.text.trim().toString();
                    if (name.isEmpty) {
                      setState(() {
                        Fluttertoast.showToast(
                          msg: "Name con not be empty !",
                        );
                      });
                    } else if (phone.isEmpty) {
                      Fluttertoast.showToast(msg: "Phone con not be empty !");
                    } else if (email.isEmpty) {
                      Fluttertoast.showToast(msg: "Email con not be empty !");
                    } else if (address.isEmpty) {
                      Fluttertoast.showToast(msg: "Address con not be empty !");
                    } else if (password.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Password con not be empty !");
                    } else if (confram.isEmpty) {
                      Fluttertoast.showToast(
                          msg: "Confram Password con not be empty !");
                    } else if (confram != password) {
                      Fluttertoast.showToast(msg: "Password not match !");
                    } else {
                      SignUp(name, email, phone, address, password, confram);
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
