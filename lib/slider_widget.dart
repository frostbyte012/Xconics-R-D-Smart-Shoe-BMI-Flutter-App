import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:slidable_button/slidable_button.dart';
import 'dart:io';
import 'constants.dart';
import 'dart:math';

class SliderWidget extends StatefulWidget {
  const SliderWidget({Key? key}) : super(key: key);

  @override
  State<SliderWidget> createState() => _SliderWidgetState();
}

class _SliderWidgetState extends State<SliderWidget> {

  int height=180;
  String result='';
  final filename='lib/height.txt';


  void writeHeight () async {
    File(filename).writeAsString(height.toString());
  }

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

        HorizontalSlidableButton(
              width: MediaQuery.of(context).size.width / 3,
              buttonWidth: 60.0,
              buttonColor: Color(0xFFEB1555),
              color:Color(0xFF111328),
              dismissible: false,
              label: Center(child: Text('HEIGHT',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.white),),),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text('CM'),
                    Text('FT'),
                  ],
                ),
              ),
              onChanged: (position) {
                setState(() {
                  if (position == SlidableButtonPosition.end) {
                    result = 'ft';
                  } else {
                    result = 'cm';
                  }
                });
              },
            ),

        SizedBox(height: 15,),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(result=='cm'?height.toString():double_round(cm_to_feet_converter(height.toDouble()),1).toString(),style: kNumberTextStyle,),
            Text(result=='cm'?'cm':'ft',style: kLabelTextStyle,),
          ],
        ),

        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.white,
            thumbColor:Color(0xFF1EB1555),
            thumbShape:RoundSliderThumbShape(enabledThumbRadius: 10.0),
            overlayColor:Color(0x291EB1555),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 20)

          ),
          child: Slider(
              inactiveColor:Color(0xFF8D8E98),
              value: height.toDouble(),
              min: 120,
              max: 220,
              onChanged: (double newValue) {
              setState(() {


                height=newValue.round();
                writeHeight();


                });
              }
          ),
        ),

      ],
    );
  }
}
