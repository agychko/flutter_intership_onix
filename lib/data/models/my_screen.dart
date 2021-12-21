
import 'package:flutter/material.dart';
import 'my_text.dart';

final key = GlobalKey<MyTextState>();

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