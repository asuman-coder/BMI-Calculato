import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

class ResultsPage extends StatelessWidget {
  const ResultsPage(
      {super.key,
      required this.interpretation,
      required this.bmiResult,
      required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.purple,
        centerTitle: true,
        title: const Text(
            overflow: TextOverflow.ellipsis, maxLines: 1, 'BMI CALCULATOR'),
      ),
      // ignore: avoid_unnecessary_containers
      body: Container(
        child: Column(
          children: [
            Expanded(
              flex: 5,
              // ignore: avoid_unnecessary_containers
              child: Container(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.all(15.0),
                        alignment: Alignment.bottomLeft,
                        child: const Text(
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          "Your Result",
                          style: kTitleTextStyle,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      // ignore: avoid_unnecessary_containers
                      child: Container(
                        child: ReusableCard(
                          colour: kActiveCardColour,
                          cardChild: SingleChildScrollView(
                            // ignore: sized_box_for_whitespace
                            child: Container(
                              height: 400.0,
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: <Widget>[
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    resultText.toUpperCase(),
                                    style: kResultTextStyle,
                                  ),
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 1,
                                    bmiResult,
                                    style: kBMITextStyle,
                                  ),
                                  Text(
                                    overflow: TextOverflow.ellipsis,
                                    maxLines: 2,
                                    interpretation,
                                    textAlign: TextAlign.center,
                                    style: kBodyTextStyle,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // ignore: avoid_unnecessary_containers
            Container(
                child: BottomButton(
              buttonTitle: 'Re-Calculate',
              onTap: () {
                Navigator.pop(context);
              },
            )),
          ],
        ),
      ),
    );
  }
}
