import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/results_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';

enum Gender {
  male,
  female,
}

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text('BMI CALCULATOR'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child: SingleChildScrollView(
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: Column(
                  children: [
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            // ignore: avoid_unnecessary_containers
                            child: Container(
                              child: ReusableCard(
                                onPress: () {
                                  setState(() {
                                    selectedGender = Gender.male;
                                  });
                                },
                                colour: selectedGender == Gender.male
                                    ? kActiveCardColour
                                    : kInactiveCardColour,
                                cardChild: const IconContent(
                                  icon: FontAwesomeIcons.mars,
                                  label: 'MALE',
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            // ignore: avoid_unnecessary_containers
                            child: Container(
                              child: ReusableCard(
                                onPress: () {
                                  setState(() {
                                    selectedGender = Gender.female;
                                  });
                                },
                                colour: selectedGender == Gender.female
                                    ? kActiveCardColour
                                    : kInactiveCardColour,
                                cardChild: const IconContent(
                                  icon: FontAwesomeIcons.venus,
                                  label: 'FEMALE',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: ReusableCard(
                        colour: kActiveCardColour,
                        cardChild: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // ignore: avoid_unnecessary_containers
                            Container(
                              child: const Text(
                                'HEIGHT',
                                style: kLabelTextStyle,
                              ),
                            ),
                            // ignore: avoid_unnecessary_containers
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.baseline,
                                textBaseline: TextBaseline.alphabetic,
                                children: [
                                  // ignore: avoid_unnecessary_containers
                                  Container(
                                    child: Text(
                                      height.toString(),
                                      style: kNumberTextStyle,
                                    ),
                                  ),
                                  // ignore: avoid_unnecessary_containers
                                  Container(
                                    child: const Text(
                                      'cm',
                                      style: kLabelTextStyle,
                                    ),
                                  )
                                ],
                              ),
                            ),
                            SliderTheme(
                              data: SliderTheme.of(context).copyWith(
                                inactiveTrackColor: const Color(0xFF8D8E98),
                                activeTrackColor: Colors.white,
                                thumbColor: const Color(0xFFEB1555),
                                overlayColor: const Color(0x29EB1555),
                                thumbShape: const RoundSliderThumbShape(
                                    enabledThumbRadius: 15.0),
                                overlayShape: const RoundSliderOverlayShape(
                                    overlayRadius: 30.0),
                              ),
                              child: Slider(
                                value: height.toDouble(),
                                min: 120.0,
                                max: 220.0,
                                onChanged: (double newValue) {
                                  setState(() {
                                    height = newValue.round();
                                  });
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    // ignore: avoid_unnecessary_containers
                    Container(
                      child: Row(
                        children: [
                          Expanded(
                            // ignore: avoid_unnecessary_containers
                            child: Container(
                              child: ReusableCard(
                                colour: kActiveCardColour,
                                cardChild: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Text(
                                      'WEIGHT',
                                      style: kLabelTextStyle,
                                    ),
                                    Text(
                                      weight.toString(),
                                      style: kNumberTextStyle,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        RoundIconButton(
                                            icon: FontAwesomeIcons.minus,
                                            onPressed: () {
                                              setState(() {
                                                weight--;
                                              });
                                            }),
                                        const SizedBox(
                                          width: 10.0,
                                        ),
                                        RoundIconButton(
                                          icon: FontAwesomeIcons.plus,
                                          onPressed: () {
                                            setState(() {
                                              weight++;
                                            });
                                          },
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            // ignore: avoid_unnecessary_containers
                            child: Container(
                              // ignore: avoid_unnecessary_containers
                              child: Container(
                                child: ReusableCard(
                                  colour: kActiveCardColour,
                                  cardChild: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: <Widget>[
                                      const Text(
                                        'AGE',
                                        style: kLabelTextStyle,
                                      ),
                                      Text(
                                        age.toString(),
                                        style: kNumberTextStyle,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: <Widget>[
                                          RoundIconButton(
                                            icon: FontAwesomeIcons.minus,
                                            onPressed: () {
                                              setState(
                                                () {
                                                  age--;
                                                },
                                              );
                                            },
                                          ),
                                          const SizedBox(
                                            width: 10.0,
                                          ),
                                          RoundIconButton(
                                              icon: FontAwesomeIcons.plus,
                                              onPressed: () {
                                                setState(() {
                                                  age++;
                                                });
                                              })
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          BottomButton(
            buttonTitle: 'Calculate',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: height, weight: weight);

              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ResultsPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretation(),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
