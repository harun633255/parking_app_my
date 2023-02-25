// ignore_for_file: deprecated_member_use



import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import '../../customs/custom_label_for_text_field.dart';
import '../../customs/custom_text_button.dart';
import '../../customs/custom_text_field.dart';
import '../../customs/custom_winkwell_button.dart';
import '../../customs/customs_label.dart';
import '../../customs/customs_submit_button.dart';
import '../../utils/colors_code.dart';
import '../../utils/styles.dart';
import 'bottom_nav_controller.dart';
import 'registration_page.dart';

// ignore: must_be_immutable
class MobileSignInView extends StatefulWidget {
  const MobileSignInView({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MobileSignInViewState createState() => _MobileSignInViewState();
}

class _MobileSignInViewState extends State<MobileSignInView> {
  // SignInSignUpCustomsController signInController =
  //     Get.put(SignInSignUpCustomsController());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsCode.page_background_color,
      appBar: AppBar(
              centerTitle: true,
              backgroundColor: ColorsCode.primary_color,
              bottomOpacity: 0.0,
              elevation: 0.0,
              leading: IconButton(
                onPressed: () {},
                //onPressed: () => signInController.showExitWarning(),
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
              // Center(
              //     child: Image.asset(
              //   Images.logo,
              //   height: MediaQuery.of(context).size.height * .081,
              //   width: MediaQuery.of(context).size.width * .481,
              // )),
              // Style.distan_size10,
              // Center(
              //     child: Image.asset(
              //   Images.man,
              //   height: MediaQuery.of(context).size.height * .070,
              //   width: MediaQuery.of(context).size.width * .40,
              // )),
              // const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_LARGE),
              const Center(
                  child: CustomLabelText(
                text: 'Welcome',
                style: Style.robotoHeader30,
              )),
              const Center(
                  child: CustomLabelText(
                text: 'Sign in to continue',
                style: Style.text_style_primary,
              )),
              Style.distan_size20,
               CustomLabelField(
                text: "Email Number",
                style: Style.robotoRegular,
              ),
              CustomTextField(
                baseColor: ColorsCode.text_field_base_colors,
                borderColor: ColorsCode.text_border_color,
                errorColor: ColorsCode.text_field_error_colors,
                controller: emailController,
                hint: "@gmail.com",
                inputType: TextInputType.emailAddress,
                icon: const Icon(
                  Icons.mail,
                  color: ColorsCode.icon_primary_colors,
                ),
                eyesIcon: false,
                onChangedFunction: null,
                // validator: Validator.validateEmail,
              ),
              // Style.distan_size10,
               CustomLabelField(
                text: "Password",
                style: Style.robotoRegular,
              ),
              CustomTextField(
                baseColor: ColorsCode.text_field_base_colors,
                borderColor: ColorsCode.text_border_color,
                errorColor: ColorsCode.text_field_error_colors,
                controller:passwordController,
                hint: "........",
                inputType: TextInputType.text,

                icon: const Icon(
                  Icons.lock,
                  color: ColorsCode.icon_primary_colors,
                ),
                eyesIcon: true,
                // validator: Validator.validateEmail,
                onChangedFunction: null,
              ),
              Style.distan_size2,
              CustomTextButton(
                text: "Forget Password?",
                style: Style.text_style_primary,
                padding: const EdgeInsets.only(right: 15),
                // ignore: avoid_print
                onPressedController: () {
                },
                alignment: Alignment.centerRight,
              ),
              CustomSubmitButton(
                  text: "Sign In",
                  style: Style.submit_button_style,
                  padding: const EdgeInsets.only(top: 10, bottom: 10),
                  color: ColorsCode.submit_button_primary_color,
                  onPressed: () {
                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=>BottomNavController()));
                    var email = emailController.text.trim().toString();
                    var password = passwordController.text.trim().toString();
                    if (email.isEmpty) {
                      setState(() {
                        Fluttertoast.showToast(
                          msg: "Email con not be empty !",
                        );
                      });
                    } else if (password.isEmpty) {
                      Fluttertoast.showToast(msg: "Password con not be empty !");
                    }else{
                      try {
                        FirebaseAuth.instance
                            .signInWithEmailAndPassword(email: email, password: password)
                            .then((value) {
                          Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>BottomNavController()), (route) => false);
                        }).onError((error, stackTrace) {
                          Fluttertoast.showToast(msg: error.toString());

                        });
                      } catch (e) {
                        Fluttertoast.showToast(msg: e.toString());

                      }
                    }


                  },
                  booldata: true,
                  leftpad: 56,
                  rightpad: 56,
                  borderCircular: 20),
              Style.distan_size20,
              Center(
                  child: CustomtWinkwellButton(
                      text1: "Don't have an account ?  ",
                      text2: "Sign Up",
                      style1: Style.robotoRegular,
                      style2: Style.text_style,
                      onPressed: () {
                        Navigator.push(context, MaterialPageRoute(builder: (context)=>RegistrationPage()));

                      })),
            ],
          ),
        ),
      ),
    );
  }
}
