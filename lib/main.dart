import 'package:expence_tracker/service/user_service.dart';
import 'package:expence_tracker/widget/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPreferences.getInstance();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: UserService.checkUswerName(),

      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(child: CircularProgressIndicator());
        } else {
          bool hasUserName = snapshot.data ?? false;
          // Replace the following with your actual navigation logic
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(fontFamily: "inter"),
            home: Wrapper(showMainScreen: hasUserName),
          ); // or any other widget you want to show
        }
      },
    );
  }
}
