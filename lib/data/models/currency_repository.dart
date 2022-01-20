
import 'dart:async';
import 'package:first/data/models/currency.dart';
import 'package:shared_preferences/shared_preferences.dart';

enum Event {event_1, event_2, event_3, event_4}

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
  int count2=1;
  int count3=2;



  Currency currency1 = Currency();
  Currency currency2 = Currency();

  void changeCurrency (Event event) async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    count1 = ((prefs1.getInt('counter') ?? 0) + 1);
    prefs1.setInt('counter', count1);

    SharedPreferences prefs2 = await SharedPreferences.getInstance();
    count2 = ((prefs2.getInt('counter') ?? 0) + 1);
    prefs2.setInt('counter', count2);

    if (event == Event.event_1) {
        count1++;

        if ((count1%3) == 0) {
          currency1 = Currency.euro();
        }
        if ((count1%3) == 1) {
          currency1 = Currency.usd();
        }
        if ((count1%3) == 2) {
          currency1 = Currency.uah();
        }
        outputEventController1.sink.add(currency1);
      }


    if (event == Event.event_2) {
      count2++;
      if ((count2%3) == 0) {
        currency2 = Currency.euro();
      }
      if ((count2%3) == 1) {
        currency2 = Currency.usd();
      }
      if ((count2%3) == 2) {
        currency2 = Currency.uah();
      }
      outputEventController2.sink.add(currency2);
    }

      if (event == Event.event_3) {
        count3=count2;
        count2=count1;
        count1=count3;
        if ((count2%3) == 0) {
          currency2 = Currency.euro();
        }
        if ((count2%3) == 1) {
          currency2 = Currency.usd();
        }
        if ((count2%3) == 2) {
          currency2 = Currency.uah();
        }
        outputEventController2.sink.add(currency2);
      }

      if (event == Event.event_3) {
        count1=count3;
        if ((count1%3) == 0) {
          currency1 = Currency.euro();
        }
        if ((count1%3) == 1) {
          currency1 = Currency.usd();
        }
        if ((count1%3) == 2) {
          currency1 = Currency.uah();
        }
        outputEventController1.sink.add(currency1);
      }
  }

  CurrencyRepository(){
    inputEventController.stream.listen(changeCurrency);
  }
  void dispose() {
    outputEventController1.close();
    inputEventController.close();
  }

  void incrementCounter() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

      count1 = ((prefs.getInt('counter') ?? 0) + 1);
      prefs.setInt('counter', count1);

  }

  }


