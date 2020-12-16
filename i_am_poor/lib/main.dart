import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    home: Scaffold(
      appBar: AppBar(
        title:Center(child: Text('I am poor')),
        backgroundColor:Colors.lightGreen,
      ),
      body:Center(child:Image(image:  AssetImage('images/coal.png'))),
      backgroundColor: Colors.blueAccent,
    ),
  ));
}
