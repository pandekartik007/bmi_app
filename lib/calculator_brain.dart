import 'dart:math';

class CalculatorBrain {

  CalculatorBrain({this.height,this.weight});

  final int height;
  final int weight;
  double _bmi;

  String calculateBMI() {
    _bmi = weight / pow(height/100, 2);
    return _bmi.toStringAsFixed(1);
  }

  String getResult() {
    if(_bmi>=25){
      return 'OverWight';
    }else if(_bmi>18.5){
      return 'Normal';
    }else{
      return 'UnderWeight';
    }
  }

  String getInterpretaion() {
    if(_bmi>=25){
      return 'You have a higher than normal body weight, try to exercise more.';
    }else if(_bmi>18.5){
      return 'You have a normal body weight. Good Job!';
    }else{
      return 'You have a lower than normal body weight. You should have a better diet.';
    }
  }
}