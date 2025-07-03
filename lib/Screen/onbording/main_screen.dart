import 'package:expence_tracker/Screen/add_new_screen.dart';
import 'package:expence_tracker/Screen/budget_screen.dart';
import 'package:expence_tracker/Screen/home_screen.dart';
import 'package:expence_tracker/Screen/profile_screen.dart';
import 'package:expence_tracker/Screen/transactions_screen.dart';
import 'package:expence_tracker/constant/colors.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  //current page index
  int _curruntPageIndex = 0;
  @override
  Widget build(BuildContext context) {
    // screen list

    final List<Widget> pages = [
      AddNewScreen(),
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
