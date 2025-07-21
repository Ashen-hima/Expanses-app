import 'dart:convert';

import 'package:expence_tracker/models/expense_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ExpenceService {
  List<Expense> expensesList = [];
  //define the key for storing expenses in shared preferences

  static const String _expenseKey = "expenses";

  //save the expense to shared perferense
  Future<void> saveExpenses(Expense expense, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? existingExpenses = prefs.getStringList(_expenseKey);

      // convert the existing expenses to a list of expense object
      List<Expense> existingExpenseObjexts = [];

      if (existingExpenses != null) {
        existingExpenseObjexts =
            existingExpenses
                .map((e) => Expense.fromJSON(json.decode(e)))
                .toList();
      }

      //add the new expence to the list
      existingExpenseObjexts.add(expense);

      //convert the list of the Expense objects backto a list of Strings
      List<String> upadateExpense =
          existingExpenseObjexts.map((e) => json.encode(e.toJSON())).toList();

      // save the updated list expenses to shared preferences
      await prefs.setStringList(_expenseKey, upadateExpense);

      //show messages
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Expence added succesefully!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error on Adding Expence!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  // load the expenses from shared preferences
  Future<List<Expense>> loadExpenses() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? existingExpenses = pref.getStringList(_expenseKey);

    // convert the existing expemse tp list of expence objects
    List<Expense> loadExpenses = [];
    if (existingExpenses != null) {
      loadExpenses =
          existingExpenses
              .map((e) => Expense.fromJSON(json.decode(e)))
              .toList();
    }
    return loadExpenses;
  }
}
