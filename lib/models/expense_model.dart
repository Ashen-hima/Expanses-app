import 'dart:ui';

enum ExpenseModel { food, transport, health, bills, subscription }

//category images
final Map<ExpenseModel, String> ExpenseCategoryImages = {
  ExpenseModel.food: "assets/images/biofuel_7709178.png",
  ExpenseModel.transport: "assets/images/biofuel_7709178.png",
  ExpenseModel.health: "assets/images/biofuel_7709178.png",
  ExpenseModel.bills: "assets/images/biofuel_7709178.png",
  ExpenseModel.subscription: "assets/images/biofuel_7709178.png",
};

//category Colors
final Map<ExpenseModel, Color> ExpenseCategoryColors = {
  ExpenseModel.food: Color(0xFF4CAF50),
  ExpenseModel.transport: Color(0xFF2196F3),
  ExpenseModel.health: Color(0xFFFF9800),
  ExpenseModel.bills: Color(0xFFF44336),
  ExpenseModel.subscription: Color.fromARGB(221, 173, 17, 229),
};

class Expense {
  final int id;
  final String title;
  final double amount;
  final ExpenseModel category;
  final DateTime date;
  final DateTime time;
  final String description;

  Expense({
    required this.id,
    required this.title,
    required this.amount,
    required this.category,
    required this.date,
    required this.time,
    required this.description,
  });

  // convert Expense to a json object
  Map<String, dynamic> toJSON() {
    return {
      'id': id,
      'title': title,
      'amount': amount,
      'category': category.name,
      'date': date.toIso8601String(),
      'time': time.toIso8601String(),
      'description': description,
    };
  }

  // convert json object to Expense
  factory Expense.fromJSON(Map<String, dynamic> json) {
    return Expense(
      id: json['id'],
      title: json['title'],
      amount: json['amount'],
      category: ExpenseModel.values[json["category"]],
      date: DateTime.parse(json['date']),
      time: DateTime.parse(json['time']),
      description: json['description'],
    );
  }
}
