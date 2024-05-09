import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_navigation/get_navigation.dart';
import 'package:http/http.dart' as http;
import 'package:my_expense/views/configs/constants.dart';
import 'package:my_expense/views/registration.dart';
import 'package:my_expense/views/constants/customtext.dart';
import 'package:my_expense/views/constants/customtextField.dart';

class Login extends StatelessWidget {
  const Login({Key? key});

  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        backgroundColor: primaryColor,
        foregroundColor: appbartextColor,
        automaticallyImplyLeading: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('lib/assets/images/bk2.PNG'),
              fit: BoxFit.cover,
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.fromLTRB(50, 30, 50, 30),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    //Image.asset(
                    //"assets/images/money.png",
                    //height: 100,
                    //fit: BoxFit.cover
                    // ),
                  ],
                ),
                const SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const CustomText(
                      label: "Welcome back!!",
                      labelColor: appbartextColor,
                      fontSize: 40,
                    ),
                  ],
                ),
                const SizedBox(
                  height: 30,
                ),
                const CustomText(
                  label: "Username",
                ),
                CustomTextField(
                  controller: userNameController,
                  icon: Icons.person,
                  hint: "Username",
                ),
                const CustomText(
                  label: "Password",
                ),
                CustomTextField(
                  controller: passwordController,
                  icon: Icons.lock,
                  hideText: true,
                  isPassword: true,
                  hint: "Password",
                ),
                const SizedBox(
                  height: 30,
                ),
                MaterialButton(
                  onPressed: () {
                    remoteLogin(userNameController.text.trim(), passwordController.text.trim());
                  },
                  child: CustomText(
                    label: "Login",
                    labelColor: appbartextColor,
                  ),
                  color: primaryColor,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    const CustomText(label: "No account yet?"),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      child: const CustomText(
                        label: "Register here",
                        labelColor: primaryColor,
                      ),
                      onTap: () {
                        // Navigate to the register page
                        Navigator.push(
                          context,
                          MaterialPageRoute(builder: (context) => Register()),
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> remoteLogin(String username, String password) async {
    final response = await http.get(Uri.parse("https://madedechadwick.com/finance/login.php?username=${username}&password=${password}"));
    
    if (response.statusCode == 200) {
      var serverResponse = json.decode(response.body);
      int loginStatus = serverResponse['success'];
      
      if (loginStatus == 1) {
        // Navigate to the dashboard
        print('login successful');
        Get.toNamed("/home");
      } else {
        print('login failed');
      }
    } else {
      print("Server error ${response.statusCode}");
    }
  }
}
