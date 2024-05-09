import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:my_expense/home_page.dart';
import 'package:my_expense/views/accounts.dart';
import 'package:my_expense/views/charts.dart';
import 'package:my_expense/views/configs/constants.dart';
import 'package:my_expense/views/constants/cards.dart';
import 'package:my_expense/views/constants/controllers/homescreencontroller.dart';
import 'package:my_expense/views/notifications.dart';
HomeController homeController = Get.put(HomeController());
var Screens = [
  //Login(),
  HomePage(),
  MyCharts(),
  CardScreen(),
  NotificationPage(),
  AccountPage(),
  
  
  
];

class Home extends StatelessWidget {
  const Home({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: AnimatedBottomNavigationBar(
        
        icons: const [
          //Icons.home,
          Icons.money,
          Icons.graphic_eq,
          Icons.card_membership,
          Icons.notification_add,
          Icons.manage_accounts

        ],
        activeIndex: homeController.selectedPage.value,
        gapLocation: GapLocation.end,
        onTap: (index) {
          homeController.updateSelectedPage(index);
        },
        
        backgroundColor: primaryColor,
        activeColor: appbartextColor,
        inactiveColor: appbartextColor, 
        
      ),
      body: Obx(() => Center(child: Screens[homeController.selectedPage.value])),

    );
    
  }
}