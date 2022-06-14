import 'package:flutter/material.dart';
class GestureDetect extends StatelessWidget {

  const GestureDetect({required this.wid,});
  final Widget wid;

  testFun()
  {
    print("Yes! It's Working !");
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: testFun,
      child: wid,
    );
  }

}

