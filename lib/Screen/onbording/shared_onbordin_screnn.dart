import 'package:expence_tracker/constant/colors.dart';
import 'package:expence_tracker/constant/constant.dart';
import 'package:flutter/material.dart';

class SharedOnbordinScrenn extends StatelessWidget {
  final String tile;
  final String image;
  final String des;
  const SharedOnbordinScrenn({
    super.key,
    required this.tile,
    required this.image,
    required this.des,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kdefaultpadding),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Image.asset(image, width: 300, fit: BoxFit.cover),
          SizedBox(height: 20),
          Text(
            tile,
            style: TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
          ),
          SizedBox(height: 20),

          Text(
            des,
            style: TextStyle(
              fontSize: 16,
              color: kGreen,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
