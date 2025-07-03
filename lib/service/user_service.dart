import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class UserService {
  // methods to store the user data
  static Future<void> storeUserData({
    required String userName,
    required String email,
    required String password,
    required String confirmPassword,
    required BuildContext context,
  }) async {
    try {
      // check if the passwords match
      if (password != confirmPassword) {
        // Store user data
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("pasword and confirm password do not match")),
        );
        return;
      }
      //if the users password and conf password are same then store the user name
      //create a instense feom shared pref
      SharedPreferences prefs = await SharedPreferences.getInstance();
      //store the user a name and email as key value pairs
      await prefs.setString("UserName", userName);
      await prefs.setString("Email", email);

      //show the messege to the user
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("User details stored sucssesfuly")),
      );
    } catch (err) {
      err.toString();
    }
  }

  // method to get the user name is saved in shared preferences
  static Future<bool> checkUswerName() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //get the user name from shared preferences
    String? userName = prefs.getString("UserName");
    //if the user name is not null then return true
    return userName != null;
  }

  //get the user name and the email,
  static Future<Map<String, String?>> getUserData() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    //get the user name and email from shared preferences
    String? userName = prefs.getString("UserName");
    String? email = prefs.getString("Email");
    //return the user name and email as a map
    return {"userName": userName!, "email": email!};
  }
}
