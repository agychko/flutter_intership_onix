import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen ({Key? key}): super (key:key);

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}
class SettingsScreenState extends State <SettingsScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading:  IconButton(
            icon: const Icon(Icons.arrow_back),
          onPressed: () {},
        ),
        title: const Text('Setting'),
        actions: [
          IconButton(
            icon: const Icon(Icons.done),
            onPressed: (){},
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
                  child: TextButton(
                    style: TextButton.styleFrom(
                      fixedSize: const Size(110, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                          side: const BorderSide(color: Colors.grey, width: 0.5)
                      ),
                    ),
                    child: const Text('30 Min', style: TextStyle(fontWeight: FontWeight.bold)),
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