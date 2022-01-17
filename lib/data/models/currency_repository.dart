

import 'package:first/data/models/currency.dart';
import 'package:first/data/models/repository.dart';

class CurrencyRepository {

  List <Currency> currencies = [
    Currency.euro(),
    Currency.usd(),
    Currency.uah()
  ];

  Future<List<Repository>> getData() {
    return Future.delayed(const Duration(seconds: 2), () {
      return List.generate(
          3,
      (index)=>
      Repository(
          flag: currencies[index].flag,
          icon: currencies[index].icon,
          name: currencies[index].name,
          symbol: currencies[index].symbol,
          rateToUah: currencies[index].rateToUah
      )
      );
    });
    }
}