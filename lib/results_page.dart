import 'package:flutter/material.dart';
import 'constants.dart';
import 'reusable_card.dart';
import 'package:bmi/bottom_button.dart';
import 'package:url_launcher/url_launcher.dart';
class ResultPage extends StatelessWidget {

  ResultPage({this.bmiResult,this.resultText,this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
              child: Container(
                padding: EdgeInsets.all(20.0),
                child: Text(
                    'Your Result',
                  textAlign: TextAlign.center,
                  style: kTitleTextStyle,
                ),
              )
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    resultText,
                    style: kResultTextStyle,
                  ),
                  Text(
                    bmiResult,
                    style: kBMITextStyle,
                  ),
                  Text(
                    interpretation,
                    style: kBodyTextStyle,
                    textAlign: TextAlign.center,
                  ),
                  Center(
                    child: RaisedButton(
                      child: Text('Click here to know about a healthy diet'),
                      onPressed:()=> launch('https://www.healthline.com/nutrition/indian-diet-weight-loss#foods-to-avoid'),
                    ),
                  )
                ],
              ),
            ),
          ),
          BottomButton(onTap: () => Navigator.pop(context), buttonTitle: 'RE-CALCULATE'),
        ],
      )
    );
  }
}
//_launchURL() async {
//  const url = "https://www.healthline.com/nutrition/indian-diet-weight-loss#foods-to-avoid";
//  if (await canLaunch(url)) {
//    await launch(url);
//  } else {
//    throw 'Could not launch $url';
//  }
//}
