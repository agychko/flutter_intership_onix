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
        appBarTheme: const AppBarTheme(
            backgroundColor: Color.fromRGBO(0, 60, 143, 1)
        ),
        scaffoldBackgroundColor: const Color.fromRGBO(236, 239, 241, 1),
        bottomNavigationBarTheme: const BottomNavigationBarThemeData(
          backgroundColor: Color.fromRGBO(0, 60, 143, 1),
          unselectedItemColor: Color.fromRGBO(66, 165, 245, 1),
          selectedItemColor: Color.fromRGBO(255, 255, 255, 1),
        ),
        cardTheme: const CardTheme(
          color: Color.fromRGBO(33, 150, 243, 1),
        ),
      ),
      home: const MyScreen(),
    );
  }
}
