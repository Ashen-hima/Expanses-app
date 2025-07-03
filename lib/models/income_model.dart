import 'package:flutter/rendering.dart';

//income category
enum IncomeModel { salary, passiveIncome, sales, freelancec }

//category images
final Map<IncomeModel, String> IncomeCategoryImages = {
  IncomeModel.freelancec: "assets/images/biofuel_7709178.png",
  IncomeModel.passiveIncome: "assets/images/biofuel_7709178.png",
  IncomeModel.sales: "assets/images/biofuel_7709178.png",
  IncomeModel.salary: "assets/images/biofuel_7709178.png",
};

//category Colors
final Map<IncomeModel, Color> IncomeCategoryColors = {
  IncomeModel.freelancec: Color(0xFF4CAF50),
  IncomeModel.passiveIncome: Color(0xFF2196F3),
  IncomeModel.sales: Color(0xFFFF9800),
  IncomeModel.salary: Color(0xFFF44336),
};

class Income {
  final int id;
  final String title;
  final double amount;
  final IncomeModel category;
  final DateTime date;
  final DateTime time;
  final String description;

  Income({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });
}
