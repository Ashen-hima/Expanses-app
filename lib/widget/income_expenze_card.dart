import 'package:flutter/material.dart';

class IncomeExpenzeCard extends StatefulWidget {
  final String title;
  final double amount;
  final String imageURL;
  final Color bgColor;
  const IncomeExpenzeCard({
    super.key,
    required this.title,
    required this.amount,
    required this.imageURL,
    required this.bgColor,
  });

  @override
  State<IncomeExpenzeCard> createState() => _IncomeExpenzeCardState();
}

class _IncomeExpenzeCardState extends State<IncomeExpenzeCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width * 0.45,
      height: MediaQuery.of(context).size.height * 0.12,
      decoration: BoxDecoration(
        color: widget.bgColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.15,
              width: MediaQuery.of(context).size.width * 0.15,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
              ),
              child: Center(
                child: Image.asset(widget.imageURL, height: 50, width: 50),
              ),
            ),
            SizedBox(width: 10),
            Column(
              children: [
                Text(
                  widget.title,
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: const Color.fromARGB(251, 255, 255, 255),
                  ),
                ),
                Text(
                  "\$${widget.amount.toString()}",
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: const Color.fromARGB(251, 255, 255, 255),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
