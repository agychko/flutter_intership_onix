

import 'package:flutter/material.dart';

class CurrenciesTab extends StatefulWidget {
  const CurrenciesTab ({Key? key}) : super(key: key);

  @override
  State<CurrenciesTab> createState() => CurrenciesTabState();
}

class CurrenciesTabState extends State<CurrenciesTab> {

  // List <Currency> currencies = [Currency.euro(),Currency.usd(),Currency.uah()];
  @override
  Widget build(BuildContext context) {
    return const Text('');
    //   return FutureBuilder (
    //     future: _calculation,
    //       builder: (BuildContext context, AsyncSnapshot <CurrencyRepository> snapshot) {
    //           if (snapshot.hasError) {
    //             return const Text('Error');
    //           }
    //           if (snapshot.hasData) {
    //             // return ListView.separated(
    //             //     separatorBuilder: (context, index)=>const Divider(
    //             //       color: Colors.grey, height: 40, thickness: 0.5, indent: 20, endIndent: 20,
    //             //     ),
    //             //     itemCount: 3,
    //             //     itemBuilder: (context, index){
    //             //       return ListTile(
    //             //         leading: SizedBox(
    //             //           width: 70, height: 70,
    //             //           child: Card(
    //             //             clipBehavior: Clip.antiAlias,
    //             //             child: Image.network(snapshot.data!.euro[0]),
    //             //           ),
    //             //         ),
    //             //         title: Text(snapshot.data!.euro[1]),
    //             //         subtitle: Text(snapshot.data!.euro[0]),
    //             //         trailing: const Icon(Icons.arrow_forward_ios),
    //             //       );
    //                 // }
    //             // );;
    //           }
    //           else {
    //             return const Text('Loading...');
    //           }
    //       },
    //   );
    // }
    // final Future<CurrencyRepository> _calculation = Future<CurrencyRepository>.delayed(const Duration(seconds: 2),
    //       ()=> context,
    // );
  }

}