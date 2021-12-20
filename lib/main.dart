import 'package:flutter/material.dart';

final key = GlobalKey<MyTextState>();

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
      home: const MyScreen(),
    );
  }
}

class MyScreen extends StatefulWidget {
  const MyScreen ({Key? key}) : super(key: key);

  @override
  State<MyScreen> createState() => MyScreenState();
}
class MyScreenState extends State<MyScreen> {
    int _selectedTab=0;
    static List<Widget> widgetOptions = <Widget>[
      MyText(key: key,),
      const Text(''),
    ];

    void _onItemTapped(int index) {
      setState(() {
        _selectedTab = index;
      });
    }


    @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text('Update'),
        leading:IconButton(
          icon:const Icon(Icons.update),
          onPressed: () => key.currentState?.updateText(),
        ),
      ),
      body: Center(
        child: widgetOptions.elementAt(_selectedTab),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedTab,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.calculate), label: 'Converter'),
          BottomNavigationBarItem(icon: Icon(Icons.attach_money), label:'Currencies'),
        ],
        onTap: _onItemTapped,
        ),
        );
     }
}
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