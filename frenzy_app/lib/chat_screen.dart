import 'package:flutter/material.dart';

class  ChatScreen extends StatefulWidget{
  State createState() => ChatScreenState();

}
class ChatScreenState extends State<ChatScreen>{
  final TextEditingController _textController = TextEditingController();

  void _handleSubmitted(String text){
    _textController.clear()
  }

  Widget _textComposerWidget(){
    return Container(
      margin: const EdgeInsets.symmetric(horizontal:8.0),
      child: TextField(
        decoration: InputDecoration.collapsed(hintText: "Send a message"),
        controller: _textController,
        onSubmitted: _handleSubmitted,
        ),
    );
  }

  Widget build(BuildContext context){
    return _textComposerWidget();
  }

}