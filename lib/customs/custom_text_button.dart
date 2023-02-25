import 'package:flutter/material.dart';

class CustomTextButton extends StatefulWidget {
  final String? text;
  // ignore: prefer_typing_uninitialized_variables
  final style;
  // ignore: prefer_typing_uninitialized_variables
  final padding;
  // ignore: prefer_typing_uninitialized_variables
  final onPressedController;
  // ignore: prefer_typing_uninitialized_variables
  final alignment;

  // final TextEditingController? controller;
  // final Color? baseColor;
  // final Color? borderColor;
  // final Color? errorColor;
  // final TextInputType? inputType;
  // final Icon? icon;
  // final bool? eyesIcon;

  // final Function? validator;
  // final Function? onChanged;

  const CustomTextButton(
      {super.key,
      // super.key,
      this.text,
      this.style,
      this.padding,
      this.onPressedController,
      this.alignment
      // this.controller,
      // this.onChanged,
      // this.baseColor,
      // this.borderColor,
      // this.errorColor,
      // this.inputType,
      // this.eyesIcon,
      // this.icon,
      });

  @override
  // ignore: library_private_types_in_public_api
  _CustomTextButtonState createState() => _CustomTextButtonState();
}

class _CustomTextButtonState extends State<CustomTextButton> {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: widget.alignment,
      child: Padding(
        padding: widget.padding,
        child: TextButton(
          // ignore: avoid_print
          onPressed: () => widget.onPressedController(),
          child: Text(
            widget.text.toString(),
            style: widget.style,
          ),
        ),
      ),
    );
  }
}
