import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MySkreen(),
    );
  }
}

class MySkreen extends StatefulWidget {
  const MySkreen ({Key? key}) : super(key: key);
  @override
  State<MySkreen> createState() => _MySkreenState();
}
class _MySkreenState extends State<MySkreen> {
  String newText='Hello!';
  DateTime dt = DateTime.now();
  void updateText(){
    setState(() {
      newText= '$dt';
    });

  }
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
        leading:IconButton(icon:const Icon(Icons.update), onPressed: updateText,),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(newText, style: Theme.of(context).textTheme.headline4,),
           ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
              icon: Icon(Icons.calculate),
            title: Text('Converter'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.attach_money),
            title: Text('Currencies'),
          ),
        ],
      ),
    );
  }
}
// class MyText extends StatefulWidget {
// const MyText ({Key? key}) : super(key: key);
// @override
// State<MyText> createState() => MyTextState();
// }
// class MyTextState extends State<MyText> {
//   String newText='Hello!';
// DateTime dt = DateTime.now();
//  void updateText(){
//  setState(() {
//    newText= '$dt';
//  });
//
// }
//   @override
//   Widget build(BuildContext context) {
//     return Text (newText,
//         style: Theme.of(context).textTheme.headline4,
//     );
//   }
//   }