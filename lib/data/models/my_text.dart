
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
        // mainAxisAlignment: MainAxisAlignment.spaceAround,
        children:<Widget>[
          Text (newText,
        style: const TextStyle(color: Colors.blue,fontSize: 24,),
        ),
          const SizedBox(height: 30),
          TextField(
           decoration: InputDecoration(
             filled: true,
             fillColor: Colors.white12,
             prefixIcon: const Icon(Icons.search),
             prefixIconColor: Colors.grey,
             suffixIcon: const Icon(Icons.mic),
             suffixIconColor: Colors.grey,
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0)),
             hintText: 'Search',
             hintStyle: const TextStyle(color: Colors.grey,fontSize: 20,),
             ),
      ),
      ],
    ),
    );
  }
}