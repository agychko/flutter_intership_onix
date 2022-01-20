
import 'dart:async';
import 'package:first/data/models/currency.dart';

enum Event {event_1, event_2, event_3}

class CurrencyRepository {

  List <Currency> currencies = [
    Currency.euro(),
    Currency.usd(),
    Currency.uah()
  ];

  Future<List<Currency>> getData() {
    return Future.delayed(const Duration(milliseconds: 500), () {
      return List.generate(
          3,
      (index)=>currencies[index]
      );
    });
    }


  final eventController = StreamController<List<Currency>>();

  CurrencyRepository(){
    eventController.sink.add(currencies);
  }
  void dispose() {
    eventController.close();
  }
  }
