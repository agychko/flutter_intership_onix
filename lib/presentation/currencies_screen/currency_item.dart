import 'package:first/util/callbacks.dart';
import 'package:first/domain/entities/currency_entity.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrencyItem extends StatelessWidget {
  const CurrencyItem(
      {Key? key, required this.currency, required this.onSelected})
      : super(key: key);
  final CurrencyEntity currency;
  final CurrencyCallback onSelected;

  @override
  Widget build(BuildContext context) {
    String currencyName = '';
    if (currency.id == 0) {
      currencyName = AppLocalizations.of(context)!.currencyUAH;
    }
    if (currency.id == 1) {
      currencyName = AppLocalizations.of(context)!.currencyEUR;
    }
    if (currency.id == 2) {
      currencyName = AppLocalizations.of(context)!.currencyUSD;
    }
    if (currency.id == 3) {
      currencyName = AppLocalizations.of(context)!.currencyPLN;
    }
    if (currency.id == 4) {
      currencyName = AppLocalizations.of(context)!.currencyCZK;
    }
    if (currency.id == 5) {
      currencyName = AppLocalizations.of(context)!.currencyRUB;
    }
    if (currency.id == 6) {
      currencyName = AppLocalizations.of(context)!.currencyGBR;
    }
    if (currency.id == 7) {
      currencyName = AppLocalizations.of(context)!.currencyCAD;
    }
    if (currency.id == 8) {
      currencyName = AppLocalizations.of(context)!.currencyAUD;
    }
    if (currency.id == 9) {
      currencyName = AppLocalizations.of(context)!.currencyJPY;
    }
    if (currency.id == 10) {
      currencyName = AppLocalizations.of(context)!.currencyCNY;
    }
    return ListTile(
      leading: SizedBox(
        width: 70,
        height: 70,
        child: Card(
          clipBehavior: Clip.antiAlias,
          child: Image.network(currency.flag, fit: BoxFit.fill),
        ),
      ),
      title: Text('$currencyName (${currency.symbol})'),
      subtitle: Text(
          '1 EUR = ${currency.rate.toStringAsFixed(2)} ${currency.symbol}'),
      trailing: IconButton(
        icon: const Icon(Icons.arrow_forward_ios),
        onPressed: () {
          Navigator.pop(context, currency);
        },
      ),
    );
  }
}
