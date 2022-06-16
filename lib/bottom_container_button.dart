import 'package:flutter/material.dart';
import 'constants.dart';

class BottomContainerButton extends StatelessWidget {

  const BottomContainerButton({required this.label});

  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Center(
        child:
        Text(label,
          style:kBottomContainerButtonTextStyle,
        ),
      ),
      color: backgroundButtonColor,
      margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 0.0),
      width: double.infinity,
      height: buttonHeight,
    );
  }
}
