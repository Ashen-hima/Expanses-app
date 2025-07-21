import 'package:expence_tracker/Screen/add_new_screen.dart';
import 'package:expence_tracker/Screen/budget_screen.dart';
import 'package:expence_tracker/Screen/home_screen.dart';
import 'package:expence_tracker/Screen/profile_screen.dart';
import 'package:expence_tracker/Screen/transactions_screen.dart';
import 'package:expence_tracker/constant/colors.dart';
import 'package:expence_tracker/models/expense_model.dart';
import 'package:expence_tracker/models/income_model.dart';
import 'package:expence_tracker/service/expence_service.dart';
import 'package:expence_tracker/service/income_service.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //current page index
  int _curruntPageIndex = 0;

  List<Expense> expenseList = [];
  List<Income> incomeList = [];

  // function to add income
  void fetchallIncome() async {
    List<Income> loadedIncome = await IncomeService().loadIncome();
    setState(() {
      incomeList = loadedIncome;
      print(incomeList.length);
    });
  }

  void addNewIncome(Income newIncome) {
    IncomeService().saveIncome(newIncome, context);
    setState(() {
      incomeList.add(newIncome);
    });
  }

  // function to add expense
  void fetchallExpenses() async {
    List<Expense> loadedExpenses = await ExpenceService().loadExpenses();
    setState(() {
      expenseList = loadedExpenses;
      print(expenseList.length);
    });
  }

  // function to add expense
  void addNewExpense(Expense newExpense) {
    ExpenceService().saveExpenses(newExpense, context);
    setState(() {
      expenseList.add(newExpense);
    });
  }

  @override
  void initState() {
    super.initState();
    setState(() {
      fetchallExpenses();
      fetchallIncome();
    });
  }

  @override
  Widget build(BuildContext context) {
    // screen list

    final List<Widget> pages = [
      AddNewScreen(addExpense: addNewExpense, addIncome: addNewIncome),
      HomeScreen(),
      TransactionsScreen(),
      BudgetScreen(),
      ProfileScreen(),
    ];

    return Scaffold(
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: kWhite,
        selectedItemColor: kMainColor,
        unselectedItemColor: kGrey,
        currentIndex: _curruntPageIndex,
        onTap: (index) {
          setState(() {
            _curruntPageIndex = index;
            print(_curruntPageIndex);
          });
        },
        selectedLabelStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w600,
        ),

        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(
            icon: Icon(Icons.list_rounded),
            label: "Transactions",
          ),
          BottomNavigationBarItem(
            icon: Container(
              padding: EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kMainColor,
                shape: BoxShape.circle,
              ),
              child: Icon(Icons.add, color: kWhite, size: 30),
            ),
            label: "",
          ),
          BottomNavigationBarItem(icon: Icon(Icons.rocket), label: "Budget"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "Profile"),
        ],
      ),
      body: pages[_curruntPageIndex],
    );
  }
}
