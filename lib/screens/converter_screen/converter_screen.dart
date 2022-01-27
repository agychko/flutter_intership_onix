import 'package:first/screens/converter_screen/converter_screen_provider.dart';
import 'package:first/screens/converter_screen/currency_card.dart';
import 'package:first/screens/settings_screen/settings_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ConverterScreen extends StatefulWidget {
  const ConverterScreen({Key? key}) : super(key: key);

  @override
  State<ConverterScreen> createState() => ConverterScreenState();
}

class ConverterScreenState extends State<ConverterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('Converter'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.update),
          onPressed: () {

          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (BuildContext context) => const SettingsScreen()),
              );
            },
          ),
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: <Widget>[
              const SizedBox(height: 40),
              Consumer<ConverterScreenProvider>(
                builder: (context, provider, child) {
                  if (provider.isLoading) {
                    return
                      Container();
                    // const CircularProgressIndicator();
                  }
                  return
                  CurrencyCard(currency:provider.converter.currencyTop,
                    controller: provider.topController,
                    onChanged: (currency) {
                    provider.currencyTopChanged(currency);
                    },);
                }
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 30, 0, 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<ConverterScreenProvider>(context, listen: false).convert();
                      },
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.all(8),
                      ),
                      child: const Text('=', style: TextStyle(fontSize: 30)),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Provider.of<ConverterScreenProvider>(context, listen: false).switchCurrencies();
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
              Consumer<ConverterScreenProvider>(
                  builder: (context, provider, child) {
                    if (provider.isLoading) {
                      return
                        // Container();
                      const CircularProgressIndicator();
                    }
                    return
                      CurrencyCard(currency:provider.converter.currencyDown,
                        controller: provider.bottomController,
                        onChanged: (currency ) {
                        provider.currencyDownChanged(currency);
                        },
                      );
                  }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
