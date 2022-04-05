import 'package:first/util/callbacks.dart';
import 'package:first/domain/entities/currency_entity.dart';
import 'package:first/presentation/currencies_screen/currencies_screen.dart';
import 'package:flutter/material.dart';

class CurrencyCard extends StatefulWidget {
  const CurrencyCard(
      {Key? key,
      required this.currency,
      required this.onChanged,
      required this.controller,
      required this.onInputValueChanged})
      : super(key: key);
  final CurrencyEntity currency;
  final TextEditingController controller;
  final CurrencyCallback onChanged;
  final InputValueChangedCallback onInputValueChanged;

  @override
  State<CurrencyCard> createState() => _CurrencyCardState();
}

class _CurrencyCardState extends State<CurrencyCard> {
  void _onChangeCurrencyPressed(BuildContext context) async {
    var newCurrency = await Navigator.push(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => const CurrenciesScreen()));

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
                  child: Image.network(
                    widget.currency.flag,
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              title: Text(widget.currency.symbol),
              subtitle: Text(widget.currency.name),
              trailing: IconButton(
                icon: const Icon(Icons.arrow_forward_ios),
                onPressed: () {
                  _onChangeCurrencyPressed(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 0, 5, 10),
              child: TextField(
                onChanged: widget.onInputValueChanged,
                controller: widget.controller,
                keyboardType: TextInputType.number,
                style: Theme.of(context).textTheme.headline5,
                decoration: InputDecoration(
                  suffixIconConstraints:
                      const BoxConstraints(minHeight: 18, minWidth: 18),
                  suffixText: widget.currency.icon,
                  hintText: '0.00',
                  hintStyle: Theme.of(context).textTheme.headline5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}