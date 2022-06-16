import 'dart:math';

class BMICalculatorBrain{

  BMICalculatorBrain({
    required this.height,
    required this.weight,
});

  final int weight;
  final int height;

  var _bmi;


  double roundDouble(double value, int places){
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }

  double bmi_output()
  {
    _bmi=(weight/(height*height))*10000;
    return roundDouble(_bmi, 1);
  }

  int conditionVariables()
  {
    if(_bmi>25.0)
      return 1;
    if(_bmi<=25.0 && _bmi >=18.5)
       return 0;
    if(_bmi<18.5)
       return 2;
    print("Error");
    return 3;
    }
  }

  
