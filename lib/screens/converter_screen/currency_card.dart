import 'package:first/data/model/callbacks.dart';
import 'package:first/data/model/currency.dart';
import 'package:first/screens/currencies_screen/currencies_screen.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatefulWidget {
  const CurrencyCard({Key? key, required this.currency, required this.onChanged}) : super(key: key);
  final Currency currency;
  final CurrencyCallback onChanged;

  @override
  State<CurrencyCard> createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {

  var controller = TextEditingController();

  void _onChangeCurrencyPressed(BuildContext context) async {
    var newCurrency = await Navigator.push(context,
        MaterialPageRoute(builder: (BuildContext context) => const CurrenciesScreen()));

    if (newCurrency != null) {
      widget.onChanged(newCurrency);
    }
  }

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
                    child: Image.network(widget.currency.flag, fit: BoxFit.cover,),
                ),
              ),
              title: Text(widget.currency.symbol),
              subtitle: Text(widget.currency.name),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: ()  {
                  _onChangeCurrencyPressed(context);
                },
              ),
            ),
            Padding(
              padding:
              const EdgeInsets.fromLTRB(16, 0, 5, 10),
              child: TextField(
                controller: controller,
                keyboardType: TextInputType.number,
                style:
                Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                  suffixIconConstraints:
                  const BoxConstraints(
                      minHeight: 18, minWidth: 18),
                  suffixText: widget.currency.icon,
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