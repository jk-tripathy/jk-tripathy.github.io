import 'dart:math';
import 'package:flutter/material.dart';
import 'package:portfolio/screens/landing_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final zoomPageTransitionsBuilder = const ZoomPageTransitionsBuilder(
    allowEnterRouteSnapshotting: false, // Disable entering route snapshotting
  );
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "JKT's Portfolio",
      theme: ThemeData(
        primaryColorDark: const Color(0xFF2B2D42),
        primaryColorLight: const Color(0xFFEDF2F4),
        shadowColor: const Color(0xFFB7BFCC),
        hintColor: const Color(0xFFEF233C),
        focusColor: const Color(0xFFD90429),
        useMaterial3: true,
        textTheme: TextTheme(
          headlineLarge: TextStyle(
            fontFamily: 'Nunito',
            fontSize: min(
              MediaQuery.of(context).size.height * 0.075,
              MediaQuery.of(context).size.width * 0.075,
            ),
            fontWeight: FontWeight.w900,
          ),
          headlineMedium: TextStyle(
            fontFamily: 'Nunito',
            fontSize: min(
              MediaQuery.of(context).size.height * 0.045,
              MediaQuery.of(context).size.width * 0.045,
            ),
            fontWeight: FontWeight.w400,
          ),
          labelMedium: TextStyle(
            fontFamily: 'Nunito',
            fontSize: min(
              MediaQuery.of(context).size.height * 0.02,
              MediaQuery.of(context).size.width * 0.03,
            ),
            fontWeight: FontWeight.w600,
          ),
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                fontFamily: 'Nunito',
                fontSize: min(
                  MediaQuery.of(context).size.height * 0.035,
                  MediaQuery.of(context).size.width * 0.04,
                ),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
        outlinedButtonTheme: OutlinedButtonThemeData(
          style: ButtonStyle(
            overlayColor: MaterialStateProperty.all<Color>(Colors.transparent),
            textStyle: MaterialStateProperty.all<TextStyle>(
              TextStyle(
                fontFamily: 'Nunito',
                fontSize: min(
                  MediaQuery.of(context).size.height * 0.03,
                  MediaQuery.of(context).size.width * 0.035,
                ),
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ),
      ),
      home: const LandingPage(),
    );
  }
}
