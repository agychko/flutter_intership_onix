
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'settings_screen_provider.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen ({Key? key}): super (key:key);

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}
class SettingsScreenState extends State <SettingsScreen> {

  int _dropdownValue = 30;

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => SettingsScreenProvider(),
      child: Scaffold(
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
            Consumer <SettingsScreenProvider>(
              builder: (context, provider, child){
                // int _dropdownValue=provider.updateInterval;
              return Container(
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
                      child: DropdownButton(
                        value: _dropdownValue,
                        alignment: AlignmentDirectional.center,
                        items: const [
                          DropdownMenuItem(
                              child: Text('15 sec'),
                            value: 15,
                          ),
                          DropdownMenuItem(
                            child: Text('30 sec'),
                            value: 30,
                          ),
                          DropdownMenuItem(
                            child: Text('1 min'),
                            value: 60,
                          ),
                        ],
                        onChanged: (int? newValue) {
                          setState(() {
                            _dropdownValue = newValue!;
                            var initialTime = DateTime.now().millisecondsSinceEpoch;
                            provider.updateTimeInterval(_dropdownValue, initialTime);
                            // Provider.of<SettingsScreenProvider>(context, listen: false).updateTimeInterval(_dropdownValue, initialTime);
                          });
                        },
                      ),
                    ),
                  ],
                ),
              );
  }
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
      ),
    );
  }
}