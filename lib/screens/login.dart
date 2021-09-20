import 'dart:convert';

import 'package:beauty_textfield/beauty_textfield.dart';
import 'package:flutter/material.dart';
import 'package:insta_posts/Components/passwordGenerator.dart';

enum PageState { LoginState, RegisterState }

class Login extends StatefulWidget {
  const Login({Key key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  PageState currentState = PageState.LoginState;
  final formkey = new GlobalKey<FormState>();

  final userNameController = TextEditingController();
  final loginPasswordController = TextEditingController();
  final registerpasswordController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();

  final userNamerFocusNode = FocusNode();
  final passwordFocusNode = FocusNode();
  final emailFocusNode = FocusNode();
  final phoneNumberFocusNode = FocusNode();

  final String userValidatorText = "User Name Cannot be Null";
  final String passValidatorText = "Password Cannot be Null";
  final String emailValidatorText = "Email Cannot be Null";
  final String phoneNumberValidatorText = "PhoneNumber Cannot be Null";

  String userName;
  String password;
  String email;
  String phoneNumber;
  String generatePassword;

  void _passwordGenerator() {
    generatePassword = PassGenerator.passwordGenerator();
    setState(() {
      registerpasswordController.text = generatePassword;
    });
  }

  void _forgetPassword() {}

  void _moveToRegisterPage() {
    setState(() {
      currentState = PageState.RegisterState;
    });
  }

  void _moveToLoginPage() {
    setState(() {
      currentState = PageState.LoginState;
    });
  }

  void hideOrNotTextFieldText(){
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr,
      child: Scaffold(
        backgroundColor: Colors.grey[300],
        body: Center(
          child: Material(
            elevation: 15,
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[300],
              ),
              width: 300,
              height: 400,
              child: Column(
                children: [
                  Form(
                    key: formkey,
                    child: currentState == PageState.LoginState
                        ? Column(
                            children: <Widget>[
                              tittleBuild("Login"),
                              textFieldBuild(
                                  context,
                                  userNameController,
                                  userNamerFocusNode,
                                  userValidatorText,
                                  userName,
                                  Icon(Icons.person),
                                  "Enter Your User Name",
                                  "User Name",
                                  false,
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.done),
                                  ),
                                  false),
                              spacerBuild(10),
                              textFieldBuild(
                                  context,
                                  loginPasswordController,
                                  passwordFocusNode,
                                  passValidatorText,
                                  password,
                                  Icon(Icons.lock_outline),
                                  "Enter Your Password",
                                  "Password",
                                  true,
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.remove_red_eye)
                                  ),
                                  true),
                              spacerBuild(10),

                              textButtonBuild(() {
                                _forgetPassword();
                              }, " Forget Password ?", Colors.black, 14),

                              spacerBuild(10),
                              buildButton("Login", () {}),
                              spacerBuild(25),
                              Text("Or Sign in Using"),
                              spacerBuild(10),

                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SocialMediaBox("assets/facebook.png"),
                                  SizedBox(width: 5),
                                  SocialMediaBox("assets/google.png"),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  SocialMediaBox("assets/twitter.png"),
                                ],
                              ),
                              changePageStateTextButtonBuild(() {
                                _moveToRegisterPage();
                              }, "Not a member?", " SignUp"),
                              //   ],
                              // ),
                            ],
                          )
                        : Column(
                            children: <Widget>[
                              tittleBuild(" Register "),
                              textFieldBuild(
                                  context,
                                  userNameController,
                                  userNamerFocusNode,
                                  userValidatorText,
                                  userName,
                                  Icon(Icons.person),
                                  "Enter Your User Name",
                                  "User Name",
                                  false,
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.done),
                                  ),
                                  false),
                              textFieldBuild(
                                  context,
                                  emailController,
                                  emailFocusNode,
                                  emailValidatorText,
                                  email,
                                  Icon(Icons.send),
                                  "Enter Your User Email",
                                  "Email",
                                  false,
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.done),
                                  ),
                                  false),
                              textFieldBuild(
                                  context,
                                  phoneNumberController,
                                  phoneNumberFocusNode,
                                  phoneNumberValidatorText,
                                  phoneNumber,
                                  Icon(Icons.phone),
                                  "Enter Your Phone Number",
                                  "Phone Number",
                                  false,
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(Icons.done),
                                  ),
                                  false),
                              textFieldBuild(
                                  context,
                                  registerpasswordController,
                                  passwordFocusNode,
                                  passValidatorText,
                                  password,
                                  Icon(Icons.lock_outline),
                                  "Enter Your Password",
                                  "Password",
                                  true,
                                  IconButton(
                                    onPressed: () {
                                      hideOrNotTextFieldText();
                                    },
                                    icon: Icon(Icons.remove_red_eye),
                                  ),
                                  false),
                              spacerBuild(5),
                              textButtonBuild(() {
                                _passwordGenerator();
                              }, " Generate Password", Colors.green, 14),
                              spacerBuild(25),
                              buildButton("Register", () {}),
                              changePageStateTextButtonBuild(() {
                                _moveToLoginPage();
                              }, "Already a member?", " Login"),
                            ],
                          ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Padding changePageStateTextButtonBuild(
    Function func,
    String tittle1,
    String tittle2,
  ) {
    return Padding(
      padding: const EdgeInsets.only(top: 10),
      child: GestureDetector(
        onTap: func,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              tittle1,
              style: TextStyle(fontSize: 14),
            ),
            Text(
              tittle2,
              style: TextStyle(fontSize: 18),
            )
          ],
        ),
      ),
    );
  }

  Container textButtonBuild(
      Function func, String tittle, Color color, double fontSize) {
    return Container(
      width: 250,
      child: GestureDetector(
        onTap: func,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              tittle,
              style: TextStyle(color: color, fontSize: fontSize),
            ),
          ],
        ),
      ),
    );
  }

  SizedBox spacerBuild(double height) {
    return SizedBox(
      height: height,
    );
  }

  Container textFieldBuild(
    BuildContext context,
    TextEditingController controller,
    FocusNode focusNode,
    String validatorText,
    String onSaveValue,
    Icon icon,
    String hintText,
    String labelText,
    bool sufixIconExist,
    IconButton suffixIcon,
    bool hideOrNot,
  ) {
    return Container(
      height: 50,
      width: 250,
      child: TextFormField(
        obscureText: hideOrNot,
        controller: controller,
        onFieldSubmitted: (value) {
          FocusScope.of(context).requestFocus(focusNode);
        },
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        validator: (value) => value.isEmpty ? validatorText : null,
        onSaved: (value) => onSaveValue = value,
        style: TextStyle(
          color: Colors.black,
        ),
        decoration: InputDecoration(
            hintText: hintText,
            labelText: labelText,
            suffixIcon: sufixIconExist ? suffixIcon : null,
            icon: icon,
            hintStyle: TextStyle(fontSize: 15, color: Colors.black)),
      ),
    );
  }

  Padding tittleBuild(String tittle) {
    return Padding(
      padding: const EdgeInsets.only(top: 3, bottom: 5),
      child: Container(
        child: Text(
          tittle,
          style: TextStyle(
              fontSize: 30, color: Colors.green, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }

  Container SocialMediaBox(String image) {
    return Container(
      height: 40,
      width: 40,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(30)),
      child: Image.asset(image),
    );
  }

  Container buildButton(String textValue, var func) {
    return Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.purple[300], Colors.blueAccent[100]],
              begin: Alignment.centerLeft,
              end: Alignment.centerRight),
          borderRadius: BorderRadius.circular(25)),
      width: 225,
      height: 40,
      child: MaterialButton(
        onPressed: func,
        child: Text(
          textValue,
          style: TextStyle(
              fontSize: 15,
              fontFamily: 'SFUIDisplay',
              fontWeight: FontWeight.bold,
              color: Colors.black),
        ),
        elevation: 15,
      ),
    );
  }
}
