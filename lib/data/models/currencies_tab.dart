import 'package:flutter/material.dart';

class CurrenciesTab extends StatefulWidget {
  const CurrenciesTab ({Key? key}) : super(key: key);

  @override
  State<CurrenciesTab> createState() => CurrenciesTabState();
}

class CurrenciesTabState extends State<CurrenciesTab> {
  @override
  Widget build(BuildContext context) {
    return Container (
      color: Colors.blue,
      child: ListView.builder(
          itemBuilder: (context, index){
            return Card(
              color: Colors.white,
              child: ListTile(
               title: Text('$index'),
               subtitle: const Text('asdddd'),
              ),
            );
          }
      ),
    );
  }
}

