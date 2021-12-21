
import 'package:flutter/material.dart';

class MyText extends StatefulWidget {
  const MyText ({Key? key}) : super(key: key);
  @override
  State<MyText> createState() => MyTextState();
}
class MyTextState extends State<MyText> {
  String newText='Hello!';
  DateTime dt = DateTime.now();
  void updateText(){
    newText= '$dt';
    setState(() {});
  }
  @override
  Widget build(BuildContext context) {
    return Text (newText,
      style: Theme.of(context).textTheme.headline4,
    );
  }
}