
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen ({Key? key}): super (key:key);

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}
class SettingsScreenState extends State <SettingsScreen> {
  String dropdownValue = '15 sec';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
            icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text('Setting'),
        centerTitle: true,
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: (){
              Navigator.pop(context, true);
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            height: 75,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              shadows: const [BoxShadow(
                  color: Colors.grey,
                blurRadius: 1,
                offset: Offset(-1, 2)
              )],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                Expanded(flex: 3, child: Text('Theme', style: Theme.of(context).textTheme.headline6,)),
              Expanded(
                child: TextButton(
                  style: TextButton.styleFrom(
                    fixedSize: const Size(110, 40),
                    shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Colors.grey, width: 0.5)
                    ),
                  ),
                  child: const Text('Light', style: TextStyle(fontWeight: FontWeight.bold)),
                  onPressed: () {},
                ),
              ),
        ],
            ),
          ),
          Container(
            height: 75,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              shadows: const [BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                  offset: Offset(-1, 2)
              )],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: Text('Update Interval', style: Theme.of(context).textTheme.headline6)),
                Expanded(
                  child: DropdownButton<String>(
                    value: dropdownValue,
                    style: const TextStyle(),
                    elevation: 16,
                    onChanged: (String? newValue) {
                      setState(() {
                        dropdownValue = newValue!;
                      });
                    },
                    items: <String>['15 sec', '30 sec', '1 min']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 75,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.fromLTRB(20, 15, 20, 15),
            decoration: ShapeDecoration(
              color: Colors.white,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
              shadows: const [BoxShadow(
                  color: Colors.grey,
                  blurRadius: 1,
                  offset: Offset(-1, 2)
              )],
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 3, child: Text('Language', style: Theme.of(context).textTheme.headline6)),
                Expanded(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: const Size(110, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Colors.grey, width: 0.5)
                      ),
                    ),
                    child: const Text('English', style: TextStyle(fontWeight: FontWeight.bold)),
                    onPressed: () {},
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}