
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
        TextField(
        
         decoration: InputDecoration(
             filled: true,
             fillColor: Colors.black12,
             prefixIcon: const Icon(Icons.search),
             suffixIcon: const Icon(Icons.mic),
             border: OutlineInputBorder(borderRadius: BorderRadius.circular(25.0),),
             hintText: 'Search',
             // contentPadding: EdgeInsets.all(10)
          ),
      ),
      ],
    ),
    );
  }
}