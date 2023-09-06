import 'package:flutter/material.dart';
import 'package:portfolio/screens/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColorDark: const Color(0xFF2B2D42),
        primaryColorLight: const Color(0xFFEDF2F4),
        shadowColor: const Color(0xFF8D99AE),
        hintColor: const Color(0xFFEF233C),
        focusColor: const Color(0xFFD90429),
        useMaterial3: true,
        textTheme: const TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 55,
            fontWeight: FontWeight.w900,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Nunito',
            fontSize: 40,
            fontWeight: FontWeight.w400,
          ),
        ),
      ),
      home: const Home(),
    );
  }
}
