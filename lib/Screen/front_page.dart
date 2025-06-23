import 'package:expence_tracker/constant/colors.dart';
import 'package:flutter/material.dart';

class FrontPage extends StatelessWidget {
  const FrontPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(
          "assets/Images/biofuel_7709178.png",
          width: 100,
          fit: BoxFit.cover,
        ),

        SizedBox(height: 20),
        Center(
          child: Text(
            "Expenz",
            style: TextStyle(
              fontSize: 40,
              color: kMainColor,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ],
    );
  }
}
