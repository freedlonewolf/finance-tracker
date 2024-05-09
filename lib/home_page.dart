import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:my_expense/views/configs/constants.dart';
import 'package:my_expense/views/constants/customtext.dart';
import 'package:my_expense/views/constants/customtextField.dart';

class Expense {
  final String item;
  final double amount;
  final DateTime date;

  Expense({required this.item, required this.amount, required this.date});
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController itemController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  DateTime? selectedDate;
  List<Expense> expenses = [];

  void _addExpense() {
    final String item = itemController.text;
    final double amount = double.parse(amountController.text);
    final DateTime date = selectedDate ?? DateTime.now();
    
    setState(() {
      expenses.add(Expense(item: item, amount: amount, date: date));
    });

    // Clear text fields after adding expense
    itemController.clear();
    amountController.clear();
    selectedDate = null;
  }

  Future<void> _deleteExpense(int index) async {
    
    Expense expenseToDelete = expenses[index];

    
    setState(() {
      expenses.removeAt(index);
    });

    
    final response = await http.post(
      Uri.parse("https://madedechadwick.com/finance/delete.php"), 
      body: {
        'item': expenseToDelete.item,
        'amount': expenseToDelete.amount.toString(),
        'date': expenseToDelete.date.toIso8601String(),
      },
    );

    if (response.statusCode == 200) {
      print('Expense deleted successfully');
    } else {
      print('Failed to delete expense');
      // If deletion fails, add the expense back to the list
      setState(() {
        expenses.insert(index, expenseToDelete);
      });
    }
  }

  double _calculateTotalAmount() {
    double totalAmount = 0;
    for (Expense expense in expenses) {
      totalAmount += expense.amount;
    }
    return totalAmount;
  }

  int _calculateTotalItems() {
    return expenses.length;
  }


  Future<void> sendDataToDatabase(Expense expense) async {
    final response = await http.post(
      Uri.parse("http://madedechadwick.com/finance/transactions.php"),
      body: {
        'item': expense.item,
        'amount': expense.amount.toString(),
        'date': expense.date.toIso8601String(),
      },
    );

    if (response.statusCode == 200) {
      print('Expense added successfully');
    } else {
      print('Failed to add expense');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Center(
                child: CustomText(
                  label: "My Spendings",
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
            image: AssetImage('lib/assets/images/bk3.PNG'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomTextField(
                  controller: itemController,
                  hint: "Item",
                  textStyle: TextStyle(color: appbartextColor)
                ),
              CustomTextField(
                  controller: amountController,
                  hint: "Amount",
                  textStyle: TextStyle(color: appbartextColor)
                ),
              TextButton(
                onPressed: () async {
                  final DateTime? picked = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime(2100),
                  );

                  if (picked != null && picked != selectedDate) {
                    setState(() {
                      selectedDate = picked;
                    });
                  }
                },
                child: Text(selectedDate != null
                    ? 'Selected Date: ${selectedDate!.toString().substring(0, 10)}'
                    : 'Select Date',style: TextStyle(color: appbartextColor)),
                    style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  final String item = itemController.text;
                  final double amount = double.parse(amountController.text);
                  final DateTime date = selectedDate ?? DateTime.now();

                  // Create expense object
                  Expense expense = Expense(item: item, amount: amount, date: date);

                  // Add expense to the list
                  setState(() {
                    expenses.add(expense);
                  });

                  // Send data to the database
                  sendDataToDatabase(expense);
                  
                  // Clear text fields after adding expense
                  itemController.clear();
                  amountController.clear();
                  selectedDate = null;
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                    onPressed: _addExpense,
                    child: Text('Add Expense',style: TextStyle(color: primaryColor),),
                    style: ElevatedButton.styleFrom(backgroundColor: appbartextColor),)

                  ],
                ),
                style: ElevatedButton.styleFrom(backgroundColor: primaryColor),
              ),
              SizedBox(height: 20),
              Text('Total Amount: ${_calculateTotalAmount()}', style: TextStyle(color: appbartextColor)),
              Text('Total Items: ${_calculateTotalItems()}', style: TextStyle(color: appbartextColor)),

              SizedBox(height: 20),
              Expanded(
                child: SingleChildScrollView(
                  child: Container(
                    constraints: BoxConstraints(maxHeight: MediaQuery.of(context).size.height - 200),
                    child: Column(
                      children: expenses.asMap().entries.map((entry) {
                        final index = entry.key;
                        final expense = entry.value;
                        return ListTile(
                          title: Text(expense.item,style: TextStyle(color: appbartextColor)),
                          subtitle: Text('Amount: ${expense.amount}, Date: ${expense.date.toString().substring(0, 10)}', style: TextStyle(color: appbartextColor)),
                          trailing: IconButton(
                            icon: Icon(Icons.delete),
                            onPressed: () => _deleteExpense(index),
                          ),
                        );
                      }).toList(),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


