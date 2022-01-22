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
  double rate1 = 0.00;
  double rate2 = 0.00;

  var input = TextEditingController();

  var output = TextEditingController();

  void updateText() {
    newText = '$dt';

    setState(() {});
  }

  @override
  void dispose() {
    currencyRepository.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    currencyRepository.loadCounter();
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
                      // initialData: Currency.euro(),
                      builder: (BuildContext context,
                          AsyncSnapshot<Currency> snapshot) {
                        if (snapshot.hasData) {
                          final one = snapshot.data!;
                          rate1=one.rateToUah;
                          return Card(
                            child: Padding(
                              padding: const EdgeInsets.fromLTRB(5, 30, 5, 30),
                              child: Column(
                                children: [
                                  Text((currencyRepository.count1).toString()),
                                  ListTile(
                                    leading: SizedBox(
                                      height: 70,
                                      width: 70,
                                      child: Card(
                                          clipBehavior: Clip.antiAlias,
                                          child: one.flag),
                                    ),
                                    title: Text(one.symbol),
                                    subtitle: Text(one.name),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.arrow_forward_ios),
                                      onPressed: () {
                                        currencyRepository
                                            .inputEventController.sink
                                            .add(Event.event_1);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 0, 5, 10),
                                    child: TextField(

                                      controller: input,
                                      keyboardType: TextInputType.number,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                      decoration: InputDecoration(
                                        suffixIconConstraints:
                                            const BoxConstraints(
                                                minHeight: 18, minWidth: 18),
                                        suffixIcon: one.icon,
                                        hintText: '0.00',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headline5,
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
                          onPressed: () {
                            currencyRepository.inputEventController.sink
                                .add(Event.event_4);
                            (input.text=='')?input.text='0':input.text=input.text;
                            output.text = (double.parse(input.text) * rate1 / rate2).toString();
                          },
                          style: ElevatedButton.styleFrom(
                            padding: const EdgeInsets.all(8),
                          ),
                          child:
                              const Text('=', style: TextStyle(fontSize: 30)),
                        ),
                        ElevatedButton(
                          onPressed: () {
                            currencyRepository.inputEventController.sink
                                .add(Event.event_3);

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
                      builder: (BuildContext context,
                          AsyncSnapshot<Currency> snapshot) {
                        if (snapshot.hasData) {
                          final two = snapshot.data!;
                          rate2=two.rateToUah;

                          return Card(
                            child: Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(10, 30, 10, 30),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Text((currencyRepository.count2).toString()),
                                  ListTile(
                                    horizontalTitleGap: 20,
                                    leading: SizedBox(
                                      height: 70,
                                      width: 70,
                                      child: Card(
                                          clipBehavior: Clip.antiAlias,
                                          child: two.flag),
                                    ),
                                    title: Text(two.symbol),
                                    subtitle: Text(two.name),
                                    trailing: IconButton(
                                      icon: const Icon(Icons.arrow_forward_ios),
                                      onPressed: () {
                                        currencyRepository
                                            .inputEventController.sink
                                            .add(Event.event_2);
                                      },
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsets.fromLTRB(16, 0, 5, 10),
                                    child: TextField(
                                      readOnly: true,
                                      controller: output,
                                      keyboardType: TextInputType.number,
                                      style:
                                          Theme.of(context).textTheme.headline5,
                                      decoration: InputDecoration(
                                        suffixIconConstraints:
                                            const BoxConstraints(
                                                minHeight: 20, minWidth: 20),
                                        suffixIcon: two.icon,
                                        hintText: '0.00',
                                        hintStyle: Theme.of(context)
                                            .textTheme
                                            .headline5,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }
                        return const CircularProgressIndicator();
                      }),
                ],
              ),
            );
  }
}
