import 'package:flutter/material.dart';

class GestureDetect extends StatelessWidget {

  const GestureDetect({required this.wid,required this.func});
  final Widget wid;
  final Function func;


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: ()
      {
        func();

      },
      child: wid,
    );
  }

}

