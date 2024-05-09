import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:my_expense/views/configs/constants.dart';
import 'package:my_expense/views/constants/customtext.dart';
import 'package:my_expense/views/constants/customtextField.dart';
import 'package:http/http.dart' as http;

TextEditingController firstNameController = TextEditingController();
    TextEditingController secondNameController = TextEditingController();
    TextEditingController phoneNumberController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController reEnterpasswordcontroller = TextEditingController();
class Register extends StatelessWidget {
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        title: const CustomText(
          label: "Registration Page",
          labelColor: appbartextColor,
        ),
        foregroundColor: primaryColor,
        backgroundColor: primaryColor,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/bk4.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(30, 20, 30, 20),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    // Image.asset(
                    //   "assets/images/income.png",
                    //   height: 100,
                    // ),
                  ],
                ),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomText(
                      label: "Registration Screen",
                      labelColor: appbartextColor,
                      fontSize: 30,
                    ),
                  ],
                ),
                const CustomText(label: "First Name"),
                CustomTextField(
                  controller: firstNameController,
                  hint: "Enter First Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(label: "Second Name"),
                CustomTextField(
                  controller: secondNameController,
                  hint: "Enter Second Name",
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(label: "Phone Number(username)"),
                CustomTextField(
                  controller: phoneNumberController,
                  hint: "Enter Phone Number",
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(label: "Email"),
                CustomTextField(
                  controller: emailController,
                  hint: "Enter Email",
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(label: "Password"),
                CustomTextField(
                  controller: passwordController,
                  hint: "Enter Password",
                ),
                const SizedBox(
                  height: 20,
                ),
                const CustomText(label: "Re-enter Password"),
                CustomTextField(
                  controller: reEnterpasswordcontroller,
                  hint: "Re-enter Password",
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    MaterialButton(
                  onPressed: () {
                    serverSignup();
                  },
                  child: CustomText(
                    label: "Signup",
                    labelColor: appbartextColor,
                  ),
                  color: primaryColor,
                ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CustomText(label: "Already have an account?"),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: const CustomText(
                        label: "Login here",
                      ),
                      onTap: () {
                        Get.offNamed('/'); // Navigate to the login screen
                      },
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
  Future <void> serverSignup()async{
    http.Response response;
    response = await http.post(Uri.parse("https://madedechadwick.com/finance/register.php"),
    body:{
      'first_name':firstNameController.text.trim(),
      'second_name':secondNameController.text.trim(),
      'username':phoneNumberController.text.trim(),
      'email':emailController.text.trim(),
      'password':passwordController.text.trim(),
    });
    if (response.body == "success") {
      var serverResponse = json.decode(response.body);
      int signupStatus = serverResponse['success'];
      if (signupStatus == 1) {
      Get.snackbar("Success", "Registration successful");
      Get.offAllNamed('/');
      } else {
      Get.snackbar("Error", "Registration failed");
      }
    } 
  }

  void gotoLogin() {
    Get.toNamed('/login');

  }
}
