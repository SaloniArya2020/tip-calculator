import 'package:flutter/material.dart';
import 'package:tip_calculator/Screens/home.dart';
import 'package:tip_calculator/constants.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: kPrimaryColor,
            scaffoldBackgroundColor: Colors.white
      ),
      home: HomePage(),
    );
  }
}
