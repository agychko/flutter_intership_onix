import 'package:first/data/models/currency.dart';
import 'package:flutter/material.dart';

class CurrenciesTab extends StatefulWidget {
  const CurrenciesTab ({Key? key}) : super(key: key);

  @override
  State<CurrenciesTab> createState() => CurrenciesTabState();
}

class CurrenciesTabState extends State<CurrenciesTab> {

  List <Currency> currencsies = [Currency.euro(),Currency.usd(),Currency.uah()];
  @override
  Widget build(BuildContext context) {
    return Container (
      color: Colors.blue,
      child: ListView.builder(
          itemCount: 3,
          itemBuilder: (context, index){
            return Card(
              color: Colors.white,
              child: ListTile(
                leading: currencsies[index].flag,
               title: Text(currencsies[index].name),
               subtitle: Text(currencsies[index].symbol),
                trailing: const Icon(Icons.arrow_forward_ios),
              ),
            );
          }
      ),
    );
  }
}

