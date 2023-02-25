import 'package:flutter/material.dart';
import '../utils/colors_code.dart';
import '../utils/styles.dart';

class CustomTextField extends StatefulWidget {
  final String? hint;
  final TextEditingController? controller;
  final Color? baseColor;
  final Color? borderColor;
  final Color? errorColor;
  final TextInputType? inputType;
  final Icon? icon;
  final bool? eyesIcon;
  // ignore: prefer_typing_uninitialized_variables
  final onChangedFunction;
  // final Function? validator;
  final Function? onChanged;

  const CustomTextField({
    super.key,
    this.hint,
    this.controller,
    this.onChanged,
    this.baseColor,
    this.borderColor,
    this.errorColor,
    this.inputType,
    this.eyesIcon,
    this.onChangedFunction,
    this.icon,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late Color currentColor;
  bool _passwordVisible = false;

  @override
  void initState() {
    super.initState();
    currentColor = ColorsCode.text_border_color;
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: 16, right: 16, bottom: 2),
        child: Center(
          child: SizedBox(
            height:  MediaQuery.of(context).size.height * .08,

            width: MediaQuery.of(context).size.width * .9,
            child: Card(
              elevation: 0.0,
              color: Colors.white,
              shape: RoundedRectangleBorder(
                side: BorderSide(color: currentColor, width: 2.0),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(4.0),
                child: Center(
                  child: TextField(
                      obscureText:
                          widget.eyesIcon == true ? !_passwordVisible : false,
                      onChanged: (valuData) {
                        widget.onChangedFunction(valuData);
                        // print(valuData);
                        // widget.onChanged!(valuData);
                        // setState(() {
                        //   if (text.isEmpty) {
                        //     currentColor = widget.errorColor!;
                        //   } else {
                        //     currentColor = widget.baseColor!;
                        //   }
                        // });
                      },
                      style: Style.text_filed_style,
                      keyboardType: widget.inputType,
                      controller: widget.controller,
                      decoration: InputDecoration(
                          hintStyle: Style.text_hind_style,
                          border: InputBorder.none,
                          hintText: widget.hint,
                          prefixIcon: widget.icon,
                          suffixIcon: widget.eyesIcon == true
                              ? IconButton(
                                  icon: Icon(
                                      _passwordVisible
                                          ? Icons.remove_red_eye_outlined
                                          : Icons.visibility_off,
                                      color: ColorsCode
                                          .icon_primary_colors //Theme.of(context).primaryColorDark,
                                      ),
                                  onPressed: () {
                                    setState(() {
                                      _passwordVisible = !_passwordVisible;
                                    });
                                  },
                                )
                              : null)),
                ),
              ),
            ),
          ),
        ));
  }
}
