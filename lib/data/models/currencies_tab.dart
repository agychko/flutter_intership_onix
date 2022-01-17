

import 'package:first/data/models/currency_repository.dart';
import 'package:flutter/material.dart';

class CurrenciesTab extends StatefulWidget {
  const CurrenciesTab ({Key? key}) : super(key: key);

  @override
  State<CurrenciesTab> createState() => CurrenciesTabState();
}

class CurrenciesTabState extends State<CurrenciesTab> {
  Future<CurrencyRepository> getData() {
    return Future.delayed(const Duration(seconds: 2), () {
      return CurrencyRepository();
    });
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
        builder: (context, snapshot) {

          if (snapshot.connectionState == ConnectionState.done) {

            if (snapshot.hasError) {
              return Center(
                child: Text(
                  '${snapshot.error} occured',
                  style: const TextStyle(fontSize: 18),
                ),
              );

            } else if (snapshot.hasData) {

              final data = snapshot.data;
              return Center (
                  child:
                  Text('$data', style: const TextStyle(fontSize: 18),),
                  // ListView.separated(
                  //   separatorBuilder: (context, index)=>const Divider(
                  //     color: Colors.grey, height: 40, thickness: 0.5, indent: 20, endIndent: 20,
                  //   ),
                  //   itemCount: 3,
                  //   itemBuilder: (context, index){
                  //     return ListTile(
                  //       leading: SizedBox(
                  //         width: 70, height: 70,
                  //         child: Card(
                  //           clipBehavior: Clip.antiAlias,
                  //           child: snapshot.data.,
                  //         ),
                  //       ),
                  //       title: Text(snapshot.data!.symbol[index]),
                  //       subtitle: Text(snapshot.data!.name[index]),
                  //       trailing: const Icon(Icons.arrow_forward_ios),
                  //     );
                  //   }
                  // ),
              );
            }
          }

          return const Center(
            child: CircularProgressIndicator(),
          );
        },
        future: getData(),
    );
  }
}