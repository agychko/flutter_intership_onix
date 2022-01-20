

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

  final inputEventController = StreamController<Event>();
  final outputEventController = StreamController<Currency>();
  Currency change = Currency();
  void changeCurrency (Event event){
    if (event==Event.event_1) {change=Currency.euro();}
    else
    if (event==Event.event_2) {change=Currency.usd();}
    else
    if (event==Event.event_3) {change=Currency.uah();}
    else
    {throw Exception('Wrong Event Type');}
    outputEventController.sink.add(change);
  }
  CurrencyRepository(){
    inputEventController.stream.listen(changeCurrency);
  }
  void dispose() {
    inputEventController.close();
    outputEventController.close();
  }
  }
