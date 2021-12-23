import 'package:flutter/material.dart';

class MyTab extends StatefulWidget {
  const MyTab ({Key? key}) : super(key: key);
  @override
  State<MyTab> createState() => MyTabState();
}
class MyTabState extends State<MyTab> {
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
      // child: Center(
          child: TextButton (
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children:const <Widget>[
            Icon(Icons.arrow_upward),
            SizedBox(width: 10),
            Text("Upload"),
           ],
          ),
            style: TextButton.styleFrom(
              alignment: Alignment.center,
              fixedSize: const Size.fromHeight(40),
              primary: Colors.white,
              backgroundColor: Colors.blue,
              shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(25))),
              textStyle: const TextStyle(
                leadingDistribution: TextLeadingDistribution.proportional,
                fontSize: 24,
              )
            ),
            onPressed: () {},
      ),
          // ),
          );
  }
}