import 'package:first/presentation/settings_screen/settings_bloc/settings_bloc.dart';
import 'package:first/presentation/settings_screen/settings_menu_item.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'language_bloc/language_cubit.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({Key? key}) : super(key: key);

  @override
  State<SettingsScreen> createState() => SettingsScreenState();
}

class SettingsScreenState extends State<SettingsScreen> {
  int theme = 1;

  @override
  Widget build(BuildContext context) {
    int languageIndex = 0;
    var currentLocale = Localizations.localeOf(context);
    if (currentLocale.languageCode == 'ar') {
      languageIndex = 0;
    }
    if (currentLocale.languageCode == 'en') {
      languageIndex = 1;
    }
    if (currentLocale.languageCode == 'uk') {
      languageIndex = 2;
    }
    return BlocProvider(
      create: (context) => SettingsBloc(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          title: Text(AppLocalizations.of(context)!.settingsTitle),
          centerTitle: true,
          actions: [
            IconButton(
              icon: const Icon(Icons.done),
              onPressed: () {
                Navigator.pop(context, true);
              },
            ),
          ],
        ),
        body: Column(
          children: [
            SettingsMenuItem(
              nameMenuItem: AppLocalizations.of(context)!.settingsTheme,
              dropdownValue: theme,
              dropdownItem: const [
                DropdownMenuItem(
                  value: 1,
                  child: Text('Light'),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text('Dark'),
                ),
              ],
              onChanged: (newValue) {
                setState(() {
                  theme = newValue!;
                });
              },
            ),
            BlocBuilder<SettingsBloc, SettingsState>(builder: (context, state) {
              return SettingsMenuItem(
                nameMenuItem:
                    AppLocalizations.of(context)!.settingsUpdateInterval,
                dropdownItem: const [
                  DropdownMenuItem(
                    value: 15,
                    child: Text('15 sec'),
                  ),
                  DropdownMenuItem(
                    value: 30,
                    child: Text('30 sec'),
                  ),
                  DropdownMenuItem(
                    value: 60,
                    child: Text('1 min'),
                  )
                ],
                dropdownValue: context.read<SettingsBloc>().updateInterval,
                onChanged: (newValue) {
                  setState(() {
                    context.read<SettingsBloc>().updateInterval = newValue!;
                    var initialTime = DateTime.now().millisecondsSinceEpoch;
                    context
                        .read<SettingsBloc>()
                        .add(UpdateTimeInterval(newValue, initialTime));
                  });
                },
              );
            }),
            SettingsMenuItem(
              nameMenuItem: AppLocalizations.of(context)!.settingsLanguage,
              dropdownValue: languageIndex,
              // context.read<LanguageState>().code,
              dropdownItem: [
                DropdownMenuItem(
                  value: 0,
                  child: Text(_getLanguageName(
                      context,
                      AppLocalizations.supportedLocales
                          .elementAt(0)
                          .languageCode)),
                ),
                DropdownMenuItem(
                  value: 1,
                  child: Text(_getLanguageName(
                      context,
                      AppLocalizations.supportedLocales
                          .elementAt(1)
                          .languageCode)),
                ),
                DropdownMenuItem(
                  value: 2,
                  child: Text(_getLanguageName(
                      context,
                      AppLocalizations.supportedLocales
                          .elementAt(2)
                          .languageCode)),
                ),
              ],
              onChanged: (newValue) {
                setState(() {
                  languageIndex = newValue!;
                  String code = AppLocalizations.supportedLocales
                      .elementAt(languageIndex)
                      .languageCode;
                  context.read<LanguageCubit>().changeLanguage(code);
                });
              },
            ),
          ],
        ),
      ),
    );
  }

  String _getLanguageName(BuildContext context, String code) {
    switch (code) {
      case 'ar':
        return AppLocalizations.of(context)!.langArabic;
      case 'en':
        return AppLocalizations.of(context)!.langEnglish;
      case 'uk':
        return AppLocalizations.of(context)!.langUkrainian;
    }
    return '';
  }
}
