import 'package:flutter/material.dart';
import 'package:my_expense/views/configs/constants.dart';

class CustomTextField extends StatelessWidget {
  final IconData? icon;
  final bool isPassword;
  final bool hideText;
  final String? hint;
  final TextStyle? textStyle;
  final TextInputType? keyboardType;
  final Color textColor;
  const CustomTextField({
    super.key,
    required this.controller,
    this.icon,
    this.hideText = false,
    this.isPassword = false,
    this.hint,
    this.textStyle,
    this.keyboardType,
    this.textColor = appbartextColor,
    
    
  });
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      style: textStyle, 
      keyboardType: keyboardType,
      cursorColor: textColor,
      
      decoration: InputDecoration(
          hintText: hint,
          hintStyle: TextStyle(color: appbartextColor),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)),borderSide: BorderSide(color: appbartextColor),),
          prefixIcon: Icon(icon),
          suffixIcon: isPassword
              ? Icon(Icons.visibility)
              : Container(
                  height: 10,
                  width: 10,
                )),
      obscureText: hideText,
    );
  }
}
