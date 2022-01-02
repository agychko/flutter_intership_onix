import 'package:first/data/models/currency.dart';
import 'package:flutter/material.dart';

class CurrenciesTab extends StatefulWidget {
  const CurrenciesTab ({Key? key}) : super(key: key);

  @override
  State<CurrenciesTab> createState() => CurrenciesTabState();
}

class CurrenciesTabState extends State<CurrenciesTab> {

  List <Currency> currencsies = [Currency.euro(),Currency.usd(),Currency.uah()];
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index)=>const Divider(
        color: Colors.grey, height: 40, thickness: 0.5, indent: 20, endIndent: 20,
      ),
        itemCount: currencsies.length,
        itemBuilder: (context, index){
          return ListTile(
            leading: SizedBox(
              width: 70, height: 60,
              child: Card(
                elevation: 18,
                clipBehavior: Clip.antiAlias,
                shape:const RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(8)),
                    ),
                child: currencsies[index].flag,
              ),
            ),
           title: Text(currencsies[index].name),
           subtitle: Text(currencsies[index].symbol),
            trailing: const Icon(Icons.arrow_forward_ios),
          );
        }
    );
  }
}

