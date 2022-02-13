
import 'package:first/screens/settings_screen/settings_bloc/settings_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen ({Key? key}): super (key:key);

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}
class SettingsScreenState extends State <SettingsScreen> {

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(),
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
            BlocBuilder<SettingsBloc, SettingsState>(
              builder: (context, state){
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
                      child: Container (
                        alignment: AlignmentDirectional.center,
                        decoration: ShapeDecoration(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                            side: const BorderSide(color: Colors.grey, width: 0.5)
                        ),
                    ),
                        child: DropdownButton(
                          value: context.read<SettingsBloc>().updateInterval,
                          underline: Container(),
                          alignment: AlignmentDirectional.centerEnd,
                          style: const TextStyle(color: Colors.blue, fontWeight: FontWeight.bold),
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
                              context.read<SettingsBloc>().updateInterval = newValue!;
                              var initialTime = DateTime.now().millisecondsSinceEpoch;
                              context.read<SettingsBloc>().add(UpdateTimeInterval(newValue, initialTime));
                            });
                          },
                        ),
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