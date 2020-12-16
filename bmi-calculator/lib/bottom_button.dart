import 'package:flutter/material.dart';
import 'constants.dart';

class BottomButton extends StatelessWidget {
  
  BottomButton({@required this.label, @required this.onTap});

  final String label;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
                  child: Container(
        child: Text(label,
        style: kLargeButtonTextStyle ,
        textAlign: TextAlign.center,),
        color: bottomContainerColor,
        margin: EdgeInsets.only(top:10),
        width: double.infinity,
        height: bottomContainerHeight,
      ),
    );
  }
}