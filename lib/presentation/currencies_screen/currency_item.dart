import 'package:first/data/model/callbacks.dart';
import 'package:first/data/model/currency.dart';
import 'package:flutter/material.dart';

class CurrencyItem extends StatelessWidget{
  const CurrencyItem({Key? key, required this.currency, required this.onSelected}) : super(key: key);
  final Currency currency;
  final CurrencyCallback onSelected;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: SizedBox(
        width: 70, height: 70,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Image.network(currency.flag, fit: BoxFit.fill),
        ),
      ),
      title: Text('${currency.name} (${currency.symbol})'),
      subtitle: Text('1 EUR = ${currency.rate.toStringAsFixed(2)} ${currency.symbol}'),
      trailing: IconButton(
        icon: const Icon(Icons.arrow_forward_ios),
        onPressed:(){
          Navigator.pop(context, currency);
        },
      ),
    );

  }

}