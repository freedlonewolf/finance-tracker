

import 'package:get/get.dart';
import 'package:my_expense/home_page.dart';
import 'package:my_expense/views/accounts.dart';
import 'package:my_expense/views/charts.dart';
import 'package:my_expense/views/home.dart';
import 'package:my_expense/views/login.dart';
import 'package:my_expense/views/notifications.dart';

class Routes{
  static var routes =[
    GetPage(name: "/", page: ()=>Login()),
    GetPage(name: "/home", page: ()=>Home()),
    GetPage(name: "/home_page", page: ()=>HomePage()),
    //GetPage(name: "/mycharts", page: ()=>MyCharts()),
    GetPage(name: "/mycharts", page: ()=>AccountPage()),
    GetPage(name: "/mycharts", page: ()=>NotificationPage()),

  ];
}