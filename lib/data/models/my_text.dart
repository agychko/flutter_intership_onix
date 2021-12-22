
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
    return Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.all(20),
        margin: const EdgeInsets.all(20),
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              side: const BorderSide(color:Colors.blue, width: 4.0, style: BorderStyle.solid)
      ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:<Widget>[
        Text (newText,
        style: const TextStyle(color: Colors.blue,fontSize: 24,),
        //  style: Theme.of(context).textTheme.headline4,
      ),
       const TextField(
        decoration: InputDecoration(
          prefixIcon: Icon(Icons.search),
          suffixIcon: Icon(Icons.mic),
          border: OutlineInputBorder(),
          labelText: 'Search',
          ),
      ),
      ],
    ),
    );
  }
}