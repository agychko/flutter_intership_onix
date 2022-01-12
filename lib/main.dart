import 'package:flutter/material.dart';
import 'data/models/my_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: 'Montserrat',
        textTheme: const TextTheme(
          headline1: TextStyle(color: Color.fromRGBO(0, 60, 143, 1)),
          headline2: TextStyle(color: Color.fromRGBO(0, 60, 143, 1)),
          headline3: TextStyle(color: Color.fromRGBO(0, 60, 143, 1)),
          headline4: TextStyle(color: Color.fromRGBO(0, 60, 143, 1)),
          headline5: TextStyle(color: Color.fromRGBO(0, 60, 143, 1)),
          headline6: TextStyle(color: Color.fromRGBO(0, 60, 143, 1)),
          subtitle1:
              TextStyle(fontSize: 20, color: Color.fromRGBO(0, 60, 143, 1)),
          subtitle2: TextStyle(color: Color.fromRGBO(0, 60, 143, 1)),
          bodyText1: TextStyle(color: Color.fromRGBO(0, 60, 143, 1)),
          bodyText2: TextStyle(color: Color.fromRGBO(0, 60, 143, 1)),
          caption: TextStyle(color: Color.fromRGBO(0, 60, 143, 1)),
          button: TextStyle(color: Color.fromRGBO(0, 60, 143, 1)),
          overline: TextStyle(color: Color.fromRGBO(0, 60, 143, 1)),
        ),
        appBarTheme:
            const AppBarTheme(backgroundColor: Color.fromRGBO(0, 60, 143, 1)),
        scaffoldBackgroundColor: const Color.fromRGBO(236, 239, 241, 1),
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
            backgroundColor:
                MaterialStateProperty.all(const Color.fromRGBO(0, 60, 143, 1)),
            elevation: MaterialStateProperty.all(20),
          ),
        ),
      ),
      home: const MyScreen(),
    );
  }
}
