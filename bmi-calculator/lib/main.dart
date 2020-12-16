import 'package:bmi_calculator/result.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'iconContent.dart';
import 'reusableCode.dart';
import 'constants.dart';
import 'bottom_button.dart';
import 'calculator_brain.dart';

enum Gender{
  male,
  female,
}

void main() => runApp(BMICalculator());

class BMICalculator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(primaryColor: Color(0xFF24263B),
      scaffoldBackgroundColor: Color(0xFF24263B)),
      home: InputPage(),
    );
  }
}

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  Gender selectedGender;
  int height=180;
  int weight=60;
  int age=10;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(2.0),
        child: Column(
          
          crossAxisAlignment: CrossAxisAlignment.stretch,
          
          children: <Widget>[
            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender=Gender.male;
                      });
                    },
                      colour:selectedGender==Gender.male? activeColor:inactiveColor,
                      cardChild: IconContent(
                        icontext: "MALE",
                        icon: FontAwesomeIcons.mars,
                      ),
                      ),
                ),
                Expanded(
                  child: ReusableCard(
                    onPress: (){
                      setState(() {
                        selectedGender= Gender.female;
                      });
                    },
                    colour:selectedGender==Gender.female? activeColor:inactiveColor,
                    cardChild: IconContent(
                      icon: FontAwesomeIcons.venus,
                      icontext:"FEMALE",
                    ),
                    ),
                ),
              ],
            )),


            Expanded(
              child: ReusableCard(
                colour:activeColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                  Text('HEIGHT',
                  style:klabelTextStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[

                      Text(height.toString(),
                      style:kNumbertextstyle,
                      ),

                      Text('cm',
                      style: klabelTextStyle,),
                    ],
                  ),

                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      inactiveTrackColor:Colors.grey,
                      activeTrackColor:Colors.white,
                      thumbColor: Color(0xFFeb1555),
                      overlayColor: Color(0x29eb1555),
                      thumbShape: RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(overlayRadius : 30),
                    ),

                    child: Slider(
                      value: height.toDouble(),
                    min: 100,
                    max: 220,
                     onChanged: (value){
                       setState(() {
                         height=value.round();
                       });
                     }),
                  )

                ],),
                ),
            ),


            Expanded(
                child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(colour:activeColor,
                  cardChild: Column(
                    
                    children: <Widget>[
                      Text('WEIGHT',
                      style: klabelTextStyle ,),

                      Text(weight.toString(),
                      style: kNumbertextstyle,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                            setState(() {
                              weight--;
                            });
                          }),
                          SizedBox(
                            width: 10,
                          ),

                          RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                            setState(() {
                              weight++;
                            });
                          }),
                        ],
                      ),
                    ],
                  ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(colour:activeColor,
                  cardChild: Column(
                    
                    children: <Widget>[
                      Text('AGE',
                      style: klabelTextStyle ,),

                      Text(age.toString(),
                      style: kNumbertextstyle,),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          RoundIconButton(icon: FontAwesomeIcons.minus, onPressed: (){
                            setState(() {
                              age--;
                            });
                          }),
                          SizedBox(
                            width: 10,
                          ),

                          RoundIconButton(icon: FontAwesomeIcons.plus, onPressed: (){
                            setState(() {
                              age++;
                            });
                          }),
                        ],
                      ),
                    ],
                  ),
                  ),
                ),
              ],
            )),

            BottomButton(label: 'CALCULATE', onTap: (){

              CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context){
                return ResultsPage(
                  bmiResult: calc.calculateBMI(),
                  resultText: calc.getResult(),
                  interpretation: calc.interpretation(),
                );
              }));
            },),
          ],
        ),
      ),
    );
  }
}

class RoundIconButton extends StatelessWidget{
  RoundIconButton({@required this.icon, @required this.onPressed});
  final IconData icon;
  final Function onPressed;
  Widget build(BuildContext context){
    return RawMaterialButton(
      elevation: 0,
      child: Icon(icon,
      color: Colors.white,),
      onPressed: onPressed,
      constraints: BoxConstraints.tightFor(
        width: 56,
        height: 56,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xff4c4f5e),
    );
  }
}