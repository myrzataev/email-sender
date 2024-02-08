
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    required this.controller,
    required this.hintText,
    required this.labelText,
    super.key,
  });
  final String hintText;
  final String labelText;
  final TextEditingController controller;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 160,
      height: 80,
      child: TextField(
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            border: OutlineInputBorder()),
      ),
    );
  }
}
