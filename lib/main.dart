import 'package:flutter/material.dart';
import 'package:insta_posts/Components/passwordGenerator.dart';
import 'package:insta_posts/screens/login.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: Login(),
      color: Colors.orange[50],
    );
  }
}
