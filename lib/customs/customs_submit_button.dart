import 'package:flutter/material.dart';

class CustomSubmitButton extends StatefulWidget {
  final String text;
  final Color? color;
  // ignore: prefer_typing_uninitialized_variables
  final onPressed;
  // ignore: prefer_typing_uninitialized_variables
  final style;
  // ignore: prefer_typing_uninitialized_variables
  final padding;
  // ignore: prefer_typing_uninitialized_variables
  final double leftpad;
  // ignore: prefer_typing_uninitialized_variables
  final double rightpad;
  // ignore: prefer_typing_uninitialized_variables
  final double borderCircular;
  final bool booldata;

  const CustomSubmitButton({
    super.key,
    required this.text,
    this.color,
    this.style,
    this.padding,
    this.onPressed,
    required this.booldata,
    required this.leftpad,
    required this.rightpad,
    required this.borderCircular,
  });

  @override
  // ignore: library_private_types_in_public_api
  _CustomSubmitButtonState createState() => _CustomSubmitButtonState();
}

class _CustomSubmitButtonState extends State<CustomSubmitButton> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: widget.leftpad, right: widget.rightpad),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          foregroundColor: Colors.red,
          backgroundColor: widget.color,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(widget.borderCircular),
          ),
        ),
        onPressed: () => widget.onPressed(),
        child: Padding(
          padding: widget.padding,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                widget.text.toString(),
                style: widget.style,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
