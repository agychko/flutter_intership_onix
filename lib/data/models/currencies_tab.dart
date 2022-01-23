
import 'package:first/data/models/currency.dart';
import 'package:first/data/models/currency_repository.dart';
import 'package:first/data/models/my_screen.dart';
import 'package:flutter/material.dart';


class CurrenciesTab extends StatefulWidget {
  const CurrenciesTab ({Key? key}) : super(key: key);

  @override
  State<CurrenciesTab> createState() => CurrenciesTabState();
}
class CurrenciesTabState extends State<CurrenciesTab> {
  final currencyRepository = CurrencyRepository();
  final myScreen = MyScreenState();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<List<Currency>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Could not load currencies',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }  if (snapshot.hasData) {
              return
                ListView.separated(
                  separatorBuilder: (context, index)=>const Divider(
                    color: Colors.grey, height: 40, thickness: 0.5, indent: 20, endIndent: 20,
                  ),
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index){
                    final currency = snapshot.data![index];
                    return ListTile(
                      leading: SizedBox(
                        width: 70, height: 70,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: currency.flag,
                        ),
                      ),
                      title: Text(currency.name),
                      subtitle: Text(currency.symbol),
                      trailing: IconButton(
                          icon: const Icon(Icons.arrow_forward_ios),
                        onPressed:(){

                        },
                      ),
                    );
                  }
              );
            }
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: currencyRepository.getData(),
    );
  }
}