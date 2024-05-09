import 'package:flutter/material.dart';
import 'package:my_expense/views/configs/constants.dart';
import 'package:my_expense/views/constants/customtext.dart';

class TransactionWidget extends StatelessWidget {
  final title;
  final image;
  final date;
  final amount;
  const TransactionWidget(
      {super.key,
      required this.amount,
      required this.date,
      required this.image,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: primaryColor,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListTile(
          leading: Image.asset(
            image,
            color: appbartextColor,
            width: 100,
          ),
          title: CustomText(
                      label:title,
                      labelColor: appbartextColor,),
          subtitle: CustomText(
                      label:date,
                      labelColor: appbartextColor,),
          trailing: 
          CustomText(
                      label:amount,
                      labelColor: appbartextColor,),
        ),
      ),
    );
  }
}