import 'package:first/data/model/currency.dart';
import 'package:first/screens/currencies_screen/currencies_screen.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatelessWidget {
  const CurrencyCard({Key? key, required this.currency}) : super(key: key);
  final Currency currency;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 30, 5, 30),
        child: Column(
          children: [
            ListTile(
              leading: SizedBox(
                height: 70,
                width: 70,
                child: Card(
                    clipBehavior: Clip.antiAlias,
                    child: Image.network(currency.flag, fit: BoxFit.cover,),
                ),
              ),
              title: Text(currency.symbol),
              subtitle: Text(currency.name),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context)=>const CurrenciesScreen()));

                },
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.fromLTRB(16, 0, 5, 10),
              child: TextField(
                // controller: input,
                keyboardType: TextInputType.number,
                style:
                Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                  suffixIconConstraints:
                  const BoxConstraints(
                      minHeight: 18, minWidth: 18),
                  suffixText: currency.icon,
                  hintText: '0.00',
                  hintStyle: Theme.of(context)
                      .textTheme
                      .headline5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

}