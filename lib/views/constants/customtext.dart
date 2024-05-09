import 'package:flutter/material.dart';
import 'package:my_expense/views/configs/constants.dart';


class CustomText extends StatelessWidget {
  
  final String label;
  final Color labelColor;
  final double fontSize;
  final FontWeight fontWeight;
  const CustomText(
      {super.key,
      required this.label,
      this.labelColor = appbartextColor,
      this.fontSize = 16,
      this.fontWeight = FontWeight.normal});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: TextStyle(
          color: labelColor, fontSize: fontSize, fontWeight: fontWeight),
    );
  }
}
