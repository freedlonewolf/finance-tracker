import 'package:flutter/material.dart';
import 'package:my_expense/views/configs/constants.dart';
import 'package:my_expense/views/constants/customtext.dart';

class NotificationPage extends StatelessWidget {
  const NotificationPage({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
          child: CustomText(
            label: "Notifications",
            labelColor: appbartextColor,
            fontSize: 30,
          ),
        ),
        centerTitle: true,
        backgroundColor: primaryColor,
        elevation: 0,
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/bk8.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView.builder(
          itemCount: 2,
          itemBuilder: (context, index) {
            return ListTile(
              leading: const Icon(Icons.notifications, color:appbartextColor ,),
              title: const Text('Notification Title'),
              subtitle: const Text('Notification Description'),
              trailing: const Icon(Icons.arrow_forward, color: appbartextColor,),
              textColor: appbartextColor,
              onTap: () {},
            );
          },
        ),
      ),
    );
  }
}
