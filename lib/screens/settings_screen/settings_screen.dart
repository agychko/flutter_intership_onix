import 'package:first/screens/settings_screen/settings_bloc/settings_bloc.dart';
import 'package:first/screens/settings_screen/settings_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {

  int language = 1;
  int theme = 1;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SettingsBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
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
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            SettingsMenuItem(
                nameMenuItem: 'Theme',
                dropdownValue: theme,
                dropdownItem: const [
                  DropdownMenuItem(
                    child: Text('Light'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                    child: Text('Dark'),
                    value: 2,
                  ),
                ],
                onChanged: (newValue){
                  setState(() {
                    theme = newValue!;
                  });
                },
            ),
            BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
              return SettingsMenuItem(
                nameMenuItem: 'Update Interval',
                  dropdownItem: const [
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
                    )
                  ],
                  dropdownValue: context.read<SettingsBloc>().updateInterval,
                  onChanged: (newValue) {
                    setState(() {
                      context.read<SettingsBloc>().updateInterval =
                      newValue!;
                      var initialTime =
                          DateTime.now().millisecondsSinceEpoch;
                      context.read<SettingsBloc>().add(
                          UpdateTimeInterval(newValue, initialTime));
                    });
                  },
              );
            }),
            SettingsMenuItem(
                nameMenuItem: 'Language',
                dropdownValue: language,
                dropdownItem: const [
                  DropdownMenuItem(
                      child: Text('English'),
                    value: 1,
                  ),
                  DropdownMenuItem(
                      child: Text('Русский'),
                    value: 2,
                  ),
                  DropdownMenuItem(
                      child: Text('Українська'),
                    value: 3,
                  ),
                ],
                onChanged: (newValue){
                  setState(() {
                    language = newValue!;
                  });
                },
            ),
          ],
        ),
      ),
    );
  }
}
