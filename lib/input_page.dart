// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables, use_key_in_widget_constructors, unused_field, unused_import, non_constant_identifier_names, unrelated_type_equality_checks, prefer_const_constructors_in_immutables

import 'package:flutter/material.dart';
import 'package:bmi_calculator/main.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/reusable_card.dart';
import 'package:bmi_calculator/my_const.dart';
import 'package:bmi_calculator/results_page.dart';
import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

const Color cardColor = Color(0XFF1D1E33);
const Color inactiveColor = Color(0XFF0A0E21);

enum Gender { male, female, others }

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

//late means i promise i will initialize this variable later, but it means nothing
//when using the variable inside a build method
int height = 0;
late int weight = 0;
late int age = 0;

class _InputPageState extends State<InputPage> {
  //MyCard test = MyCard();
  Color maleCardColor = inactiveColor;
  Color femaleCardColor = inactiveColor;
  Color otherCardColor = inactiveColor;
//
  void UpdateColor(Gender gender) {
    if (gender == Gender.male && maleCardColor == inactiveColor) {
      maleCardColor = cardColor;
      femaleCardColor = inactiveColor;
      otherCardColor = inactiveColor;
    } else {
      maleCardColor = inactiveColor;
    }

    if (gender == Gender.female && femaleCardColor == inactiveColor) {
      femaleCardColor = cardColor;
      maleCardColor = inactiveColor;
      otherCardColor = inactiveColor;
    } else {
      femaleCardColor = inactiveColor;
    }

    if (gender == Gender.others && otherCardColor == inactiveColor) {
      otherCardColor = cardColor;
      maleCardColor = inactiveColor;
      femaleCardColor = inactiveColor;
    } else {
      otherCardColor = inactiveColor;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0XFF0A0E21),
        title: Center(child: Text('BMI CALCULATOR')),
      ),
      body: Column(
        // crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          //first child
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    setFunction: () {
                      setState(() {
                        UpdateColor(Gender.male);
                      });
                    },
                    inputColor: maleCardColor,
                    inputChild: ResuableColumn(
                      inputIcon: Icon(FontAwesomeIcons.mars,
                          size: 80, color: Colors.blue),
                      inputText: 'MALE',
                    ),
                  ),
                ),
                //others
                Expanded(
                  child: ReusableCard(
                    setFunction: () {
                      setState(() {
                        UpdateColor(Gender.others);
                      });
                    },
                    inputColor: otherCardColor,
                    inputChild: ResuableColumn(
                      inputIcon: Icon(FontAwesomeIcons.neuter,
                          size: 80, color: Color.fromARGB(255, 255, 255, 255)),
                      inputText: 'OTHERS',
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    setFunction: () {
                      setState(() {
                        UpdateColor(Gender.female);
                      });
                    },
                    inputColor: femaleCardColor,
                    inputChild: ResuableColumn(
                      inputIcon: Icon(FontAwesomeIcons.venus,
                          size: 80, color: Colors.pink),
                      inputText: 'FEMALE',
                    ),
                  ),
                ),
              ],
            ),
          ), //
          Expanded(
            child: ReusableCard(
                setFunction: () {
                  setState(() {});
                },
                inputColor: cardColor,
                inputChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'HEIGHT',
                      style: TextStyle(
                        fontSize: 18,
                        color: Colors.grey,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: [
                        Text(height.toString(), style: kBoldStyle),
                        Text(
                          'cm',
                          style: kBoldStyle,
                        )
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0XFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0XFFEB1555),
                          overlayColor: Color(0X29EB1555),
                          thumbShape:
                              RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape:
                              RoundSliderOverlayShape(overlayRadius: 25)),
                      child: Slider(
                        value: height.toDouble(),
                        onChanged: (double newValue) {
                          setState(() {
                            print(newValue);
                            height = newValue.round();
                          });
                        },
                        min: 0.0,
                        max: 300.0,
                      ),
                    )
                  ],
                )),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                      setFunction: () {
                        setState(() {});
                      },
                      inputColor: cardColor,
                      inputChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'WEIGHT',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey,
                            ),
                          ),
                          Text(
                            weight.toString(),
                            style: kBoldStyle,
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              MyRoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                pressMe: () {
                                  setState(() {
                                    if (weight >= 2) {
                                      weight = weight - 1;
                                    }
                                  });
                                },
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              MyRoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                pressMe: () {
                                  setState(() {
                                    weight = weight + 1;
                                  });
                                },
                              )
                            ],
                          )
                        ],
                      )),
                ),
                Expanded(
                  child: ReusableCard(
                    setFunction: () {
                      setState(() {});
                    },
                    inputColor: cardColor,
                    inputChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'AGE',
                          style: TextStyle(
                            fontSize: 18,
                            color: Colors.grey,
                          ),
                        ),
                        Text(
                          age.toString(),
                          style: kBoldStyle,
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            MyRoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              pressMe: () {
                                setState(() {
                                  if (age >= 2) {
                                    age = age - 1;
                                  }
                                });
                              },
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            MyRoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              pressMe: () {
                                setState(() {
                                  age = age + 1;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            setText: 'CALCULATE',
            tapMe: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) {
                    return ResultsPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    );
                  },
                ),
              );
            },
          )
        ],
      ),
    );
  }
}

class ResuableColumn extends StatelessWidget {
  late final Widget setIcon;
  late final String setText;

  ResuableColumn({required Widget inputIcon, required String inputText}) {
    setIcon = inputIcon;
    setText = inputText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(mainAxisAlignment: MainAxisAlignment.center, children: [
      setIcon,
      SizedBox(
        height: 10,
      ),
      Text(
        setText,
        style: TextStyle(fontSize: 18, color: Colors.grey),
      ),
    ]);
  }
}

class MyRoundIconButton extends StatelessWidget {
  final IconData icon;
  final VoidCallback pressMe;

  MyRoundIconButton({required this.icon, required this.pressMe});

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: pressMe,
      child: Icon(icon),
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(width: 56.0, height: 56.0),
      shape: CircleBorder(),
      fillColor: Color(0XFF4C4F5E),
    );
  }
}

// class MyCard {
//   Widget gt = Container(
//     margin: EdgeInsets.all(15),***********************
//     decoration: BoxDecoration(
//         color: Colors.pink, borderRadius: BorderRadius.circular(15)),
//   );
// }

// Icon(
//        FontAwesomeIcons.setIcon,
//        size: 80,
//      )