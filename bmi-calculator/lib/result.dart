import 'package:bmi_calculator/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/reusableCode.dart';
import 'package:flutter/material.dart';

class ResultsPage extends StatelessWidget{

  ResultsPage({@required this.bmiResult, @required this.resultText, @required this.interpretation});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI Calculator'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(child: Container(
            padding: EdgeInsets.all(15),
            alignment: Alignment.bottomLeft,

            child: Text(
            'Your Result',
            style: kTitleTextStyle,
            textAlign: TextAlign.left,
          ),),),

          

          Expanded(
            flex: 5,
            child: ReusableCard(colour: activeColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  Text(resultText.toUpperCase(),
                  style: kResultTextStyle,
                  textAlign: TextAlign.center, ),

                  Text(bmiResult,
                  style: kBMItextStyle,
                  textAlign: TextAlign.center,
                  ),

                  Text(interpretation,
                  style: kDetailTextStyle,
                  textAlign: TextAlign.center,
                  ),

                ],
                
              ),
            ),
          ),

          BottomButton(label: 'RE-CALCULATE', onTap: (){Navigator.pop(context);},)

        ],
      ),

    );
  }
}