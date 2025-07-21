import 'dart:convert';

import 'package:expence_tracker/models/income_model.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IncomeService {
  List<Income> incomeList = [];
  //define the key for storing income in shared preferences

  static String _incomeKey = "Income";

  //save the income to shared perferense

  Future<void> saveIncome(Income income, BuildContext context) async {
    try {
      SharedPreferences prefs = await SharedPreferences.getInstance();
      List<String>? existingIncome = prefs.getStringList(_incomeKey);

      // convert the existing Income to a list of expense object
      List<Income> existingIncomeObject = [];

      if (existingIncome != null) {
        existingIncomeObject =
            existingIncome.map((e) => Income.fromJSON(json.decode(e))).toList();
      }

      //add the new income to the list
      existingIncomeObject.add(income);

      //convert the list of the Income objects backto a list of Strings
      List<String> upadateIncome =
          existingIncomeObject.map((e) => json.encode(e.toJSON())).toList();

      // save the updated list income to shared preferences
      await prefs.setStringList(_incomeKey, upadateIncome);

      //show messages
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Income added succesefully!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    } catch (error) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text("Error on Adding Income!"),
            duration: Duration(seconds: 2),
          ),
        );
      }
    }
  }

  // load the income from shared preferences
  Future<List<Income>> loadIncome() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    List<String>? existingIncome = pref.getStringList(_incomeKey);

    // convert the existing income tp list of income objects
    List<Income> loadIncome = [];
    if (existingIncome != null) {
      loadIncome =
          existingIncome.map((e) => Income.fromJSON(json.decode(e))).toList();
    }
    return loadIncome;
  }
}
