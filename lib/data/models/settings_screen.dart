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

      ),
      body: Column(
        children: [
          Card(
            color: Colors.white,
            child: Row(
                children: [
                const Text('Theme'),
              ElevatedButton(
                child: const Text('Light'),
                onPressed: () {},
              ),
        ],
            ),
          ),
          Card(
            color: Colors.white,
            child: Row(
              children: [
                const Text('Update Interval'),
                ElevatedButton(
                  child: const Text('30 Min'),
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Card(
            color: Colors.white,
            child: Row(
              children: [
                const Text('Language'),
                ElevatedButton(
                  child: const Text('English'),
                  onPressed: () {},
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}