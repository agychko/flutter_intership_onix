import 'package:first/data/models/currency.dart';
import 'package:flutter/material.dart';
import 'currency_repository.dart';

class MyText extends StatefulWidget {
  const MyText({Key? key}) : super(key: key);

  @override
  State<MyText> createState() => MyTextState();
}

class MyTextState extends State<MyText> {
  final currencyRepository = CurrencyRepository();

  String newText = 'Hello!';
  DateTime dt = DateTime.now();
  int one = 0;
  int two = 1;
  int three = 2;


  void updateText() {
    newText = '$dt';
    setState(() {});
  }

  switchCurrency() {
    three = one;
    one = two;
    two = three;
    // (one == 0) ? one = 1 : one = 0;
    // (two == 0) ? two = 1 : two = 0;
    setState(() {});
  }

  @override
  void dispose() {
    currencyRepository.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: <Widget>[
          const SizedBox(height: 40),
          StreamBuilder(
              stream: currencyRepository.outputEventController1.stream,
              initialData: Currency.euro(),
              builder:
                  (BuildContext context, AsyncSnapshot<Currency> snapshot) {
                if (snapshot.hasData) {
                  final currency = snapshot.data!;

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
                                  child: currency.flag),
                            ),
                            title: Text(currency.symbol),
                            subtitle: Text(currency.name),
                            trailing: IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                currencyRepository.inputEventController.sink
                                    .add(Event.event_1);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 5, 10),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              style: Theme.of(context).textTheme.headline5,
                              decoration: InputDecoration(
                                suffixIconConstraints: const BoxConstraints(
                                    minHeight: 18, minWidth: 18),
                                suffixIcon: currency.icon,
                                hintText: '0.00',
                                hintStyle:
                                    Theme.of(context).textTheme.headline5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const LinearProgressIndicator();
              }),
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(8),
                  ),
                  child: const Text('=', style: TextStyle(fontSize: 30)),
                ),
                ElevatedButton(
                  onPressed: () {
                    switchCurrency();
                  },
                  style: ElevatedButton.styleFrom(
                    padding: const EdgeInsets.all(14),
                  ),
                  child: Row(
                    children: const [
                      Icon(Icons.import_export),
                      Text('Switch Currencies'),
                    ],
                  ),
                ),
              ],
            ),
          ),
          StreamBuilder(
              stream: currencyRepository.outputEventController2.stream,
              initialData: Currency.euro(),
              builder:
                  (BuildContext context, AsyncSnapshot<Currency> snapshot) {
                if (snapshot.hasData) {
                  final currency = snapshot.data!;

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(10, 30, 10, 30),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          ListTile(
                            horizontalTitleGap: 20,
                            leading: SizedBox(
                              height: 70,
                              width: 70,
                              child: Card(
                                  clipBehavior: Clip.antiAlias,
                                  child: currency.flag),
                            ),
                            title: Text(currency.symbol),
                            subtitle: Text(currency.name),
                            trailing: IconButton(
                              icon: const Icon(Icons.arrow_forward_ios),
                              onPressed: () {
                                currencyRepository.inputEventController.sink
                                    .add(Event.event_2);
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.fromLTRB(16, 0, 5, 10),
                            child: TextField(
                              keyboardType: TextInputType.number,
                              style: Theme.of(context).textTheme.headline5,
                              decoration: InputDecoration(
                                suffixIconConstraints: const BoxConstraints(
                                    minHeight: 20, minWidth: 20),
                                suffixIcon: currency.icon,
                                hintText: '0.00',
                                hintStyle:
                                    Theme.of(context).textTheme.headline5,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                }
                return const LinearProgressIndicator();
              }),
        ],
      ),
    );
  }
}
