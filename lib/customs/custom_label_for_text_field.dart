import 'package:flutter/material.dart';

import '../utils/responsive/responsive_helper.dart';

class CustomLabelField extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String? text;
  // ignore: prefer_typing_uninitialized_variables
  final style;

  const CustomLabelField({
    super.key,
    this.text,
    required this.style,
  });
  @override
  // ignore: library_private_types_in_public_api
  _CustomLabelFieldState createState() => _CustomLabelFieldState();
}

class _CustomLabelFieldState extends State<CustomLabelField> {
  @override
  Widget build(BuildContext context) {
    // ignore: prefer_const_constructors
    return Padding(
      padding: EdgeInsets.only(left: 26),
      child: Text(
        widget.text.toString(),
        style: widget.style, //596970
      ),
    );
  }
}
