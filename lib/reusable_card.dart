import 'package:flutter/material.dart';

class ReusableCard extends StatelessWidget {
  late final Color myColor;
  late final Widget setChild;
  late final VoidCallback setFunction;
  // late final void Function() setFunction;
  //it is the same thing
//does the same thing
  ReusableCard(
      {required Color inputColor,
      required Widget inputChild,
      required this.setFunction}) {
    myColor = inputColor;
    setChild = inputChild;
    //does the same thing
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: setFunction,
      child: Container(
        child: setChild,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: myColor,
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
