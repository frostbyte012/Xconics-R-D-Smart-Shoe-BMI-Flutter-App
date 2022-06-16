import 'package:flutter/material.dart';
import 'constants.dart';
import 'dart:io';
import 'dart:math';
import 'rounded_custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class WeightAgeStateFulWidget extends StatefulWidget {

  WeightAgeStateFulWidget({

    required this.title,

});

  final String title;



  State<WeightAgeStateFulWidget> createState() => _WeightAgeStateFulWidgetState();
}

class _WeightAgeStateFulWidgetState extends State<WeightAgeStateFulWidget> {

  int weight_age_var=25;

  final filename='lib/weight.txt';

  void writeWeight () async {
    File(filename).writeAsString(weight_age_var.toString());
  }

  double roundDouble(double value, int places){
    num mod = pow(10.0, places);
    return ((value * mod).round().toDouble() / mod);
  }


  void subtractWeight() async
  {
    setState((){
      if(weight_age_var>0)

        {
          if(widget.title=='WEIGHT')
          {
            weight_age_var-=1;
            writeWeight();
          }

          else{
            weight_age_var--;
          }

        }

    });
  }


  void addWeight() async
  {
    setState((){
      if(weight_age_var<200)
        {
          if(widget.title=='WEIGHT')
          {
            weight_age_var+=1;
            writeWeight();
          }

          else{
            weight_age_var++;
          }

        }

    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center ,
      children: [
        Text(widget.title,style: kLabelTextStyle,),
        Text(weight_age_var.toString(),style: kNumberTextStyle,),
        Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            RoundedMaterialButton(icon: FontAwesomeIcons.minus, func:subtractWeight),
            SizedBox(width: 10,),
            RoundedMaterialButton(icon: FontAwesomeIcons.plus, func:addWeight),
          ],

        ),

      ],
    );
  }
}




