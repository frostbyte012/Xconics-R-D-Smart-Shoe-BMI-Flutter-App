import 'package:flutter/material.dart';
import 'constants.dart';
import 'rounded_custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class WeightAgeStateLessWidget extends StatelessWidget {
  const WeightAgeStateLessWidget({
    required this.title,
  });
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
        children: [

          Text(title,style: kLabelTextStyle,),
          WeightAgeStateFulWidget(),

        ]
    );
  }
}


class WeightAgeStateFulWidget extends StatefulWidget {

  @override
  State<WeightAgeStateFulWidget> createState() => _WeightAgeStateFulWidgetState();
}

class _WeightAgeStateFulWidgetState extends State<WeightAgeStateFulWidget> {

  double weight_age_var=0.0;


  void subtractWeight()
  {
    setState((){
      if(weight_age_var>0)
        {
          weight_age_var--;
        }
    });
  }

  void addWeight()
  {
    setState((){
      if(weight_age_var<200)
      {
        weight_age_var++;
      }
    });
  }



  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center ,
      children: [
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
    );;
  }
}




