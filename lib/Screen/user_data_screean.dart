import 'package:expence_tracker/Screen/onbording/main_screen.dart';
import 'package:expence_tracker/constant/colors.dart';
import 'package:expence_tracker/constant/constant.dart';
import 'package:expence_tracker/service/user_service.dart';
import 'package:expence_tracker/widget/custom_buttom.dart';
import 'package:flutter/material.dart';

class UserDataScreean extends StatefulWidget {
  const UserDataScreean({super.key});

  @override
  State<UserDataScreean> createState() => _UserDataScreeanState();
}

class _UserDataScreeanState extends State<UserDataScreean> {
  //checks box
  bool _rememberMe = false;

  //form key for the form validations
  final _foreKey = GlobalKey<FormState>();

  // controller for the text from feilds
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _paswordController = TextEditingController();
  final TextEditingController _confirmPasworddController =
      TextEditingController();

  @override
  void dispose() {
    _userNameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(kdefaultpadding),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Enter Your \nPersonal Details",
                style: TextStyle(fontWeight: FontWeight.w500, fontSize: 25),
              ),
              SizedBox(height: 30),
              Form(
                key: _foreKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //name
                    TextFormField(
                      controller: _userNameController,
                      validator: (value) {
                        //check weather user interd a valid user name
                        if (value!.isEmpty) {
                          return "please enter your name";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Name",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    //email
                    TextFormField(
                      controller: _emailController,
                      validator: (value) {
                        //check weather user interd a valid email
                        if (value!.isEmpty) {
                          return "please enter your email";
                        }
                      },
                      decoration: InputDecoration(
                        hintText: "Email",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    //paswors
                    TextFormField(
                      controller: _paswordController,
                      validator: (value) {
                        //check weather user interd a valid password
                        if (value!.isEmpty) {
                          return "please enter your Password";
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Passweord",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                      ),
                    ),
                    SizedBox(height: 20),
                    //paswors
                    TextFormField(
                      controller: _confirmPasworddController,
                      validator: (value) {
                        //check weather user interd a valid password
                        if (value!.isEmpty) {
                          return "please enter your password";
                        }
                      },
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: "Cobfirm Passweord",
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        contentPadding: EdgeInsets.symmetric(
                          vertical: 20,
                          horizontal: 20,
                        ),
                      ),
                    ),
                    //remenber the next time
                    Row(
                      children: [
                        Text(
                          "Remember me for the next time",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: kGrey,
                          ),
                        ),
                        Expanded(
                          child: CheckboxListTile(
                            activeColor: kMainColor,
                            value: _rememberMe,
                            onChanged: (value) {
                              setState(() {
                                _rememberMe = value!;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 30),
                    GestureDetector(
                      onTap: () async {
                        if (_foreKey.currentState!.validate()) {
                          //form is valid,process data
                          String userName = _userNameController.text;
                          String emailName = _emailController.text;
                          String password = _paswordController.text;
                          String conPassword = _confirmPasworddController.text;

                          //save the user name and email
                          await UserService.storeUserData(
                            userName: userName,
                            email: emailName,
                            password: password,
                            confirmPassword: conPassword,
                            context: context,
                          );
                          //navigate to the main screen
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) {
                                return MainScreen();
                              },
                            ),
                          );
                        }
                      },
                      child: CustomButtom(
                        buttonName: "Submit",
                        buttonColor: kMainColor,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
