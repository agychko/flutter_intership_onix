
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
          shadows: const [ BoxShadow(spreadRadius: 2, blurRadius: 7, offset: Offset(0, 3)),],
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(25),
              // side: const BorderSide(color:Colors.blue, width: 4.0, style: BorderStyle.solid)
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
          const SizedBox(height: 30),
          Card(
             child: Column(
            children:[ ListTile(
            leading: Image.network ('https://upload.wikimedia.org/wikipedia/commons/thumb/b/b7/Flag_of_Europe.svg/255px-Flag_of_Europe.svg.png', width: 75, height: 100, fit:BoxFit.fill),
              title: const Text('EUR'),
              subtitle: const Text('Euro'),
              trailing: const Icon(Icons.arrow_forward_ios),
              minVerticalPadding: 25,
              minLeadingWidth: 100,
              ),
              const TextField(
              decoration: InputDecoration(
              suffixIcon: Icon(Icons.euro),
              ),
            ),
            ],
            mainAxisAlignment: MainAxisAlignment.spaceAround,
             ),
             margin: const EdgeInsets.all(20),
            color: Colors.white,
            elevation: 10,
            ),
          const SizedBox(height: 30),
          Card(
            child: Column(
              children:[ ListTile(
                leading: Image.network ('https://flagcdn.com/w160/us.jpg', width: 75, height: 100, fit:BoxFit.fill),
                title: const Text('USD'),
                subtitle: const Text('American Dollar'),
                trailing: const Icon(Icons.arrow_forward_ios),
                minVerticalPadding: 25,
                minLeadingWidth: 100,
              ),
                const TextField(
                  decoration: InputDecoration(
                    suffixIcon: Icon(Icons.attach_money),
                  ),
                ),
              ],
              mainAxisAlignment: MainAxisAlignment.spaceAround,
            ),
            margin: const EdgeInsets.all(20),
            color: Colors.white,
            elevation: 10,
          ),
      ],
    ),
    );
  }
}