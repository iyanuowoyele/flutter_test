// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class BottomButton extends StatelessWidget {
  final VoidCallback tapMe;
  final String setText;

  BottomButton({required this.setText, required this.tapMe});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: tapMe,
      child: Container(
        child: Center(
          child: Text(setText,
              style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                  color: Colors.white)),
        ),
        height: 80,
        width: 280,
        padding: EdgeInsets.only(bottom: 15),
        margin: EdgeInsets.only(top: 10.0, bottom: 10),
        decoration: BoxDecoration(
          color: Color.fromARGB(239, 235, 21, 85),
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
