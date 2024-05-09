import 'package:flutter/material.dart';
import 'package:my_expense/views/configs/constants.dart';
import 'package:my_expense/views/constants/customtext.dart';

class CustomButton extends StatelessWidget {
  final String label;
  final Color buttonColor;
  const CustomButton({
    super.key,
    required this.label,
    this.buttonColor = primaryColor,  
  });
  //final TextEditingController userNameController;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        //print("Button clicked ${userNameController.text}");
      },
      child: CustomText(
        label: label,
        labelColor: appbartextColor,
      ),
      style: ElevatedButton.styleFrom(
        backgroundColor: buttonColor,
        elevation: 10,
        padding: const EdgeInsets.symmetric(horizontal: 50, vertical: 2),
        shape:
            ContinuousRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
