
import 'dart:async';
import 'package:first/data/models/currency.dart';

enum Event {event_1, event_2}

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
  final outputEventController1 = StreamController<Currency>();
  final outputEventController2 = StreamController<Currency>();

  int count1=0;
  int count2=0;

  Currency currency = Currency();

  void changeCurrency (Event event){
      if (event == Event.event_1) {
        count1++;
      }
      if ((count1%=3) == 0) {
        currency = Currency.euro();
      }
      if ((count1%=3) == 1) {
        currency = Currency.usd();
      }
      if ((count1%=3) == 2) {
        currency = Currency.uah();
      }
     outputEventController1.sink.add(currency);

    if (event == Event.event_2) {
      count2++;
    }
    if ((count2%=3) == 0) {
      currency = Currency.euro();
    }
    if ((count2%=3) == 1) {
      currency = Currency.usd();
    }
    if ((count2%=3) == 2) {
      currency = Currency.uah();
    }
    outputEventController2.sink.add(currency);
  }

  CurrencyRepository(){
    inputEventController.stream.listen(changeCurrency);
  }
  void dispose() {
    outputEventController1.close();
  }
  }
