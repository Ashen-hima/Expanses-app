import 'package:expence_tracker/Screen/on_bording_screen.dart';
import 'package:expence_tracker/Screen/onbording/main_screen.dart';
import 'package:flutter/material.dart';

class Wrapper extends StatefulWidget {
  final bool showMainScreen;
  const Wrapper({super.key, required this.showMainScreen});

  @override
  State<Wrapper> createState() => _WrapperState();
}

class _WrapperState extends State<Wrapper> {
  @override
  Widget build(BuildContext context) {
    return widget.showMainScreen
        ? const MainScreen() // Replace with your main screen widget
        : const OnBordingScreen(); // Replace with your onboarding screen widget
  }
}
