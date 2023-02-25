import 'package:flutter/material.dart';

class CustomtWinkwellButton extends StatefulWidget {
  // ignore: prefer_typing_uninitialized_variables
  final String? text1;
  final String? text2;
  // ignore: prefer_typing_uninitialized_variables
  final style1;
  // ignore: prefer_typing_uninitialized_variables
  final style2;
  // ignore: prefer_typing_uninitialized_variables

  // ignore: prefer_typing_uninitialized_variables
  final onPressed;

  // final TextEditingController? controller;
  // final Color? baseColor;
  // final Color? borderColor;
  // final Color? errorColor;
  // final TextInputType? inputType;
  // final Icon? icon;
  // final bool? eyesIcon;

  // final Function? validator;
  // final Function? onChanged;

  const CustomtWinkwellButton({
    super.key,
    // super.key,
    this.text1,
    this.text2,
    this.style1,
    this.style2,
    this.onPressed,
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
  _CustomtWinkwellButtonState createState() => _CustomtWinkwellButtonState();
}

class _CustomtWinkwellButtonState extends State<CustomtWinkwellButton> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => widget.onPressed(),
      // Navigator.of(context)
      //     .popAndPushNamed(RouteManeger.phnver_page);

      child: RichText(
        text: TextSpan(
          children: [
            TextSpan(
              text: widget.text1,
              style: widget.style1,
            ),
            TextSpan(text: widget.text2, style: widget.style2),
          ],
        ),
      ),
    );
  }
}
