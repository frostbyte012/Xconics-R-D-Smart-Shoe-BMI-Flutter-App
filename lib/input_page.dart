import 'dart:io';
import 'dart:math';
import 'package:body_mass_index_2_app/gesture_widget.dart';
import 'package:flutter/material.dart';
import 'reusable_card.dart';
import 'constants.dart';
import 'gender_card_child.dart';
import 'custom_weight_height_button.dart';
import 'package:slidable_button/slidable_button.dart';
import 'result_calculation_page.dart';
import 'bottom_container_button.dart';
import 'bmi_calculate_brain.dart';
import 'rounded_custom_button.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


// enum Gender {Male,Female}

class InputPage extends StatefulWidget {
  const InputPage({Key? key}) : super(key: key);

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  Color maleColor=inactiveCardColor;
  Color femaleColor=inactiveCardColor;
  Color maleActiveColor=Colors.white;
  Color femaleActiveColor=Colors.white;

  int height=180;
  String result='';
  final filename='lib/height.txt';
  int weight_age_var=50;


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


  void resultCalculationNavigation()
  {
    print(weight_age_var);
    print(height);
    BMICalculatorBrain bmibrain = new BMICalculatorBrain(height:height,weight:weight_age_var);
    print(bmibrain.bmi_output());
    Navigator.push(context, MaterialPageRoute(builder: (context)=>ResultCalculationPage(
      bmi: bmibrain.bmi_output(),
      codeInt: bmibrain.conditionVariables(),)));
  }

 void maleGenderSelection()
 {
   setState(() {
      maleColor=activeCardColor;
      femaleColor=inactiveCardColor;
      maleActiveColor=Color(0xFFEB1555);
      femaleActiveColor=Colors.white;
     });
  }

  void femaleGenderSelection()
  {
    setState(() {
      femaleColor=activeCardColor;
      maleColor=inactiveCardColor;
      femaleActiveColor=Color(0xFFEB1555);
      maleActiveColor=Colors.white;
    });
  }


  void subtractWeight()
  {
    setState((){
      if(weight_age_var>0)
      {
          weight_age_var=weight_age_var-1;
      }

    });
  }


  void addWeight()
  {
    setState((){
      if(weight_age_var<200)
      {
          weight_age_var=weight_age_var+1;
      }

    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      appBar: AppBar(
        backgroundColor: Color(0xFF0A0E21),
        title: Text('BMI Calculator',
          style:kAppBarTextStyle,
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
                          cardChild: CardChild(gender: 'MALE',femaleActiveColor:femaleActiveColor,maleActiveColor: maleActiveColor,),),),
                ),
                Expanded(
                  child:GestureDetector(
                    onTap: femaleGenderSelection,
                    child: ReusableCard(
                      colour: femaleColor,
                      cardChild: CardChild(gender: 'FEMALE',femaleActiveColor:femaleActiveColor,maleActiveColor: maleActiveColor,),),),),
              ],
            )
          ),

          Expanded(child:ReusableCard(
              colour: activeCardColor,
              cardChild:Column(
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
                        max: 300,
                        onChanged: (double newValue) {
                          setState(() {


                            height=newValue.round();


                          });
                        }
                    ),
                  ),

                ],
              )),),

          Expanded(
              child:Row(
            children: [
              Expanded(
                child:
                ReusableCard(colour: activeCardColor,
                    cardChild:Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center ,
                      children: [
                        Text('WEIGHT (KG)',style: kLabelTextStyle,),
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
                    ),
                ),
              ),
              Expanded(
                child:
                  ReusableCard(colour: activeCardColor,cardChild:WeightAgeStateFulWidget(title: 'AGE',),),
              ),
            ],
           ),
          ),

          GestureDetect(
            func: resultCalculationNavigation,
            wid:  BottomContainerButton(label: 'CALCULATE',),
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
