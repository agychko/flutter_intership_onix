// import 'package:first/presentation/converter_screen/converter_screen.dart';
import 'package:first/presentation/settings_screen/language_bloc/language_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// import 'presentation/converter_screen/converter_bloc/converter_bloc.dart';
import 'presentation/user_screen/user_bloc/user_bloc.dart';
import 'presentation/user_screen/user_screen.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LanguageCubit(),
      child: BlocBuilder<LanguageCubit, LanguageState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'Converter',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              primarySwatch: Colors.blue,
              textTheme: Theme.of(context).textTheme.apply(
                    bodyColor: const Color.fromRGBO(0, 60, 143, 1),
                    displayColor: const Color.fromRGBO(0, 60, 143, 1),
                    fontFamily: 'Montserrat',
                  ),
              appBarTheme: const AppBarTheme(
                  backgroundColor: Color.fromRGBO(0, 60, 143, 1)),
              bottomNavigationBarTheme: const BottomNavigationBarThemeData(
                backgroundColor: Color.fromRGBO(0, 60, 143, 1),
                unselectedItemColor: Color.fromRGBO(66, 165, 245, 1),
                selectedItemColor: Color.fromRGBO(255, 255, 255, 1),
              ),
              cardTheme: const CardTheme(
                color: Color.fromRGBO(255, 215, 0, 1),
                elevation: 10,
                shadowColor: Color.fromRGBO(0, 60, 143, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(8)),
                ),
              ),
              listTileTheme: const ListTileThemeData(
                iconColor: Color.fromRGBO(0, 60, 143, 1),
              ),
              inputDecorationTheme: const InputDecorationTheme(
                suffixIconColor: Color.fromRGBO(0, 60, 143, 1),
                prefixIconColor: Color.fromRGBO(0, 60, 143, 1),
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(0, 60, 143, 1)),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(0, 60, 143, 1)),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide(color: Color.fromRGBO(0, 60, 143, 1)),
                ),
              ),
              elevatedButtonTheme: ElevatedButtonThemeData(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(
                      const Color.fromRGBO(0, 60, 143, 1)),
                  elevation: MaterialStateProperty.all(20),
                ),
              ),
            ),
            localizationsDelegates: AppLocalizations.localizationsDelegates,
            localeResolutionCallback: (locale, supportedLocales) {
              return supportedLocales
                      .where((l) => (l.languageCode == locale?.languageCode))
                      .isNotEmpty
                  ? locale
                  : const Locale('en');
            },
            supportedLocales: AppLocalizations.supportedLocales,
            locale: Locale(state.code),
            home: BlocProvider(
                create: (context) => UserBloc(), child: const UserScreen()
                // create: (context) => ConverterBloc(), child: const ConverterScreen()
                ),
          );
        },
      ),
    );
  }
}
