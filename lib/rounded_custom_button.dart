import 'package:flutter/material.dart';

class RoundedMaterialButton extends StatelessWidget {
  const RoundedMaterialButton({
    required this.icon,
    required this.func,
  });
  final Function func;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(

         child:Icon(icon),
         elevation: 0.0,
         constraints: BoxConstraints.tightFor(
           width: 56.0,
           height: 56.0,
         ),
        onPressed: (){
           func();
        },
        shape: CircleBorder(),
        fillColor: Color(0xFF4C4F5E),
    );
  }
}
