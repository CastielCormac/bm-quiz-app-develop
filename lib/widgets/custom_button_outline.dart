import 'package:bm_quiz_app/static/static_values.dart';
import 'package:flutter/material.dart';

class CustomButtonOutline extends StatefulWidget {
  const CustomButtonOutline({
    Key? key,
    required this.onTap,
    required this.title,
  }) : super(key: key);

  final Function()? onTap;
  final String title;

  @override
  State<CustomButtonOutline> createState() => _CustomButtonOutlineState();
}

class _CustomButtonOutlineState extends State<CustomButtonOutline> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        decoration: BoxDecoration(
          border: Border.all(color: kPrimaryColor),
          borderRadius: BorderRadius.circular(7.0),
        ),
        alignment: Alignment.center,
        width: MediaQuery.of(context).size.width - 48.0,
        child: Text(
          widget.title,
          style: const TextStyle(
            color: kPrimaryColor,
            fontSize: 18.0,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
