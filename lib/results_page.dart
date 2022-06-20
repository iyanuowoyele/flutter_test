// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, avoid_unnecessary_containers, prefer_const_constructors_in_immutables, use_key_in_widget_constructors

import 'package:bmi_calculator/input_page.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/reusable_card.dart';
//import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  late final String bmiResult;
  late final String resultText;
  late final String interpretation;
  ResultsPage(
      {required this.bmiResult,
      required this.resultText,
      required this.interpretation});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text('BMI CALCULATOR'),
        backgroundColor: Color(0XFF0A0E21),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              inputColor: cardColor,
              inputChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    resultText.toUpperCase(),
                    style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                        color: Color(
                          0XFF24D876,
                        )),
                  ),
                  Text(
                    bmiResult,
                    style: TextStyle(
                        fontSize: 100,
                        fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 23,
                        //fontWeight: FontWeight.bold,
                        color: Colors.white),
                  ),
                ],
              ),
              setFunction: () {},
            ),
          ),
          Expanded(
            child: BottomButton(
                setText: 'Re-Calculate BMI',
                tapMe: () {
                  Navigator.pop(context);
                }),
          ),
        ],
      ),
    );
  }
}
