import 'package:flutter/material.dart';
import 'constants.dart';


class IconContent extends StatelessWidget {
  const IconContent({
    this.icon, this.icontext,
  });

  final IconData icon;
  final String icontext;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          icon,
          size:80,
          color: Colors.white,
        ),

        SizedBox(height: 15),

        Text(icontext,
        style:klabelTextStyle, ),
      ],
    );
  }
}