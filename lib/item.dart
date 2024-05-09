import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:my_expense/expense_model.dart';
import 'package:my_expense/views/configs/constants.dart';


class Item extends StatelessWidget {
  final ExpenseModel expense;
  final VoidCallback onDelete;

  const Item({
    Key? key,
    required this.expense,
    required this.onDelete,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        top: 9,
        bottom: 7,
        left: 12,
        right: 11,
      ),
      child: Container(
        padding: const EdgeInsets.all(14),
        decoration: const BoxDecoration(
          boxShadow: [
            BoxShadow(blurRadius: 0.4),
          ],
          borderRadius: BorderRadius.all(
            Radius.circular(11.5),
          ),
          color: Colors.white,
        ),
        child: Row(
          children: [
            SizedBox(
              height: 35,
              width: 35,
              //child: expense.isIncome
                  //? Image.asset("images/income.png")
                  //: Image.asset("images/expense.png"),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  expense.item,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    
                  ),
                ),
                const SizedBox(height: 3),
                Text(
                  DateFormat.yMMMMd().format(expense.date),
                  style: const TextStyle(
                    fontSize: 14.7,
                    color: greytextColor,
                  ),
                ),
              ],
            ),
            const Spacer(),
            Text(
              "${expense.amount}",
              style: TextStyle(
                fontSize: 15,
                color: expense.isIncome ? greenColor : redColor,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}