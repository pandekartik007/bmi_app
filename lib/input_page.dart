import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'icon_content.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'results_page.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender{
  male,
  female,
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Gender gender;
  int height =180;
  int weight =60;
  int age = 18;
//  Color maleCardColor = inactiveCardColor;
//  Color femaleCardColor = inactiveCardColor;
//  //1 for male and 2 for female
//  void updateColor(Gender gender){
//    if(gender==Gender.male){
//      if(maleCardColor==inactiveCardColor) {
//        maleCardColor = activeCardColor;
//        femaleCardColor = inactiveCardColor;
//      }else{
//        maleCardColor = inactiveCardColor;
//      }
//    }
//    else if(gender==Gender.female){
//      if(femaleCardColor == inactiveCardColor){
//        femaleCardColor = activeCardColor;
//        maleCardColor = inactiveCardColor;
//      }else{
//        femaleCardColor = inactiveCardColor;
//      }
//    }
//  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(child: Text('BMI Calculator')),
      ),
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                          child: ReusableCard(
                            onPress: () {
                              setState(() {
                              gender = Gender.male;
                              });
                              },
                      colour: gender==Gender.male ? kActiveCardColor : kInactiveCardColor,
                      cardChild:IconContent(
                          icon: FontAwesomeIcons.mars,
                          label: 'MALE',
                      ),
                    ),
                        ),
                    Expanded(
                          child: ReusableCard(
                            onPress: () {
                              setState(() {
                              gender = Gender.female;
                              });
                              },
                      colour: gender==Gender.female ? kActiveCardColor : kInactiveCardColor,
                      cardChild:IconContent(
                          icon: FontAwesomeIcons.venus,
                          label: 'FEMALE',
                      ),
                    ),
                        ),
                  ],
                )
            ),
            Expanded(
                child: ReusableCard(
                  colour: Color(0xFF1D1E33),
                  cardChild: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[Text('HEIGHT',style: kLabelTextStyle,),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.baseline,
                          textBaseline: TextBaseline.alphabetic,
                          children: <Widget>[
                            Text(
                              height.toString(),
                              style: kNumberTextStyle,
                            ),
                            Text(
                              'cm',
                              style: kLabelTextStyle,
                            )
                          ],
                        ),
                      SliderTheme(
                        data: SliderTheme.of(context).copyWith(
                          inactiveTrackColor: Color(0xFF8D8E98),
                          activeTrackColor: Colors.white,
                          thumbColor: Color(0xFFEB1555),
                          overlayColor: Color(0x29EB1555),
                          thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                          overlayShape: RoundSliderOverlayShape(overlayRadius: 16.0)
                        ),
                        child: Slider(
                            value: height.toDouble(),
                            min: 120.0,
                            max: 220.0,
                            onChanged: (double newValue){
                              setState(() {
                                height=newValue.round();
                              });
                            },
                        ),
                      ),
                    ],
                  ),
                )
            ),
            Expanded(
                child: Row(
                  children: <Widget>[
                    Expanded(
                        child: ReusableCard(
                          colour: kActiveCardColor,
                          cardChild: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Text(
                                'WEIGHT',
                                style: kLabelTextStyle,
                              ),
                              Text(
                                weight.toString(),
                                style: kNumberTextStyle,
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.minus,
                                    onPressed: (){
                                      setState(() {
                                        weight--;
                                      });
                                    },
                                  ),
                                  SizedBox(
                                    width: 15.0,
                                  ),
                                  RoundIconButton(
                                    icon: FontAwesomeIcons.plus,
                                    onPressed: (){
                                      setState(() {
                                        weight++;
                                      });
                                    },
                                  ),
                                ],
                              )
                            ],
                          ),
                        )
                    ),
                    Expanded(child: ReusableCard(
                      colour: kActiveCardColor,
                      cardChild: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          Text(
                            'AGE',
                            style: kLabelTextStyle,
                          ),
                          Text(
                            age.toString(),
                            style: kNumberTextStyle,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              RoundIconButton(
                                icon: FontAwesomeIcons.minus,
                                onPressed: (){
                                  setState(() {
                                    age--;
                                  });
                                },
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              RoundIconButton(
                                icon: FontAwesomeIcons.plus,
                                onPressed: (){
                                  setState(() {
                                    age++;
                                  });
                                },
                              ),
                            ],
                          )
                        ],
                      ),
                    )),
                  ],
                )
            ),
            BottomButton(
              onTap: (){
                CalculatorBrain calc = CalculatorBrain(height: height,weight: weight);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context)=> ResultPage(
                    bmiResult: calc.calculateBMI(),
                    resultText: calc.getResult(),
                    interpretation: calc.getInterpretaion(),
                  )),
                );
              },
              buttonTitle: 'CALCULATE',
            ),
          ],
        ),
      )
    );
  }
}



class RoundIconButton extends StatelessWidget {

  RoundIconButton({@required this.icon,@required this.onPressed});

  final IconData icon;
  final Function onPressed;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      child: Icon(icon),
      onPressed: onPressed,
      elevation: 0.0,
      constraints: BoxConstraints.tightFor(
        width: 56.0,
        height: 56.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF4C4F5E),
    );
  }
}



