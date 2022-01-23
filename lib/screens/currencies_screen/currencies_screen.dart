
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'currencies_screen_provider.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen ({Key? key}) : super(key: key);

  @override
  State<CurrenciesScreen> createState() => CurrenciesScreenState();
}
class CurrenciesScreenState extends State<CurrenciesScreen> {


  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CurrenciesScreenProvider(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Currencies'),
        ),

        body: Consumer<CurrenciesScreenProvider>(
          builder: (context, provider, child) {
            if (provider.isLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (provider.currencies.isEmpty) {
              return const Center(child: Text('No Currencies Found'));
            }
            return
              ListView.separated(
                  separatorBuilder: (context, index)=>const Divider(
                    color: Colors.grey, height: 40, thickness: 0.5, indent: 20, endIndent: 20,
                  ),
                  itemCount: provider.currencies.length,
                  itemBuilder: (context, index){
                    return ListTile(
                      leading: SizedBox(
                        width: 70, height: 70,
                        child: Card(
                          clipBehavior: Clip.antiAlias,
                          child: Image.network(provider.currencies[index].flag, fit: BoxFit.fill),
                        ),
                      ),
                      title: Text(provider.currencies[index].name),
                      subtitle: Text(provider.currencies[index].symbol),
                      trailing: IconButton(
                        icon: const Icon(Icons.arrow_forward_ios),
                        onPressed:(){

                        },
                      ),
                    );
                  }
              );
          },
        ),
      ),
    );
  }
}