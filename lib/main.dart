
import 'package:flutter/material.dart';
import 'package:my_app/screens/bmi_calculator.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "BMI",
      debugShowCheckedModeBanner: false,
      theme: ThemeData.light(),
      home: BMICalculator(),
    );
  }
}