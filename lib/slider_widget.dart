import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:math';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {

  int height=180;

  double double_round(double val, int places){
    num mod = pow(10.0, places);
    return ((val * mod).round().toDouble() / mod);
  }
  
  double cm_to_feet_converter(double cm)
  {
    return 0.0328084*cm;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text('HEIGHT',style: TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF8D8E98)),),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(height.toString(),style: kNumberTextStyle,),
            SizedBox(width:2.5,),
            Text('cm',style: kLabelTextStyle,),
            SizedBox(width: 30,),
            Text(double_round(cm_to_feet_converter(height.toDouble()),1).toString(),style: kNumberFeetTextStyle,),
            SizedBox(width:2.5,),
            Text('ft',style: kFeetLabelTextStyle,),
          ],
        ),

        Slider(
            activeColor: Color(0xFF1EB1555),
            inactiveColor:Color(0xFF8D8E98),
            value: height.toDouble(),
            min: 120 ,
            max: 220,
            onChanged: (double newValue) {

            setState(() {

              height=newValue.round();


            });


            }
        ),

      ],
    );
  }
}
