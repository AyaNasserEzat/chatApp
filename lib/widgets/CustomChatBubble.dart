import 'package:flutter/material.dart';

import '../constants.dart';
import '../models/message.dart';
class chatbubble extends StatelessWidget {
   chatbubble({Key? key,required this.message}) : super(key: key);
   Message? message;

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerLeft,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: kcolor,
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),topLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            )
        ),
        child:  Text(message!.message,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}


class chatbubbleForFriend extends StatelessWidget {
  chatbubbleForFriend({Key? key,required this.message}) : super(key: key);
  Message? message;

  @override
  Widget build(BuildContext context) {
    return  Align(
      alignment: Alignment.centerRight,
      child: Container(
        padding: EdgeInsets.all(20),
        margin: EdgeInsets.all(5),
        decoration: BoxDecoration(
            color: Color(0xff006D84),
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),topLeft: Radius.circular(20),
              bottomLeft: Radius.circular(20),
            )
        ),
        child:  Text(message!.message,style: TextStyle(color: Colors.white),),
      ),
    );
  }
}
