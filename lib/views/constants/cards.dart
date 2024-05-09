import 'package:flutter/material.dart';
import 'package:my_expense/views/configs/constants.dart';
import 'package:my_expense/views/constants/customtext.dart';
import 'package:my_expense/views/constants/transaction.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({Key? key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  @override
  Widget build(BuildContext context) {
    final res_height = MediaQuery.of(context).size.height;
    final res_width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: appbartextColor,
      appBar: AppBar(
        backgroundColor: appbartextColor,
        actions: [
          Icon(
            Icons.more_vert,
            size: 15,
          )
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('lib/assets/images/bk9.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          padding: EdgeInsets.only(left: 10, right: 10),
          children: [
            SizedBox(
              height: res_height * 0.025,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Your Cards",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: appbartextColor),

                    ),
                    Text(
                      "You have 3 active cards",
                      style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: appbartextColor),

                    ),
                  ],
                ),
                MaterialButton(
                  onPressed: () {},
                  color: primaryColor,
                  textColor: appbartextColor,
                  child: Icon(
                    Icons.add,
                    size: 30,
                  ),
                  shape: CircleBorder(),
                  padding: EdgeInsets.all(8.0),
                  minWidth: 0,
                )
              ],
            ),
            SizedBox(
              height: res_height * 0.025,
            ),
            Container(
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      'lib/assets/images/chip1.PNG',
                      //width: 50,
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    CustomText(
                      label: "455 788 788",
                      labelColor: appbartextColor,
                    ),
                    CustomText(
                      label: "Chadwick",
                      labelColor: appbartextColor,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            CustomText(
                              label: "Expiry date",
                              labelColor: appbartextColor,
                            ),
                            CustomText(
                              label: "20/10/2015",
                              labelColor: appbartextColor,
                            ),
                          ],
                        ),
                        Image.asset(
                          'lib/assets/images/mcard.PNG',
                          //width: 50,
                        )
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(
              height: res_height * 0.025,
            ),
            Text(
              "Recent Transactions",
              style: Theme.of(context).textTheme.headlineMedium?.copyWith(color: appbartextColor),

            ),
            SizedBox(
              height: res_height * 0.025,
            ),
            TransactionWidget(
                amount: "+\$2,010",
                date: "June 14",
                image: 'lib/assets/images/burger1.PNG',
                title: "KFC"),
            SizedBox(
              height: res_height * 0.015,
            ),
            TransactionWidget(
                amount: "+\$12,010",
                date: "June 28",
                image: 'lib/assets/images/paypal1.PNG',
                title: "Paypal"),
            SizedBox(
              height: res_height * 0.015,
            ),
            TransactionWidget(
                amount: "+\$232,010",
                date: "Aug 28",
                image: 'lib/assets/images/maintain.PNG',
                title: "Car Repair")
          ],
        ),
      ),
    );
  }
}
