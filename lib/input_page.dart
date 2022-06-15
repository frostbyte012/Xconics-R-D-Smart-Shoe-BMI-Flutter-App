import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'gender_card_child.dart';
import 'custom_weight_height_button.dart';
import 'slider_widget.dart';

const activeCardColor = Color(0xFF1D1E33);
const inactiveCardColor = Color(0xFF111328);
const backgroundButtonColor = Color(0xFFEB1555);
const buttonHeight = 80.0;

// enum Gender {Male,Female}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleColor=inactiveCardColor;
  Color femaleColor=inactiveCardColor;

 void maleGenderSelection()
 {
   setState(() {
      maleColor=activeCardColor;
      femaleColor=inactiveCardColor;
     });
  }

  void femaleGenderSelection()
  {
    setState(() {
      femaleColor=activeCardColor;
      maleColor=inactiveCardColor;
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI Calculator',
          style:TextStyle(color: Colors.white,fontWeight:FontWeight.bold),
        ),
      ),

      body:Column(
        children: [
          Expanded(
            flex: 1,
            child:Row(
              children: [
                Expanded(
                  child:GestureDetector(
                      onTap: maleGenderSelection,
                      child: ReusableCard(
                          colour: maleColor,
                          cardChild: CardChild(gender: 'MALE',),),),
                ),
                Expanded(
                  child:GestureDetector(
                    onTap: femaleGenderSelection,
                    child: ReusableCard(
                      colour: femaleColor,
                      cardChild: CardChild(gender: 'FEMALE',),),),),
              ],
            )
          ),

          Expanded(child:ReusableCard(colour: activeCardColor,cardChild: SliderWidget()),),

          Expanded(
              child:Row(
            children: [
              Expanded(
                child:
                ReusableCard(colour: activeCardColor,
                    cardChild:WeightAgeStateLessWidget(title : 'WEIGHT',),
                ),
              ),
              Expanded(
                child:
                  ReusableCard(colour: activeCardColor,cardChild:WeightAgeStateLessWidget(title: 'AGE',),),
              ),
            ],
           ),
          ),

          Container(
            color: backgroundButtonColor,
            margin: EdgeInsets.only(left: 0.0,top: 10.0,right: 0.0,bottom: 0.0),
            width: double.infinity,
            height: buttonHeight,

          ),

        ],
      ),

      // floatingActionButton: Theme(
      //   data: ThemeData(
      //     accentColor: Colors.purple,
      //   ),
      //   child: FloatingActionButton(
      //     child: Icon(Icons.add),
      //     onPressed: (){},
      //   ),
      // ),

    );
  }
}
