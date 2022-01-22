
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
  int count2=0;
  int count3=0;

  void loadCounter(){
      changeCurrency(Event.event_1);
      changeCurrency(Event.event_2);
  }
  void changeCurrency (Event event) async {
    SharedPreferences prefs1 = await SharedPreferences.getInstance();
    SharedPreferences prefs2 = await SharedPreferences.getInstance();

    if (event == Event.event_1) {
      count1 = ((prefs1.getInt('counter1') ?? 0) + 1);
      prefs1.setInt('counter1', count1);
      outputEventController1.sink.add(currencies[count1%3]);
      }

    if (event == Event.event_2) {
      count2 = ((prefs2.getInt('counter2') ?? 0) + 1);
      prefs2.setInt('counter2', count2);
      outputEventController2.sink.add(currencies[count2%3]);
    }

      if (event == Event.event_3) {
        outputEventController1.sink.add(currencies[count2%3]);
        outputEventController2.sink.add(currencies[count1%3]);

        count3=count2;
        count2=count1;
        prefs2.setInt('counter2', count2);

        count1=count3;
        prefs1.setInt('counter1', count1);

      }

  }

  CurrencyRepository(){
    inputEventController.stream.listen(changeCurrency);
  }
  void dispose() {
    outputEventController1.close();
    inputEventController.close();
  }

  }

