
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


  final eventController = StreamController<List<Currency>>();
  final inputEventController = StreamController<Event>();
  final outputEventController = StreamController<Currency>();

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

     outputEventController.sink.add(currency);
  }

  CurrencyRepository(){
    eventController.sink.add(currencies);
    inputEventController.stream.listen(changeCurrency);
  }
  void dispose() {
    eventController.close();
  }
  }
