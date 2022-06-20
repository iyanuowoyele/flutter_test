// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:bmi_calculator/input_page.dart';

void main() {
  runApp(BMICalculator());
}

class BMICalculator extends StatelessWidget {
  const BMICalculator({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color(0XFF0A0E21),
        scaffoldBackgroundColor: Color(0XFF0A0E21),
        textTheme: TextTheme(
          bodyText2: TextStyle(color: Colors.pink),
        ),
        // colorScheme:
        //     ColorScheme.fromSwatch().copyWith(secondary: Colors.purple),
      ),
      home: InputPage(),
    );
  }
}
