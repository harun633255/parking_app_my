import 'package:flutter/material.dart';

class CustomLabelText extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final text;
  // ignore: prefer_typing_uninitialized_variables
  final style;

  const CustomLabelText({
    super.key,
    required this.text,
    required this.style,
  });
  @override
  // ignore: library_private_types_in_public_api
  _CustomLabelTextState createState() => _CustomLabelTextState();
}

class _CustomLabelTextState extends State<CustomLabelText> {
  @override
  Widget build(BuildContext context) {
    return Text(
      widget.text.toString(),
      style: widget.style,
    );
  }
}
