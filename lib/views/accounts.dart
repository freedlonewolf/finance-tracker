// ignore_for_file: prefer_const_constructors, file_names

import 'package:flutter/material.dart';
import 'package:my_expense/views/configs/constants.dart';
import 'package:my_expense/views/constants/customtext.dart';
import 'package:my_expense/views/login.dart';

class AccountPage extends StatefulWidget {
  const AccountPage({Key? key}) : super(key: key);

  @override
  State<AccountPage> createState() => _AccountPageState();
}

class _AccountPageState extends State<AccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/bk7.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          // ignore: prefer_const_literals_to_create_immutables
          children: [
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(25),
                child: CustomText(
                  label: "My Account",
                  labelColor: appbartextColor,
                  fontSize: 18,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                child: CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('lib/assets/images/bk5.PNG'),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(0, 20, 0, 15),
                child: CustomText(
                  label: "Your Accounts",
                  labelColor: appbartextColor,
                  fontSize: 18,
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.fromLTRB(15, 25, 15, 0),
                child: Column(
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    ListTile(
                      leading: Icon(
                        Icons.person,
                        size: 22,
                        color: appbartextColor,
                      ),
                      title: CustomText(
                          label: "My Account", labelColor: appbartextColor),
                      trailing: Icon(Icons.arrow_forward_ios, color: appbartextColor,),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.payment_outlined,
                        size: 22,
                        color: appbartextColor,
                      ),
                      title: CustomText(
                          label: "My Banking Details", labelColor: appbartextColor),
                      trailing: Icon(Icons.arrow_forward_ios, color: appbartextColor,),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.loyalty,
                        size: 22,
                        color: appbartextColor,
                      ),
                      title: CustomText(
                          label: "My Subscription", labelColor: appbartextColor),
                      trailing: Icon(Icons.arrow_forward_ios,color: appbartextColor,),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.group,
                        size: 22,
                        color: appbartextColor,
                      ),
                      title: CustomText(
                          label: "Referrer Program", labelColor: appbartextColor),
                      trailing: Icon(Icons.arrow_forward_ios,color: appbartextColor,),
                    ),
                    Divider(),
                    ListTile(
                      leading: Icon(
                        Icons.question_answer,
                        size: 22,
                        color: appbartextColor,
                      ),
                      title:
                          CustomText(label: "FAQs", labelColor: appbartextColor),
                      trailing: Icon(Icons.question_mark, color: appbartextColor,),
                    ),
                    Divider(),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Padding(
                padding: EdgeInsets.all(15),
                child: ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(primaryColor)),
                  onPressed: () {
                    // Navigate to the register page
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => Login()),
                    );
                  },
                  child: CustomText(
                    label: "Log Out",
                    labelColor: appbartextColor,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}