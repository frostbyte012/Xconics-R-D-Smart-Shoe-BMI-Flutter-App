import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CardChild extends StatelessWidget {


  CardChild({ required this.gender});

  final String gender;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(padding: EdgeInsets.all(10),child: Icon(gender=='MALE'?FontAwesomeIcons.mars:FontAwesomeIcons.venus,size: 80.0,)),
        Text(gender=='MALE'?'MALE':'FEMALE',style:TextStyle(fontWeight: FontWeight.bold,color: Color(0xFF8D8E98)),),
      ],
    );
  }
}

