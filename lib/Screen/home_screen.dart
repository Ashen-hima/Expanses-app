import 'package:expence_tracker/constant/colors.dart';
import 'package:expence_tracker/service/user_service.dart';
import 'package:expence_tracker/widget/income_expenze_card.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  // for store the user name
  String userName = "";
  @override
  void initState() {
    // get the user name from shared preferences
    UserService.getUserData().then((value) {
      if (value["userName"] != null) {
        setState(() {
          // set the user name to the userName variable
          userName = value["userName"]!;
        });

        super.initState();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        // main column
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.6,
              decoration: BoxDecoration(
                color: const Color.fromARGB(82, 126, 61, 255),
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: kMainColor,
                          border: Border.all(color: kMainColor),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.asset(
                            "assets/images/biofuel_7709178.png",
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      SizedBox(width: 20),
                      Text(
                        "Welcome, $userName",
                        style: TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(width: 20),
                      IconButton(
                        onPressed: () {},
                        icon: Icon(
                          Icons.notifications,
                          color: kMainColor,
                          size: 30,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IncomeExpenzeCard(
                          title: "Income",
                          amount: 1000,
                          imageURL: "assets/images/biofuel_7709178.png",
                          bgColor: Colors.green,
                        ),
                        IncomeExpenzeCard(
                          title: "Income",
                          amount: 1000,
                          imageURL: "assets/images/biofuel_7709178.png",
                          bgColor: const Color.fromARGB(255, 232, 49, 3),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
