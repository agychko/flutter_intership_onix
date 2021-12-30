// ignore_for_file: avoid_print

import 'currency.dart';

class Wallet extends Currency {
  double amount = 0;

  Wallet();

  Wallet.usd() : super.usd();

  Wallet.euro() : super.euro();

  Wallet.uah() : super.uah();

  void addAmount(double a) {
    amount = amount + a;
    print("На рахунок гаманця $name додано $a $symbol");
  }

  void transferTo(Wallet wal, double b) {
    String w = wal.name;
    if (amount < b) {
      print("Недостатньо коштів. Операція неможлива");
    } else {
      amount = amount - b;
      wal.amount = wal.amount + b * rateToUah / wal.rateToUah;
      print("Переведено $b $symbol з гаманця $name на гаманець $w");
    }
  }

  void changeWalletCurrency(Wallet newCurrency) {
    String n = newCurrency.symbol;
    amount = amount * rateToUah / newCurrency.rateToUah;
    print("Валюту гаманця $symbol змінено на $n");
    symbol = newCurrency.symbol;
  }

  void getAmountFormatted() {
    print("Гаманець: $name - $amount $symbol");
  }
}
