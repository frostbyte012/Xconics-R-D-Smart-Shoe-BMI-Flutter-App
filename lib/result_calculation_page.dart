import 'package:flutter/material.dart';
import 'constants.dart';
import 'bottom_container_button.dart';
import 'gesture_widget.dart';


class ResultCalculationPage extends StatefulWidget {

  ResultCalculationPage({required this.bmi,required this.codeInt});

  final double bmi;
  final int codeInt;

  @override
  State<ResultCalculationPage> createState() => _ResultCalculationPageState();
}

class _ResultCalculationPageState extends State<ResultCalculationPage> {

  void inputPageNavigator()=>Navigator.pop(context);

  List status_var=['Normal','Over Weight','Under Weight'];
  List recommendation=['Your BMI result is Normal,\n    Keep Maintaining it!','Your BMI result is quite high,\n    you should workout more!','Your BMI result is quite low,\n    you should eat more!'];
  List kTextStatusVarTextStyle=[kNormalResultTextStyle,kOverWeightResultTextStyle,kUnderWeightResultTextStyle];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI CALCULATOR',style: kAppBarTextStyle,),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [

          Padding(
            padding: EdgeInsets.fromLTRB(0,0,0,0) ,
            child: Text("Your Result",style: kYourResultTextStyle,),
          ),

          Expanded(
            child:Container(
              margin:EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: kActiveCardColour,
                borderRadius: BorderRadius.circular(15),
              ),

              child: Container(
                margin:EdgeInsets.fromLTRB(80, 0, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Padding(
                       child:Text(status_var[widget.codeInt],style: kTextStatusVarTextStyle[widget.codeInt],),
                       padding: EdgeInsets.fromLTRB(40, 0, 0, 0)),

                    SizedBox(height: 50,),
                    Text(widget.bmi.toString(),style: kNumberResultTextStyle,),
                    SizedBox(height: 50,),
                    Text(recommendation[widget.codeInt],style: kResultSuggestionTextStyle,),


                  ],
                ),
              ),

            ),
          ),

          GestureDetect(
              wid:BottomContainerButton(label:'RE-CALCULATE'),
              func: inputPageNavigator),


        ],
      ),
    );
  }
}
