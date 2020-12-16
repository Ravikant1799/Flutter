import 'package:flutter/material.dart';
import 'dart:math';
void main() => runApp(
      MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.lightBlue,
          appBar: AppBar(backgroundColor: Colors.blue,
          title: Text('Ask Me Anything'),centerTitle: true,),
          body: AskAnything(),
        ),
      ),
    );

class AskAnything extends StatefulWidget {
  @override
  _AskAnythingState createState() => _AskAnythingState();
}

class _AskAnythingState extends State<AskAnything> {
  int rannum=2;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: FlatButton(child: Image.asset('images/ball$rannum.png'),
        onPressed: () {
          setState(() {
            rannum=Random().nextInt(5)+1;
          });
          print('clicked');
        },),
      ),
    );
  }
}