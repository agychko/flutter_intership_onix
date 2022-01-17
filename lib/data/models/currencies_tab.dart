
import 'package:first/data/models/currency_repository.dart';
import 'package:first/data/models/repository.dart';
import 'package:flutter/material.dart';

class CurrenciesTab extends StatefulWidget {
  const CurrenciesTab ({Key? key}) : super(key: key);

  @override
  State<CurrenciesTab> createState() => CurrenciesTabState();
}
class CurrenciesTabState extends State<CurrenciesTab> {
  final currencyRepository = CurrencyRepository();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (BuildContext context, AsyncSnapshot<List<Repository>> snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError) {
              return const Center(
                child: Text(
                  'Could not load currencies',
                  style: TextStyle(fontSize: 20),
                ),
              );
            }  if (snapshot.hasData) {
              final repository = snapshot.data ?? [];
              if (repository.isEmpty) {
                return const Center(
                    child: Text(
                      'No currencies found',
                      style: TextStyle(fontSize: 20),
                    )
                );
              }
              return
                ListView.separated(
                  separatorBuilder: (context, index)=>const Divider(
                    color: Colors.grey, height: 40, thickness: 0.5, indent: 20, endIndent: 20,
                  ),
                  itemCount: repository.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: SizedBox(
                        width: 70, height: 70,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: repository[index].flag,
                        ),
                      ),
                      title: Text(repository[index].name),
                      subtitle: Text(repository[index].symbol),
                      trailing: const Icon(Icons.arrow_forward_ios),
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