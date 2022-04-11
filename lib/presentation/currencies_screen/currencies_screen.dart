import 'package:first/presentation/currencies_screen/currencies_bloc/currencies_bloc.dart';
import 'package:first/presentation/currencies_screen/currency_item.dart';
import 'package:first/util/error_message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CurrenciesScreen extends StatefulWidget {
  const CurrenciesScreen({Key? key}) : super(key: key);

  @override
  State<CurrenciesScreen> createState() => CurrenciesScreenState();
}

class CurrenciesScreenState extends State<CurrenciesScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CurrenciesBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(AppLocalizations.of(context)!.currenciesTitle),
          centerTitle: true,
        ),
        body: BlocBuilder<CurrenciesBloc, CurrenciesState>(
          // listener: (context, state) {},
          builder: (context, state) {
            if (state is CurrenciesLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is CurrenciesError) {
              return ErrorMessage(
                error: state.error,
                onTap: () =>
                    context.read<CurrenciesBloc>().add(GetCurrencyList()),
              );
            }
            if (state is CurrenciesSuccess) {
              if (state.currencies.isEmpty) {
                return const Center(child: Text('No Currencies Found'));
              }
              return ListView.separated(
                  separatorBuilder: (context, index) => const Divider(
                        color: Colors.grey,
                        height: 40,
                        thickness: 0.5,
                        indent: 20,
                        endIndent: 20,
                      ),
                  itemCount: state.currencies.length,
                  itemBuilder: (context, index) {
                    return CurrencyItem(
                      currency: state.currencies[index],
                      onSelected: (currency) {
                        Navigator.pop(context, currency);
                      },
                    );
                  });
            }
            return const Text('404');
          },
        ),
      ),
    );
  }
}
