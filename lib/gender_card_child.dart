import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardChild extends StatelessWidget {


  CardChild({ required this.gender,required this.maleActiveColor,required this.femaleActiveColor});

  final String gender;
  final Color femaleActiveColor;
  final Color maleActiveColor;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.all(10),child: Icon(gender=='MALE'?FontAwesomeIcons.mars:FontAwesomeIcons.venus,size: 80.0,color:gender=='MALE'?maleActiveColor:femaleActiveColor,)),
        Text(gender=='MALE'?'MALE':'FEMALE',style:TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF8D8E98)),),
      ],
    );
  }
}

